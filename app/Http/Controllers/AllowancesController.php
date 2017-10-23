<?php

namespace App\Http\Controllers;

use App\Allowance;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class AllowancesController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$allowances = Allowance::all();

		
       Audit::logaudit('Allowance', 'view', 'viewed allowances');


		return view('allowances.index', compact('allowances'));
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('allowances.create');
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Allowance::$rules, Allowance::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$allowance = new Allowance;

		$allowance->allowance_name = Input::get('name');

        $allowance->organization_id = '1';

		$allowance->save();

		Audit::logaudit('Allowances', 'create', 'created allowance '.$allowance->allowance_name);


		return Redirect::route('allowances.index')->withFlashMessage('Allowance successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$allowance = Allowance::findOrFail($id);

		return view('allowances.show', compact('allowance'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$allowance = Allowance::find($id);

		return view('allowances.edit', compact('allowance'));
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$allowance = Allowance::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Allowance::$rules, Allowance::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$allowance->allowance_name = Input::get('name');
		$allowance->update();

		Audit::logaudit('Allowances', 'update', 'updated allowance '.$allowance->allowance_name);

		return Redirect::route('allowances.index')->withFlashMessage('Allowance successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$allowance = Allowance::findOrFail($id);
		Allowance::destroy($id);

		Audit::logaudit('Allowances', 'delete', 'deleted allowance '.$allowance->allowance_name);

		return Redirect::route('allowances.index')->withFlashMessage('Allowance successfully deleted!');
	}

}
