<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Transact extends Model
{
    //
    public static function getPaye($id,$period){
       $employee = Employee::find($id);
       $transact = DB::table('transact')->where('financial_month_year',$period)->where('employee_id',$employee->personal_file_number)->first();
       return $transact->paye;
   }

   public static function getNhif($id,$period){
       $employee = Employee::find($id);
       $transact = DB::table('transact')->where('financial_month_year',$period)->where('employee_id',$employee->personal_file_number)->first();
       return $transact->nhif_amount;
   }

   public static function getNssf($id,$period){
       $employee = Employee::find($id);
       $transact = DB::table('transact')->where('financial_month_year',$period)->where('employee_id',$employee->personal_file_number)->first();
       return $transact->nssf_amount;
   }
}
