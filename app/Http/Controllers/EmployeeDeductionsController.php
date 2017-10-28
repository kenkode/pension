<?php

namespace App\Http\Controllers;

use App\EDeduction;
use App\Currency;
use App\Employee;
use App\Organization;
use App\Deduction;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class EmployeeDeductionsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$deds = DB::table('employee')
		          ->join('employee_deductions', 'employee.id', '=', 'employee_deductions.employee_id')
		          ->join('deductions', 'employee_deductions.deduction_id', '=', 'deductions.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employee_deductions.id','first_name','middle_name','last_name','deduction_amount','deduction_name')
		          ->get();

		if ( !Entrust::can('view_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{          
		return view('employee_deductions.index', compact('deds'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */

   public function create()
	{
		$employees = DB::table('employee')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->get();
		$deductions = Deduction::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

		if ( !Entrust::can('create_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{    
		return view('employee_deductions.create',compact('employees','deductions','currency'));
	}
	}

	public function creatededuction()
	{
      $postdeduction = Input::all();
      $data = array('deduction_name' => $postdeduction['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('deductions')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Deductions', 'create', 'created deduction type '.$postdeduction['name']);
        return $check;
        }else{
         return 1;
        }
      
	} 

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), EDeduction::$rules, EDeduction::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$ded = new EDeduction;

		$ded->employee_id = Input::get('employee');

		$ded->deduction_id = Input::get('deduction');

		$ded->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$ded->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $ded->deduction_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $ded->deduction_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('ddate'))));

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $ded->first_day_month = $First;

        $ded->last_day_month = $Last;

	    }else{
	    $ded->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $ded->deduction_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $ded->deduction_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime(Input::get('ddate')));
        

        $ded->first_day_month = $First;

        $ded->last_day_month = $Last;

	    }

        
		$ded->save();
		$d = Deduction::findOrFail($ded->deduction_id);

		Audit::logaudit('Employee Deduction', 'create', 'assigned deduction amount '.$ded->deduction_amount.' to '.Employee::getEmployeeName(Input::get('employee')).' for deduction type '.$d->deduction_name);

		return Redirect::route('employee_deductions.index')->withFlashMessage('Employee Deduction successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$ded = EDeduction::findOrFail($id);

		return view('employee_deductions.show', compact('ded'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$ded = EDeduction::find($id);
		$employees = Employee::where('organization_id',Auth::user()->organization_id)->get();
                $deductions = Deduction::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
                $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

        if ( !Entrust::can('update_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{    
		return view('employee_deductions.edit', compact('ded','employees','deductions','currency'));
	}
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$ded = EDeduction::findOrFail($id);

		$validator = Validator::make($data = Input::all(), EDeduction::$rules, EDeduction::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$ded->deduction_id = Input::get('deduction');

		$ded->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$ded->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $ded->deduction_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $ded->deduction_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('ddate'))));

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $ded->first_day_month = $First;

        $ded->last_day_month = $Last;

	    }else{
	    $ded->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $ded->deduction_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $ded->deduction_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime(Input::get('ddate')));

        $ded->first_day_month = $First;

        $ded->last_day_month = $Last;

	    }

		$ded->update();
		$d = Deduction::findOrFail($ded->deduction_id);

		Audit::logaudit('Employee Deduction', 'update', 'updated deduction '.$d->deduction_name.' for employee '.Employee::getEmployeeName($ded->employee_id));

		return Redirect::route('employee_deductions.index')->withFlashMessage('Employee Deduction successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$ded = EDeduction::findOrFail($id);
		$d = Deduction::findOrFail($ded->deduction_id);

		if ( !Entrust::can('delete_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{    
        $tded  = DB::table('transact_deductions')->where('employee_deduction_id',$id)->count();
		if($tded>0){
			return Redirect::route('employee_deductions.index')->withDeleteMessage('Cannot delete this deduction because its assigned to a payroll transaction(s)!');
		}else{
		EDeduction::destroy($id);

		Audit::logaudit('Employee Deduction', 'delete', 'deleted deduction '.$d->deduction_name.' for '.Employee::getEmployeeName($ded->employee_id));

		return Redirect::route('employee_deductions.index')->withDeleteMessage('Employee Deduction successfully deleted!');
	}
    }
	}

	public function view($id){

		$ded = DB::table('employee')
		          ->join('employee_deductions', 'employee.id', '=', 'employee_deductions.employee_id')
		          ->join('deductions', 'employee_deductions.deduction_id', '=', 'deductions.id')
		          ->where('employee_deductions.id','=',$id)
		          ->where('employee.organization_id',Auth::user()->organization_id)
                  ->select('employee_deductions.id','first_name','last_name','middle_name','formular','instalments','deduction_amount','deduction_name','deduction_date','last_day_month','photo','signature','employee_id')
		          ->first();

		$organization = Organization::find(Auth::user()->organization_id);
        
        if ( !Entrust::can('view_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{ 
        Audit::logaudit('Employee Allowances', 'view', 'viewed deduction for employee '.Employee::getEmployeeName($ded->employee_id).' for deduction type '.$ded->deduction_name);  
		return view('employee_deductions.view', compact('ded'));
	}
		
	}

}
