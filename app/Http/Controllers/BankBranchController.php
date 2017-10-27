<?php

namespace App\Http\Controllers;

use App\BBranch;
use App\Bank;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class BankBranchController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$bbranches = BBranch::all();

		if ( !Entrust::can('view_bank_branch') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Bank Branch', 'view', 'view bank branches');

		return view('bank_branch.index', compact('bbranches'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		$banks = Bank::all();
		if ( !Entrust::can('create_bank_branch') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('bank_branch.create',compact('banks'));
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), BBranch::$rules,BBranch::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$bbranch = new BBranch;

		$bbranch->bank_branch_name = Input::get('name');

		$bbranch->branch_code = Input::get('code');

		$bbranch->bank_id = Input::get('bank_id');

        $bbranch->organization_id = '1';

		$bbranch->save();

		Audit::logaudit('Bank Branch', 'create', 'created bank branch '.Input::get('code').' - '.Input::get('name')); 

		return Redirect::route('bank_branch.index')->withFlashMessage('Bank Branch successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$bbranch = BBranch::findOrFail($id);

		return view('bank_branch.show', compact('bbranch'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$bbranch = BBranch::find($id);
		$banks = Bank::all();

        if ( !Entrust::can('update_bank_branch') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('bank_branch.edit', compact('bbranch','banks'));
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
		$bbranch = BBranch::findOrFail($id);

		$validator = Validator::make($data = Input::all(), BBranch::$rules,BBranch::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$bbranch->bank_branch_name = Input::get('name');
		$bbranch->branch_code = Input::get('code');
		$bbranch->bank_id = Input::get('bank_id');
		$bbranch->update();

		Audit::logaudit('Bank Branch', 'update', 'update bank branch '.Input::get('code').' - '.Input::get('name')); 

		return Redirect::route('bank_branch.index')->withFlashMessage('Bank Branch successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$bbranch = BBranch::findOrFail($id);

		if ( !Entrust::can('delete_bank_branch') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $bb  = DB::table('employee')->where('bank_branch_id',$id)->count();
		if($bb>0){
			return Redirect::route('bank_branch.index')->withDeleteMessage('Cannot delete this bank branch because its assigned to an employee(s)!');
		}else{
		BBranch::destroy($id);

		Audit::logaudit('Bank Branch', 'delete', 'deleted bank branch '.$bbranch->branch_code.' - '.$bbranch->bank_branch_name); 

		return Redirect::route('bank_branch.index')->withDeleteMessage('Bank Branch successfully deleted!');
	}
	}
    }

}
