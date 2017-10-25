<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use DB;

class Employeebenefit extends Model {
/*
	use \Traits\Encryptable;


	protected $encryptable = [

		'allowance_name',
	];
	*/


	// Don't forget to fill this array
	protected $fillable = [];


	public function jobgroup(){

		return $this->belongsTo('Jobgroup');
	}

}