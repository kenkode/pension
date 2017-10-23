<?php

namespace App\Http\Controllers;

use App\NssfRates;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class NssfController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$nrates = DB::table('social_security')->where('income_from', '!=', 0.00)->get();

		return view('nssf.index', compact('nrates'));
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('nssf.create');
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), NssfRates::$rules,NssfRates::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nrate = new NssfRates;

		$nrate->tier = Input::get('tier');

		$nrate->income_from = Input::get('i_from');

		$nrate->income_to = Input::get('i_to');

		$nrate->ss_amount_employee = Input::get('employee_amount');

		$nrate->ss_amount_employer = Input::get('employer_amount');

        $nrate->organization_id = '1';

		$nrate->save();

		Audit::logaudit('NSSF Rates', 'create', 'created NSSF Rates income from '.$nrate->income_from.' to '.$nrate->income_to.' employee amount '.$nrate->ss_amount_employee.' employer amount '.$nrate->ss_amount_employer.' tier '.$nrate->tier);

		return Redirect::route('nssf.index')->withFlashMessage('NSSF Rate successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$nrate = NssfRates::findOrFail($id);

		return view('nssf.show', compact('nrate'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$nrate = NssfRates::find($id);

		return view('nssf.edit', compact('nrate'));
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$nrate = NssfRates::findOrFail($id);

		$validator = Validator::make($data = Input::all(), NssfRates::$rules,NssfRates::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nrate->tier = Input::get('tier');

		$nrate->income_from = Input::get('i_from');

		$nrate->income_to = Input::get('i_to');

		$nrate->ss_amount_employee = Input::get('employee_amount');

		$nrate->ss_amount_employer = Input::get('employer_amount');

		$nrate->update();

		Audit::logaudit('NSSF Rates', 'update', 'updated NSSF Rates income from '.$nrate->income_from.' to '.$nrate->income_to.' employee amount '.$nrate->ss_amount_employee.' employer amount '.$nrate->ss_amount_employer.' tier '.$nrate->tier);

		return Redirect::route('nssf.index')->withFlashMessage('NSSF Rate successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$nrate = NssfRates::findOrFail($id);
		NssfRates::destroy($id);

		Audit::logaudit('NSSF Rates', 'delete', 'deleted NSSF Rates income from '.$nrate->income_from.' to '.$nrate->income_to.' employee amount '.$nrate->ss_amount_employee.' employer amount '.$nrate->ss_amount_employer.' tier '.$nrate->tier);

		return Redirect::route('nssf.index')->withDeleteMessage('NSSF Rate successfully deleted!');
	}

}
