<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Document;
use App\Pension;
use App\Employee;
use Auth;
use DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $data['kcpe'] = Document::select('*')
               ->where('document_name','=','KCPE Certificate')  
               ->count();

        $data['kcse'] = Document::select('*')
               ->where('document_name','=','KCSE Certificate')  
               ->count();

        $data['cert'] = Document::select('*')
               ->where('document_name','=','OTHER Certificate')  
               ->count();

        $data['diploma'] = Document::select('*')
               ->where('document_name','=','DIPLOMA Certificate')  
               ->count();

        $data['bachelors'] = Document::select('*')
               ->where('document_name','=','BACHELORS Certificate')  
               ->count();

        $data['masters'] = Document::select('*')
               ->where('document_name','=','MASTERS Certificate')  
               ->count();
               

        $data['phd'] = Document::select('*')
               ->where('document_name','=','PHD Certificate')  
               ->count();

        if(Auth::user()->role=="Employee"){

          $employeeid = Employee::where("personal_file_number",Auth::user()->name)->pluck("id")[0];
          $data['employee'] = DB::table("transact_pensions")
                                           ->where('employee_id','=',$employeeid)
                                           ->sum('employee_amount');


            $data['employer'] = DB::table("transact_pensions")
                                          ->where('employee_id','=',$employeeid)
                                          ->sum('employer_amount');

            

          }else{
        
            $data['employer'] = DB::table("transact_pensions")->sum('employer_amount');

            $data['employee'] = DB::table("transact_pensions")->sum('employee_amount');

          }
      


        return view('home',$data);
    }
}
