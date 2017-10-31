<?php

namespace App\Http\Controllers;

use App\Employee;
use App\Http\Controllers\Controller;
use App\Audit;
use App\Organization;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;
use Mail;
use App\Mail\Payslip;
use PDF;

class payslipEmailController extends Controller {

    /**
     * Display a listing of branches
     *
     * @return Response
     */
    public function index()
    {
        $employees = Employee::all();
        return view('payslips.index',compact('employees'));
    }

    public function sendEmail()
    {
        if(!empty(Input::get('sel'))){
        $check = DB::table('transact')
            ->join('employee', 'transact.employee_id', '=', 'employee.personal_file_number')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('in_employment','Y')
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->count();
        if($check == 0){
          return Redirect::back()->with('errors', 'Payslip for period '.Input::get('period').' is not available!');
        }else{
        $period = Input::get('period');
        $employees = DB::table('transact')
            ->join('employee', 'transact.employee_id', '=', 'employee.personal_file_number')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('in_employment','Y')
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->get();
        //$employees = Employee::where('in_employment','Y')->get();
       
        $emps = DB::table('employee')->count();

        foreach ($employees as $employee) {
  

        $transact = DB::table('transact')
            ->join('employee', 'transact.employee_id', '=', 'employee.personal_file_number')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->first(); 

        $nontaxables = DB::table('transact_nontaxables')
            ->join('employee', 'transact_nontaxables.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('nontaxable_name')
            ->select('nontaxable_name',DB::raw('COALESCE(sum(nontaxable_amount),0.00) as nontaxable_amount'))
            ->get(); 

        $allws = DB::table('transact_allowances')
            ->join('employee', 'transact_allowances.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('allowance_name')
            ->select('allowance_name',DB::raw('COALESCE(sum(allowance_amount),0.00) as allowance_amount'))
            ->get(); 

        $earnings = DB::table('transact_earnings')
            ->join('employee', 'transact_earnings.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('earning_name')
            ->select('earning_name',DB::raw('COALESCE(sum(earning_amount),0.00) as earning_amount'))
            ->get(); 

        $deds = DB::table('transact_deductions')
            ->join('employee', 'transact_deductions.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('deduction_name')
            ->select('deduction_name',DB::raw('COALESCE(sum(deduction_amount),0.00) as deduction_amount'))
            ->get(); 

        $overtimes = DB::table('transact_overtimes')
            ->join('employee', 'transact_overtimes.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('overtime_type')
            ->select('overtime_type',DB::raw('COALESCE(sum(overtime_period*overtime_amount),0.00) as overtimes'))
            ->get();

        $rels = DB::table('transact_reliefs')
            ->join('employee', 'transact_reliefs.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', $employee->id)
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('relief_name')
            ->select('relief_name',DB::raw('COALESCE(sum(relief_amount),0.00) as relief_amount'))
            ->get();    
 
        $currency = DB::table('currencies')
            ->whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)
            ->select('shortname')
            ->first();

    $organization = Organization::find(Auth::user()->organization_id);

        $fyear = '';
        $fperiod = '';

        $part = explode("-", $period);

        if($part[0] == 1){
         $fyear = 'January_'.$part[1];
        }else if($part[0] == 2){
         $fyear = 'Febraury_'.$part[1];
        }else if($part[0] == 3){
         $fyear = 'March_'.$part[1];
        }else if($part[0] == 4){
         $fyear = 'April_'.$part[1];
        }else if($part[0] == 5){
         $fyear = 'May_'.$part[1];
        }else if($part[0] == 6){
         $fyear = 'June_'.$part[1];
        }else if($part[0] == 7){
         $fyear = 'July_'.$part[1];
        }else if($part[0] == 8){
         $fyear = 'August_'.$part[1];
        }else if($part[0] == 9){
         $fyear = 'September_'.$part[1];
        }else if($part[0] == 10){
         $fyear = 'October_'.$part[1];
        }else if($part[0] == 11){
         $fyear = 'November_'.$part[1];
        }else if($part[0] == 12){
         $fyear = 'December_'.$part[1];
        }

        if($part[0] == 1){
         $fperiod = 'January-'.$part[1];
        }else if($part[0] == 2){
         $fperiod = 'Febraury-'.$part[1];
        }else if($part[0] == 3){
         $fperiod = 'March-'.$part[1];
        }else if($part[0] == 4){
         $fperiod = 'April-'.$part[1];
        }else if($part[0] == 5){
         $fperiod = 'May-'.$part[1];
        }else if($part[0] == 6){
         $fperiod = 'June-'.$part[1];
        }else if($part[0] == 7){
         $fperiod = 'July-'.$part[1];
        }else if($part[0] == 8){
         $fperiod = 'August-'.$part[1];
        }else if($part[0] == 9){
         $fperiod = 'September-'.$part[1];
        }else if($part[0] == 10){
         $fperiod = 'October-'.$part[1];
        }else if($part[0] == 11){
         $fperiod = 'November-'.$part[1];
        }else if($part[0] == 12){
         $fperiod = 'December-'.$part[1];
        }

        $name = '';

        
              
              if($employee->middle_name == '' || $employee->middle_name == null){
              $name = $employee->first_name.' '.$employee->last_name;
              }else{
              $name = $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name;
              }

        
        $fileName = $employee->first_name.'_'.$employee->last_name.'_'.$fyear.'.pdf';
        $filePath = 'temp/';
        $pdf = PDF::loadView('pdf.emailSlip', compact('nontaxables','empall','select','name','employee','transact','allws','deds','earnings','overtimes','rels','period','currency', 'organization','id'))->setPaper('a5');

        $pdf->save($filePath.$fileName);

        $user=Employee::find($employee->id);

        $file = $filePath.$fileName;

        Mail::to($user->email_office)->send(new Payslip($fperiod,$user, $file));

        unlink($filePath.$fileName);
     }
     Audit::logaudit('Payslip', 'email payslip', 'emailed all employees their payslip');
     return Redirect::back()->with('success', 'Email successfully sent!');
    }
    }else if(empty(Input::get('sel')) && !empty(Input::get('employeeid'))){
        $check = DB::table('transact')
            ->join('employee', 'transact.employee_id', '=', 'employee.personal_file_number')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id',Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->count();
        if($check == 0){
          $e = Employee::find(Input::get('employeeid'));
          return Redirect::back()->with('errors', 'Payslip for employee '.$e->personal_file_number.' : '.$e->first_name.' '.$e->last_name.' for period '.Input::get('period').' is not available!');
        }else{
        $period = Input::get('period');
        $employees = Employee::all();
       
        $emps = DB::table('employee')->count();
        
        $id = Input::get('employeeid');

        $employee = Employee::find($id);

        $transact = DB::table('transact')
            ->join('employee', 'transact.employee_id', '=', 'employee.personal_file_number')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->first(); 

         $nontaxables = DB::table('transact_nontaxables')
            ->join('employee', 'transact_nontaxables.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('nontaxable_name')
            ->select('nontaxable_name',DB::raw('COALESCE(sum(nontaxable_amount),0.00) as nontaxable_amount'))
            ->get(); 

        $allws = DB::table('transact_allowances')
            ->join('employee', 'transact_allowances.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('allowance_name')
            ->select('allowance_name',DB::raw('COALESCE(sum(allowance_amount),0.00) as allowance_amount'))
            ->get(); 

        $earnings = DB::table('transact_earnings')
            ->join('employee', 'transact_earnings.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('earning_name')
            ->select('earning_name',DB::raw('COALESCE(sum(earning_amount),0.00) as earning_amount'))
            ->get(); 

        $deds = DB::table('transact_deductions')
            ->join('employee', 'transact_deductions.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('deduction_name')
            ->select('deduction_name',DB::raw('COALESCE(sum(deduction_amount),0.00) as deduction_amount'))
            ->get(); 

        $overtimes = DB::table('transact_overtimes')
            ->join('employee', 'transact_overtimes.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('overtime_type')
            ->select('overtime_type',DB::raw('COALESCE(sum(overtime_period*overtime_amount),0.00) as overtimes'))
            ->get();

        $rels = DB::table('transact_reliefs')
            ->join('employee', 'transact_reliefs.employee_id', '=', 'employee.id')
            ->where('financial_month_year' ,'=', Input::get('period'))
            ->where('employee.id' ,'=', Input::get('employeeid'))
            ->where('employee.organization_id',Auth::user()->organization_id)
            ->groupBy('relief_name')
            ->select('relief_name',DB::raw('COALESCE(sum(relief_amount),0.00) as relief_amount'))
            ->get();
 
        $currency = DB::table('currencies')
            ->whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)
            ->select('shortname')
            ->first();

    $organization = Organization::find(Auth::user()->organization_id);

        $fyear = '';
        $fperiod = '';

        $part = explode("-", $period);

        if($part[0] == 1){
         $fyear = 'January_'.$part[1];
        }else if($part[0] == 2){
         $fyear = 'Febraury_'.$part[1];
        }else if($part[0] == 3){
         $fyear = 'March_'.$part[1];
        }else if($part[0] == 4){
         $fyear = 'April_'.$part[1];
        }else if($part[0] == 5){
         $fyear = 'May_'.$part[1];
        }else if($part[0] == 6){
         $fyear = 'June_'.$part[1];
        }else if($part[0] == 7){
         $fyear = 'July_'.$part[1];
        }else if($part[0] == 8){
         $fyear = 'August_'.$part[1];
        }else if($part[0] == 9){
         $fyear = 'September_'.$part[1];
        }else if($part[0] == 10){
         $fyear = 'October_'.$part[1];
        }else if($part[0] == 11){
         $fyear = 'November_'.$part[1];
        }else if($part[0] == 12){
         $fyear = 'December_'.$part[1];
        }

        if($part[0] == 1){
         $fperiod = 'January-'.$part[1];
        }else if($part[0] == 2){
         $fperiod = 'Febraury-'.$part[1];
        }else if($part[0] == 3){
         $fperiod = 'March-'.$part[1];
        }else if($part[0] == 4){
         $fperiod = 'April-'.$part[1];
        }else if($part[0] == 5){
         $fperiod = 'May-'.$part[1];
        }else if($part[0] == 6){
         $fperiod = 'June-'.$part[1];
        }else if($part[0] == 7){
         $fperiod = 'July-'.$part[1];
        }else if($part[0] == 8){
         $fperiod = 'August-'.$part[1];
        }else if($part[0] == 9){
         $fperiod = 'September-'.$part[1];
        }else if($part[0] == 10){
         $fperiod = 'October-'.$part[1];
        }else if($part[0] == 11){
         $fperiod = 'November-'.$part[1];
        }else if($part[0] == 12){
         $fperiod = 'December-'.$part[1];
        }

        $name = '';

        
              
              if($employee->middle_name == '' || $employee->middle_name == null){
              $name = $employee->first_name.' '.$employee->last_name;
              }else{
              $name = $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name;
              }


        $fileName = $employee->first_name.'_'.$employee->last_name.'_'.$fyear.'.pdf';
        $filePath = 'temp/';
        $pdf = PDF::loadView('pdf.emailSlip', compact('nontaxables','empall','select','name','employee','transact','allws','deds','earnings','overtimes','rels','period','currency', 'organization','id'))->setPaper('a5');

        $pdf->save($filePath.$fileName);

        $user=Employee::find($id);

        $file = $filePath.$fileName;

        Mail::to($user->email_office)->send(new Payslip($fperiod,$user, $file));

        unlink($filePath.$fileName);

        if(count(Mail::failures()) > 0){
            $fail = "Email not sent! Please try again later";
            return Redirect::back()->with('fail', $fail);
        } else{
            $success = "Email successfully sent!";
            Audit::logaudit('Payslip', 'email payslip', 'emailed employee '.$user->personal_file_number.' : '.$user->first_name.' '.$user->last_name.' their payslip');
            return Redirect::back()->with('success', $success);
        }
       }
         
      }
      
    }
}
