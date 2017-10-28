<?php

namespace App\Http\Controllers;

use App\Department;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class DepartmentsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$departments = Department::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();

		if ( !Entrust::can('view_department') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Departments', 'view', 'viewed departments');

		return view('departments.index', compact('departments'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_department') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('departments.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Department::$rules,Department::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$code = Input::get('code');
		$code_exists = DB::table('departments')->where('codes', '=', $code)->count();

		if($code_exists >= 1){

			return Redirect::back()->withErrors(array('error'=>'The Department code already exists'))->withInput();
		}
		else {

		$department = new Department;

		$department->codes = Input::get('code');

		$department->department_name = Input::get('name');

        $department->organization_id = Auth::user()->organization_id;

		$department->save();
       
        Audit::logaudit('Department', 'create', 'created: '.$department->department_name);

		return Redirect::route('departments.index')->withFlashMessage('Department successfully updated!');
	}
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$department = Department::findOrFail($id);

		return view('departments.show', compact('department'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$department = Department::find($id);

        if ( !Entrust::can('update_department') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('departments.edit', compact('department'));
	}
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$department = Department::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Department::$rules,Department::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$code = Input::get('code');
		$original_code = DB::table('departments')->where('id', '!=', $department->id)->where('codes', $code)->count();

		if($original_code > 0) {

			return Redirect::back()->withErrors(array('error'=>'The Department code already exists'))->withInput();
		}else {

		$department->codes = Input::get('code');

		$department->department_name = Input::get('name');
		$department->update();

		 Audit::logaudit('Department', 'update', 'updated: '.$department->department_name);

		return Redirect::route('departments.index')->withFlashMessage('Department successfully updated!');
	}
    }

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$department = Department::findOrFail($id);
		if ( !Entrust::can('delete_department') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $dept  = DB::table('employee')->where('department_id',$id)->count();
		if($dept>0){
			return Redirect::route('departments.index')->withDeleteMessage('Cannot delete this department because its assigned to an employee(s)!');
		}else{
		Department::destroy($id);

        Audit::logaudit('Department', 'delete', 'deleted: '.$department->department_name);
		return Redirect::route('departments.index')->withDeleteMessage('Deduction successfully deleted!');
	}
}

}

}
