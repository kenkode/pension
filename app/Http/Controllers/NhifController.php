<?php
namespace App\Http\Controllers;

use App\NhifRates;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class NhifController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$nrates = DB::table('hospital_insurance')->where('income_from', '!=', 0.00)->get();
		if ( !Entrust::can('view_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('NHIF Rates', 'view', 'viewed NHIF Rates ');
		return view('nhif.index', compact('nrates'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('nhif.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), NhifRates::$rules,NhifRates::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nrate = new NhifRates;

		$nrate->income_from = Input::get('i_from');

		$nrate->income_to = Input::get('i_to');

		$nrate->hi_amount = Input::get('amount');

        $nrate->organization_id = '1';

		$nrate->save();

		Audit::logaudit('NHIF Rates', 'create', 'created NHIF Rate income from '.$nrate->income_from.' to '.$nrate->income_to.' amount '.$nrate->hi_amount);

		return Redirect::route('nhif.index')->withFlashMessage('NHIF Rate successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$nrate = NhifRates::findOrFail($id);

		return view('nhif.show', compact('nrate'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$nrate = NhifRates::find($id);
        if ( !Entrust::can('update_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('nhif.edit', compact('nrate'));
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
		$nrate = NhifRates::findOrFail($id);

		$validator = Validator::make($data = Input::all(), NhifRates::$rules,NhifRates::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nrate->income_from = Input::get('i_from');

		$nrate->income_to = Input::get('i_to');

		$nrate->hi_amount = Input::get('amount');

		$nrate->update();

		Audit::logaudit('NHIF Rates', 'update', 'updated NHIF Rates income from '.$nrate->income_from.' to '.$nrate->income_to.' amount '.$nrate->hi_amount);

		return Redirect::route('nhif.index')->withFlashMessage('NHIF Rate successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$nrate = NhifRates::findOrFail($id);

        if ( !Entrust::can('delete_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		NhifRates::destroy($id);

		Audit::logaudit('NHIF Rates', 'delete', 'deleted NHIF Rates income from '.$nrate->income_from.' to '.$nrate->income_to.' amount '.$nrate->hi_amount);

		return Redirect::route('nhif.index')->withDeleteMessage('NHIF Rate successfully deleted!');
	}
	}

}
