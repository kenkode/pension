<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use DB;

class EDeduction extends Model {
	/*

	use \Traits\Encryptable;


	protected $encryptable = [

		'deduction_amount',
		
	];
	*/

public $table = "employee_deductions";

public static $rules = [
		'employee' => 'required',
		'deduction' => 'required',
		'formular' => 'required',
		'amount' => 'required|regex:/^(\$?(?(?=\()(\())\d+(?:,\d+)?(?:\.\d+)?(?(2)\)))$/',
		'ddate' => 'required',
	];

public static $messages = array(
        'employee.required'=>'Please select employee!',
        'deduction.required'=>'Please select deduction type!',
        'formular.required'=>'Please select deduction formular!',
        'amount.required'=>'Please insert amount!',
        'amount.regex'=>'Please insert a valid amount!',
        'ddate.required'=>'Please select date!',
    );

	// Don't forget to fill this array
	protected $fillable = [];


	public function employee(){

		return $this->belongsTo('App\Employee');
	}
	public function deduction(){

		return $this->belongsTo('App\Deduction');
	}

}