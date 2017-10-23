<?php

namespace App\Http\Controllers;

use App\Holiday;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;


class HolidaysController extends Controller {

	/**
	 * Display a listing of holidays
	 *
	 * @return Response
	 */
	public function index()
	{
		$holidays = Holiday::all();
        Audit::logaudit('Holiday', 'view', 'viewed holidays');

		return view('holidays.index', compact('holidays'));
	}

	/**
	 * Show the form for creating a new holiday
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('holidays.create');
	}

	/**
	 * Store a newly created holiday in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Holiday::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Holiday::createHoliday($data);

		Audit::logaudit('Holiday', 'create', 'created holiday '.Input::get("name"));

		return Redirect::route('holidays.index')->withFlashMessage('Holiday successfully created!');
	}

	/**
	 * Display the specified holiday.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$holiday = Holiday::findOrFail($id);

		return view('holidays.show', compact('holiday'));
	}

	/**
	 * Show the form for editing the specified holiday.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$holiday = Holiday::find($id);

		return view('holidays.edit', compact('holiday'));
	}

	/**
	 * Update the specified holiday in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$holiday = Holiday::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Holiday::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Holiday::updateHoliday($data, $id);
		Audit::logaudit('Holiday', 'update', 'updated holiday '.Input::get("name"));

		return Redirect::route('holidays.index')->withFlashMessage('Holiday successfully updated!');
	}

	/**
	 * Remove the specified holiday from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{

		$holiday = Holiday::findOrFail($id);
		Holiday::destroy($id);
		Audit::logaudit('Holiday', 'update', 'updated holiday '.$holiday->name);

		return Redirect::route('holidays.index')->withDeleteMessage('Holiday successfully deleted!');
	}

}
