<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class BranchesController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$branches = Branch::all();

		Audit::logaudit('Branch', 'view', 'viewed branches');

		return view('branches.index', compact('branches'));
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('branches.create');
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Branch::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$branch = new Branch;

		$branch->name = Input::get('name');
		$branch->save();

		Audit::logaudit('Branch', 'create', 'created branch '.Input::get('name'));

		return Redirect::route('branches.index')->withFlashMessage('Branch successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$branch = Branch::findOrFail($id);

		return view('branches.show', compact('branch'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$branch = Branch::find($id);

		return view('branches.edit', compact('branch'));
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$branch = Branch::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Branch::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$branch->name = Input::get('name');
		$branch->update();

        Audit::logaudit('Branch', 'update', 'updated branch '.Input::get('name'));
		return Redirect::route('branches.index')->withFlashMessage('Branch successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$branch = Branch::findOrFail($id);
		Branch::destroy($id);

		Audit::logaudit('Branch', 'delete', 'deleted branch '.$branch->name);

		return Redirect::route('branches.index')->withDeleteMessage('Branch successfully deleted!');
	}

}
