<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Document;
use App\Deductions;
use Auth;

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

          $data['employee'] = Deductions::all()
                                           ->where('payroll_no','=',Auth::user()->payroll_no)
                                           ->sum('employee_contribution');


            $data['employer'] = Deductions::all()
                                          ->where('payroll_no','=',Auth::user()->payroll_no)
                                          ->sum('employer_contribution');

            

          }else{
        
            $data['employer'] = Deductions::all()->sum('employer_contribution');

            $data['employee'] = Deductions::all()->sum('employee_contribution');

          }
      


        return view('home',$data);
    }
}
