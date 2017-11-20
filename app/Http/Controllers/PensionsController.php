<?php

namespace App\Http\Controllers;

use App\Pension;
use App\User;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Entrust;
use Redirect;
use App\Audit;

class PensionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $data['deductions']= Pension::all();

         if ( !Entrust::can('view_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Pension', 'view', 'viewed employee pension');

         return view('pensions.index',$data);
       }
      
    }

    public function deductions()
    {
        $data['users']= User::all();

      
    return view('pensions.employee',$data);
    
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $employees = DB::table('employee')
              ->where('in_employment','=','Y')
              ->where('employee.organization_id',Auth::user()->organization_id)
              ->get();
      if ( !Entrust::can('create_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
      return view('pensions.create',compact('employees')); 
    }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    
    //Pension::create($request->all());

        $pension = new Pension;

        $pension->employee_id = $request->employee;
        $pension->employee_contribution=str_replace(",","",$request->employeecont);
        $pension->employer_contribution=str_replace(",","",$request->employercont);
        $pension->employee_percentage=str_replace(",","",$request->pemployeecont);
        $pension->employer_percentage=str_replace(",","",$request->pemployercont);
        $pension->type=$request->formular;
        $pension->save();

    Audit::logaudit('Pension', 'create', 'created pension for employee '.$pension->personal_file_number.' : '.$pension->first_name.' '.$pension->last_name.' employee contribution '.str_replace(",","",$request->employeecont).' and employer contribution '.str_replace(",","",$request->employercont));

    return redirect('pensions')->withFlashMessage('Pension contribution successfully created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      $data['pension']=Pension::find($id);

      return view('pensions.view',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data['pension']=Pension::find($id);

       // return $data;
        if ( !Entrust::can('update_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        return view('pensions.edit',$data);
      }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request)
    {

       $pension=Pension::find($id);
       
       /*$deduction->update(array('employee_contribution'=>$request->employee_contribution,
                                 'employer_contribution'=>$request->employer_contribution,
                                 'interest'=>$request->interest,
                                 'monthly_deduction'=>$request->monthly_deduction,
                                 'comments'=>$request->comments)); */

        $pension->employee_contribution=str_replace(",","",$request->employeecont);
        $pension->employer_contribution=str_replace(",","",$request->employercont);
        $pension->employee_percentage=str_replace(",","",$request->pemployeecont);
        $pension->employer_percentage=str_replace(",","",$request->pemployercont);
        $pension->type=$request->formular;
        $pension->update();

       Audit::logaudit('Pension', 'update', 'updated pension for employee '.$pension->personal_file_number.' : '.$pension->first_name.' '.$pension->last_name.' employee contribution '.str_replace(",","",$request->employeecont).' and employer contribution '.str_replace(",","",$request->employercont));

    return redirect('pensions')->withFlashMessage('Pension contribution successfully created!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $pension=Pension::find($id);
        if ( !Entrust::can('delete_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Pension::find($id)->delete();
        Audit::logaudit('Pension', 'delete', 'deleted pension for employee '.$pension->personal_file_number.' : '.$pension->first_name.' '.$pension->last_name.' employee contribution '.str_replace(",","",$request->employeecont).' and employer contribution '.str_replace(",","",$request->employercont));

    return redirect('pensions')->withDeleteMessage('Pension contribution successfully deleted!');
    }
    }


    public function user_import($id)
    {
     $data['user']=User::find($id);
      return view('pensions.import',$data); 
    }


    public function import(Request $request)
    {

    
    $path= Controller::showUploadFile($request);

            
       if($path!=1){     
            
            
          $file = fopen($path,"r");
        
          $headings=fgetcsv($file);        
        
          $columns=array('monthly_deduction', 'cummulative_deduction', 'comments', 'month', 'year');
         
         $records=fgetcsv($file);
         
          foreach($headings as $key=>$heading){               
                $temp_record[$heading]= $records[$key]; 
           }
           
           
         
         $missing=0;
        foreach($columns as $column){
            if(!array_key_exists( $column,$temp_record)){
            $missing++;
              echo $column."= Missing<br>";           
            }else{
            echo $column."= Exists<br>";      
            }
        }
        
    
        
    if($missing==0){
       $count=0;
        while(! feof($file))
          {
                
          $records=fgetcsv($file);
          $temp_record=array();
              foreach($headings as $key=>$heading){               
                $record[$heading]= $records[$key]; 
              }           
          $payroll_no=$request->payroll_no;
          $monthly_deduction=addslashes($record['monthly_deduction']);
          $cummulative_deduction=addslashes($record['cummulative_deduction']); 
          $comments=addslashes($record['comments']); 
          $month=addslashes($record['month']);        
          $year=addslashes($record['year']);    

          
  $Deductions = new Deductions;      
$inv_response=$Deductions->insert_record($payroll_no,$monthly_deduction,$cummulative_deduction,$comments,$month,$year);
             
       $count++;  
          }

    }else{
        $import_msg='A column is missing.'; 
        }
                 
        fclose($file); 
        
    
        
    }else{
        $import_msg="file was not uploaded";
        
        }
    
   return redirect('deductions');
        
    }

}
