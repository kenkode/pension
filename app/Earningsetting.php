<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Earningsetting extends Model {
/*
	use \Traits\Encryptable;


	protected $encryptable = [

		'allowance_name',
	];
	*/

public static $rules = [
		'name' => 'required'
	];

	public static $messsages = array(
        'name.required'=>'Please insert earning name!',
    );

	// Don't forget to fill this array
	protected $fillable = [];


	public function employees(){

		return $this->hasMany('App\Employee');
	}

	public function earning(){

		return $this->belongsTo('App\Earning');
	}

}