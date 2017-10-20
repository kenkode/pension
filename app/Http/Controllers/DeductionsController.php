<?php

namespace App\Http\Controllers;

use App\Deductions;
use App\User;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class DeductionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $data['deductions']= Deductions::all();

         return view('deductions.index',$data);
      
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      return view('deductions.import'); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    
    Deductions::create($request->all());

    return redirect('deductions');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      $data['user']=User::find($id);

      return view('deductions.create',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data['deduction']=Deductions::find($id);

       // return $data;

        return view('deductions.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Deductions $deductions)
    {

       $deduction=Deductions::find($request->id);
       
       $deduction->update(array('employee_contribution'=>$request->employee_contribution,
                                 'employer_contribution'=>$request->employer_contribution,
                                 'interest'=>$request->interest,
                                 'monthly_deduction'=>$request->monthly_deduction,
                                 'comments'=>$request->comments)); 

       return redirect('deductions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
         Deductions::find($id)->delete();
        return redirect('deductions');
    }


    public function user_import($id)
    {
     $data['user']=User::find($id);
      return view('deductions.import',$data); 
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
