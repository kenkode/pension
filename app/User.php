<?php

namespace App;

use Zizaco\Entrust\Traits\EntrustUserTrait;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
    use EntrustUserTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','role','payroll_no','salary','gender','dob','date_joined','salary','national_id','dl_no'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


     public function  create_user($name,$email,$password,$role,$payroll_no){
        
        $this->name = $name;
        $this->email=$email;
        $this->password=bcrypt($password);
        $this->role =$role;
        $this->payroll_no= $payroll_no;
        $this->save();
    }

     public function  update_staff($id,$name,$email,$role,$payroll_no){

        $user=$this->find($id);
        $user->name = $name;        
        $user->email =$email;
        $user->role =$role;
        $user->payroll_no= $payroll_no;
        $user->save();
    }

    public function  set_salary($id,$salary){

        $user=$this->find($id);        
        $user->salary = $salary;
        $user->save();
    }

}
