<?php

namespace App\Http\Controllers;

use App\EType;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class EmployeeTypeController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$etypes = EType::all();
        Audit::logaudit('Employee Type', 'view', 'viewed employee types');

		return view('employee_type.index', compact('etypes'));
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('employee_type.create');
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), EType::$rules,EType::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$etype = new EType;

		$etype->employee_type_name = Input::get('name');

        $etype->organization_id = '1';

		$etype->save();

		Audit::logaudit('Employee Type', 'create', 'created employee type '.Input::get("name"));

		return Redirect::route('employee_type.index')->withFlashMessage('Employee type successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$etype = EType::findOrFail($id);

		return view('employee_type.show', compact('etype'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$etype = EType::find($id);

		return view('employee_type.edit', compact('etype'));
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$etype = EType::findOrFail($id);

		$validator = Validator::make($data = Input::all(), EType::$rules,EType::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$etype->employee_type_name = Input::get('name');
		$etype->update();

		Audit::logaudit('Employee Type', 'update', 'updated employee type '.Input::get("name"));

		return Redirect::route('employee_type.index')->withFlashMessage('Employee type successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$etype = EType::findOrFail($id);
		EType::destroy($id);

		Audit::logaudit('Employee Type', 'delete', 'deleted employee type '.$etype->employee_type_name);

		return Redirect::route('employee_type.index')->withDeleteMessage('Employee type successfully deleted!');
	}

}
