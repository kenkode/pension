<?php

namespace App\Http\Controllers;

use App\Deduction;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class PayrollDeductionsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$deductions = Deduction::all();

		if ( !Entrust::can('view_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Deductions', 'view', 'viewed deduction list ');

		return view('deductions.index', compact('deductions'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('deductions.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Deduction::$rules, Deduction::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$deduction = new Deduction;

		$deduction->deduction_name = Input::get('name');

        $deduction->organization_id = '1';

		$deduction->save();

		Audit::logaudit('Deductions', 'create', 'created deduction '.$deduction->deduction_name);

		return Redirect::route('deductions.index')->withFlashMessage('Deduction successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$deduction = Deduction::findOrFail($id);

		return view('deductions.show', compact('deduction'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$deduction = Deduction::find($id);

		if ( !Entrust::can('update_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('deductions.edit', compact('deduction'));
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
		$deduction = Deduction::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Deduction::$rules, Deduction::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$deduction->deduction_name = Input::get('name');
		$deduction->update();

		Audit::logaudit('Deductions', 'update', 'updated deduction '.$deduction->deduction_name);

		return Redirect::route('deductions.index')->withFlashMessage('Deduction successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$deduction = Deduction::findOrFail($id);

		if ( !Entrust::can('delete_deduction') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$ded  = DB::table('employee_deductions')->where('deduction_id',$id)->count();
        $tded  = DB::table('transact_deductions')->where('deduction_id',$id)->count();
		if($ded>0){
			return Redirect::route('deductions.index')->withDeleteMessage('Cannot delete this deduction because its assigned to an employee(s)!');
		}else if($tded>0){
			return Redirect::route('deductions.index')->withDeleteMessage('Cannot delete this deduction because its assigned to a payroll transaction(s)!');
		}else{
		Deduction::destroy($id);

		Audit::logaudit('Deductions', 'delete', 'deleted deduction '.$deduction->deduction_name);


		return Redirect::route('deductions.index')->withDeleteMessage('Deduction successfully deleted!');
	}
	}
}

}

