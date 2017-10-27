<?php

namespace App\Http\Controllers;

use App\Relief;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class ReliefsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$reliefs = Relief::all();

		if ( !Entrust::can('view_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		Audit::logaudit('Relief', 'view', 'viewed reliefs');

		return view('reliefs.index', compact('reliefs'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('reliefs.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Relief::$rules,Relief::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$relief = new Relief;

		$relief->relief_name = Input::get('name');

        $relief->organization_id = '1';

		$relief->save();

		Audit::logaudit('Relief', 'create', 'created relief '.Input::get('name'));

		return Redirect::route('reliefs.index')->withFlashMessage('Relief successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$relief = Relief::findOrFail($id);

		return view('reliefs.show', compact('relief'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$relief = Relief::find($id);

        if ( !Entrust::can('update_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('reliefs.edit', compact('relief'));
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
		$relief = Relief::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Relief::$rules,Relief::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$relief->relief_name = Input::get('name');
		$relief->update();

		Audit::logaudit('Relief', 'update', 'updated relief '.Input::get('name'));

		return Redirect::route('reliefs.index')->withFlashMessage('Relief successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$relief = Relief::findOrFail($id);
		if ( !Entrust::can('update_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $rel  = DB::table('employee_relief')->where('relief_id',$id)->count();
        $trel  = DB::table('transact_reliefs')->where('relief_id',$id)->count();
		if($rel>0){
			return Redirect::route('reliefs.index')->withDeleteMessage('Cannot delete this relief because its assigned to an employee(s)!');
		}else if($trel>0){
			return Redirect::route('reliefs.index')->withDeleteMessage('Cannot delete this relief because its assigned to a payroll transaction(s)!');
		}else{
		Relief::destroy($id);

		Audit::logaudit('Relief', 'delete', 'deleted relief '.$relief->relief_name);

		return Redirect::route('reliefs.index')->withDeleteMessage('Relief successfully deleted!');
	}
	}
}

}
