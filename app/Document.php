<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model {
/*
	use \Traits\Encryptable;


	protected $encryptable = [

		'allowance_name',
	];
	*/

public static $rules = [
        'type' => 'required',
		'path' => 'required'
	];

 public static function rolesUpdate()
    {
        return array(
        'type' => 'required'
        );
    }

	public static $messsages = array(
        'employee.required'=>'Please select member!',
        'path.required'=>'Please upload document!',
    );

	// Don't forget to fill this array
	protected $fillable = [];


	public function member(){

		return $this->belongsTo('Member');
	}

}