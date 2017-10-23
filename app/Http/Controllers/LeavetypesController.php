<?php

namespace App\Http\Controllers;

use App\Leavetype;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class LeavetypesController extends Controller {

	/**
	 * Display a listing of leavetypes
	 *
	 * @return Response
	 */
	public function index()
	{
		$leavetypes = Leavetype::all();
        Audit::logaudit('Leave Type', 'view', 'viewed leave types');

		return view('leavetypes.index', compact('leavetypes'));
	}

	/**
	 * Show the form for creating a new leavetype
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('leavetypes.create');
	}

	/**
	 * Store a newly created leavetype in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Leavetype::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Leavetype::createLeaveType($data);

		Audit::logaudit('Leave Type', 'create', 'created leave type '.Input::get("name"));

		return Redirect::route('leavetypes.index')->withFlashMessage('Leave type successfully created!');
	}

	/**
	 * Display the specified leavetype.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$leavetype = Leavetype::findOrFail($id);

		return view('leavetypes.show', compact('leavetype'));
	}

	/**
	 * Show the form for editing the specified leavetype.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$leavetype = Leavetype::find($id);

		return view('leavetypes.edit', compact('leavetype'));
	}

	/**
	 * Update the specified leavetype in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$leavetype = Leavetype::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Leavetype::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Leavetype::updateLeaveType($data, $id);

		Audit::logaudit('Leave Type', 'update', 'updated leave type '.Input::get("name"));

		return Redirect::route('leavetypes.index')->withFlashMessage('Leave type successfully updated!');
	}

	/**
	 * Remove the specified leavetype from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$leavetype = Leavetype::findOrFail($id);
		Leavetype::destroy($id);

		Audit::logaudit('Leave Type', 'delete', 'deleted leave type '.$leavetype->name);

		return Redirect::route('leavetypes.index')->withDeleteMessage('Leave type successfully deleted!');
	}

}
