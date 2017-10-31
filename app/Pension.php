<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
class Pension extends Model
{
    protected $fillable = [
        'employee_id','employee_contribution','employer_contribution','interest','comments'
    ];


   
     public function insert_record($payroll_no,$monthly_deduction,$cummulative_deduction,$comments,$month,$year){
     	$this->payroll_no = $payroll_no;
        $this->monthly_deduction=$monthly_deduction;
        $this->cummulative_deduction=$cummulative_deduction;
        $this->comments =$comments;
        $this->month= $month;
        $this->year= $year;
        $this->entered_by=Auth::user()->id;
        $this->save();
     }

}
