<?php

namespace App;

use Zizaco\Entrust\EntrustRole;
use DB;

class Role extends EntrustRole
{

	public static function getRole($id){
		$role = DB::table("roles")
		      ->join("assigned_roles","roles.id", '=',"assigned_roles.role_id")
		      ->where("user_id",$id)
		      ->select("roles.name")
		      ->first();
		return $role->name;
	}

	public static function check($id){
		$role = DB::table("roles")
		      ->join("assigned_roles","roles.id", '=',"assigned_roles.role_id")
		      ->where("user_id",$id)
		      ->select("roles.name")
		      ->count();
		return $role;
	}

}