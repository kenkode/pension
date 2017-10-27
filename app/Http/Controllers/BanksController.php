<?php

namespace App\Http\Controllers;

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

class BanksController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$banks = Bank::all();

		if ( !Entrust::can('view_bank') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Banks', 'view', 'viewed banks');

		return view('banks.index', compact('banks'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_bank') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('banks.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Bank::$rules,Bank::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$bank = new Bank;

		$bank->bank_code = Input::get('code');

		$bank->bank_name = Input::get('name');

        $bank->organization_id = '1';

		$bank->save();

		Audit::logaudit('Banks', 'create', 'created bank '.Input::get('code').' - '.Input::get('name'));

		return Redirect::route('banks.index')->withFlashMessage('Bank successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$bank = Bank::findOrFail($id);

		return view('banks.show', compact('bank'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$bank = Bank::find($id);

		if ( !Entrust::can('update_bank') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('banks.edit', compact('bank'));
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
		$bank = Bank::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Bank::$rules, Bank::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}
        $bank->bank_code = Input::get('code');
		$bank->bank_name = Input::get('name');
		$bank->update();

		Audit::logaudit('Banks', 'update', 'updated bank '.Input::get('code').' - '.Input::get('name'));

		return Redirect::route('banks.index')->withFlashMessage('Bank successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$bank = Bank::findOrFail($id);

		if ( !Entrust::can('delete_bank') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $bn  = DB::table('employee')->where('bank_id',$id)->count();
		if($bn>0){
			return Redirect::route('banks.index')->withDeleteMessage('Cannot delete this bank because its assigned to an employee(s)!');
		}else{
		Bank::destroy($id);

		Audit::logaudit('Banks', 'delete', 'deleted bank '.$bank->bank_code.' - '.$bank->bank_name);

		return Redirect::route('banks.index')->withDeleteMessage('Bank successfully deleted!');
	}
    }
	}

}
