<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Document;
use App\Kin;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['users']= User::all();

      //$data = User::select('userId','userName')
        //    ->get();

    //return $users;
    return view('users.index',$data);
    
    }

   

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

         $this->validate($request, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
            ]);



        $user = new User;
        $insert=$user->create_user($request->name,$request->email,$request->password,$request->role,$request->payroll_no);    

        $data['status'] = 'User added!';
        $data['status_class'] = 'alert-success';
        return redirect('users')->with($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit( User $user)
    {
         $data['user'] = $user;

         
        return view('users.edit',$data);
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
       
         
        $update=$user->update_staff($request->id,$request->name,$request->email,$request->role,$request->payroll_no);   

        $data['status'] = 'User updated!';
        $data['status_class'] = 'alert-success';
        return redirect('users')->with($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       
        user::find($id)->delete();
        $data['status'] = 'User deleted!';
        $data['status_class'] = 'alert-success';

        return redirect('users')->with($data);
    }

    public function deductions()
    {
        $data['users']= User::all();

      
    return view('deductions.employee',$data);
    
    }

    public static function payroll_name($payroll_no)
    {
        
      $data = User::select('*')
               ->where('payroll_no', '=', $payroll_no)  
               ->get();
     if(count($data)){
       return $data[0]->name;
     }else{
       return ""; 
     }
    
    
    }

    public static function name_by_id($id)
    {
        
      $data = User::select('*')
               ->where('id', '=', $id)  
               ->get();

      if(count($data)){
       return $data[0]->name;
     }else{
       return ""; 
     }
    
    }


    public static function salary($payroll_no)
    {
        
      $data = User::select('*')
               ->where('payroll_no', '=', $payroll_no)  
               ->get();

      if(count($data)){
       return $data[0]->salary;
     }else{
       return 0; 
     }
    
    }

    public function employees()
    {
      
      $data['users'] = User::select('*')
              ->where("role","<>","Admin")
              ->get();

    
    return view('employees.index',$data);
    
    }

    public function detailed_employee($id)
    {
      
      $data['user'] = User::find($id);

    
    return view('employees.show',$data);
    
    }

    public function reg_employee(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
            ]);

        $password=bcrypt($request->password);

       $user =User::create(array('name'=>$request->name,
                                  'email'=>$request->email,
                                  'password'=>$password,
                                  'role'=>$request->role,
                                  'payroll_no'=>$request->payroll_no,
                                  'gender'=>$request->gender,
                                  'dob'=>$request->dob,
                                  'date_joined'=>$request->date_joined,
                                  'salary'=>$request->salary,
                                  'national_id'=>$request->national_id,
                                  'dl_no'=>$request->dl_no,
                                  'marital_status'=>$request->marital_status,

                              ));
        
                Kin::create(array('kin_to'=>$user->id,
                                  'name'=>$request->kin_name,
                                  'phone'=>$request->kin_phone,
                                  'address'=>$request->kin_address,
                                  'relationship'=>$request->kin_relationship,

                              ));  

        return redirect('employees');

    }

    public static function get_documents($id)
    {

        $documents=Document::select('*')
              ->where("owner_id","=",$id)
              ->get();
       if(count($documents)){
         echo "<ul>";
        foreach ($documents as $document) {

            echo "<li><a href='".$document->path."' class='list-group-item'>".$document->document_name."-".$document->year."</a></li>";
            
        }

         echo"</ul>";

       }
    } 

}
