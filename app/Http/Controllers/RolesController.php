<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Audit;
use App\Role;
use App\Permission;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

/**
 * rolesController Class
 *
 * Implements actions regarding role management
 */
class RolesController extends Controller
{


    /**
    * display a list of system roles
    */
    public function index(){

        $roles = Role::all();
        Audit::logaudit('Roles', 'view', 'viewed system roles');

        return view('roles.index')->with('roles', $roles);
    }


    /**
    * display the edit page
    */
    public function edit($id){
        $roleperm = array();
        $role = Role::find($id);
        $permissions = Permission::all();
        $categories = DB::table('permissions')->select('category')->distinct()->get();

        foreach ($role->perms()->get() as $p) {
            $roleperm[] = $p->name;
        }
        
       return view('roles.edit', compact('role', 'permissions', 'categories', 'roleperm'));
    }



     /**
    * updates the role
    */
    public function update($id){

        $perms = Input::get('permission');

        $role = Role::find($id);

        $role->name = Input::get('name');
       
        $role->update();
        
        $role->perms()->sync($perms);

        
        Audit::logaudit('Roles', 'update', 'updated role '.$role->name);
        return Redirect::to('roles/show/'.$role->id)->withFlashMessage('Role successfully updated!');
    }




    /**
     * Displays the form for account creation
     *
     * @return  Illuminate\Http\Response
     */
    public function create()
    {

        $categories = DB::table('permissions')->select('category')->distinct()->get();
        $permissions = Permission::all();
        
        
        return view('roles.create', compact('permissions', 'categories'));
    }

    /**
     * Stores new account
     *
     * @return  Illuminate\Http\Response
     */
    public function store()
    {

        

        $perms = Input::get('permission');

        
        
        $role = new Role;

        $role->name = Input::get('name');

        $role->save();

        $role->perms()->sync($perms);

        return Redirect::route('roles.index')->withFlashMessage('Role successfully created!');

        

        


    }





    /**
    * Delete the role
    *
    */

    public function destroy($id){

        $role = Role::find($id);

        
        $role->delete();

        return Redirect::to('roles')->withDeleteMessage('Role successfully deleted!');
    }



    public function show($id){

        $role = Role::find($id);
        $permissions = Permission::all();
        $categories = DB::table('permissions')->select('category')->distinct()->get();
        $roleperm = array();
        foreach ($role->perms()->get() as $p) {
            $roleperm[] = $p->name;
        }
        
       return view('roles.show', compact('role', 'permissions', 'categories', 'roleperm'));
    }


  











  



    



 



}
