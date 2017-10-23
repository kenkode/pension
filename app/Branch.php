<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model {

	// Add your validation rules here
	public static $rules = [
		'name' => 'required'
	];

	// Don't forget to fill this array
	protected $fillable = [];


	public function employee(){

		return $this->hasMany('App\Employee');
	}


	public function journals(){

		return $this->hasMany('App\Journal');
	}

public static function getName($id){

$branch = Branch::find($id);
return $branch->name;
}
}
