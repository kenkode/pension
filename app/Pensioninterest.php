<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pensioninterest extends Model
{
    //
    public static function getInterest($id){
       $pensioninterest = Pensioninterest::where('employee_id',$id)->first();
       return $pensioninterest->interest; 
    }

    public static function getComment($id){
       $pensioninterest = Pensioninterest::where('employee_id',$id)->first();
       return $pensioninterest->comment; 
    }

    public static function getPeriod($id){
       $pensioninterest = Pensioninterest::where('employee_id',$id)->first();
       return $pensioninterest->period; 
    }

    public static function getEmployee($id,$period){
       $pensioninterest = Pensioninterest::where('employee_id',$id)->where('period',$period)->first();
       if(count($pensioninterest) == 0){
        $employee = Employee::find($id);
        return $employee->id; 
       }
    }
}
