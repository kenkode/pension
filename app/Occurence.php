<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use DB;

class Occurence extends Model {
/*
	use \Traits\Encryptable;


	protected $encryptable = [

		'allowance_name',
	];
	*/

public static $rules = [
		'brief' => 'required',
		'employee' => 'required',
		'type' => 'required',
		'date' => 'required'
	];

	public static $messsages = array(
        'brief.required'=>'Please insert occurence brief!',
        'employee.required'=>'Please select employee!',
        'type.required'=>'Please select occurence type!',
        'date.required'=>'Please select occurence date!',
    );

	// Don't forget to fill this array
	protected $fillable = [];


	public function employee(){
		
		return $this->belongsTo('App\Employee');
	}
	public function occurencesetting(){
		
		return $this->hasMany('App\Occurencesetting');
	}
}