<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use DB;

class Nextofkin extends Model{

	// Add your validation rules here



	public static $rules = [
		'employee_id' => 'required',
		'fname' => 'required',
		'lname' => 'required',
	];

	public static function rolesUpdate($id)
    {
        return array(
        'employee_id' => 'required',
		'fname' => 'required',
		'lname' => 'required',
		'goodwill' => 'regex:/^\d+(\.\d{2})?$/',
		'id_number' => 'nullable|unique:nextofkins,' . $id,
        );
    }

	public static $messages = array(
		'employee_id.required'=>'Please select employee!',
        'fname.required'=>'Please insert next of kin`s first name!',
        'lname.required'=>'Please insert next of kin`s last name!',
        'goodwill.regex'=>'Please insert a valid percentage value!',
        'identity_number.unique'=>'That identity number already exists!',
    );

	// Don't forget to fill this array
	protected $fillable = [];


	public function employee(){

		return $this->belongsTo('App\Employee');
	}

}