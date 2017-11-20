<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Remittedemployee extends Model
{
    //
    public function employee(){

        return $this->belongsTo('App\Employee');
    }

    public static function getCount($period,$type){
       $count = Remittedemployee::join('remittances','remittedemployees.remittance_id','=','remittances.id')->where('period',$period)->where('remittedemployees.type',$type)->count();
       return $count; 
    }

    public static function getEmployee($id,$period,$type){
       $remittedemployee = Remittedemployee::join('remittances','remittedemployees.remittance_id','=','remittances.id')->where('employee_id',$id)->where('period',$period)->where('remittedemployees.type',$type)->first();
       if(count($remittedemployee) == 0){
        $employee = Employee::find($id);
        return $employee->id; 
       }
    }
}
