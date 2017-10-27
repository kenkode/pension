<?php

namespace App\Http\Controllers;

use App\Account;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class AccountsController extends Controller {

	/**
	 * Display a listing of accounts
	 *
	 * @return Response
	 */
	public function index()
	{
		$accounts = DB::table('accounts')->orderBy('code', 'asc')->get();

		if ( !Entrust::can('view_account') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Accounts', 'view', 'view chart of accounts');

		return view('accounts.index', compact('accounts'));
        }
		
	}

	/**
	 * Show the form for creating a new account
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_account') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('accounts.create');
	}
	}

	/**
	 * Store a newly created account in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Account::$rules, Account::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}


		// check if code exists
		$code = Input::get('code');
		$code_exists = DB::table('accounts')->where('code', '=', $code)->count();

		if($code_exists >= 1){

			return Redirect::back()->withErrors(array('error'=>'The Account code already exists'))->withInput();
		}
		else {


		$account = new Account;


		$account->category = Input::get('category');
		$account->name = Input::get('name');
		$account->code = Input::get('code');
		//$account->balance = Input::get('balance');
		$account->organization_id = Auth::user()->organization_id;
		if(Input::get('active')){
			$account->active = TRUE;
		}
		else {
			$account->active = FALSE;
		}
		$account->save();

		}

		Audit::logaudit('Accounts', 'create', 'created: '.$account->name.' '.$account->code);

		return Redirect::route('accounts.index')->withFlashMessage('Account successfully created!');
	}

	/**
	 * Display the specified account.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$account = Account::findOrFail($id);

		return view('accounts.show', compact('account'));
	}

	/**
	 * Show the form for editing the specified account.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$account = Account::find($id);

        if ( !Entrust::can('update_account') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('accounts.edit', compact('account'));
	}
	}

	/**
	 * Update the specified account in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$account = Account::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Account::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$code = Input::get('code');
		$original_code = DB::table('accounts')->where('id', '!=', $account->id)->where('code', $code)->count();

		if($original_code > 0) {

			return Redirect::back()->withErrors(array('error'=>'The Account code already exists'))->withInput();
		}else {

		$account->category = Input::get('category');
		$account->name = Input::get('name');
		$account->code = Input::get('code');
		//$account->balance = Input::get('balance');
		if(Input::get('active')){
			$account->active = TRUE;
		}
		else {
			$account->active = FALSE;
		}

		$account->organization_id = Auth::user()->organization_id;
		$account->update();

		}
		
		Audit::logaudit('Accounts', 'update', 'updated: '.$account->name.' '.$account->code);


		return Redirect::route('accounts.index')->withFlashMessage('Account successfully updated!');
	}

	/**
	 * Remove the specified account from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{

		$account = Account::findOrFail($id);

		if ( !Entrust::can('delete_account') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $acc  = DB::table('transact')->where('account_id',$id)->count();
		if($acc>0){
			return Redirect::route('accounts.index')->withDeleteMessage('Cannot delete this account because its assigned to payroll(s)!');
		}else{
		Account::destroy($id);


		Audit::logaudit('Accounts', 'delete', 'deleted:'.$account->name.' '.$account->code);


		return Redirect::route('accounts.index')->withDeleteMessage('Account successfully deleted!');
	}
    }
	}

}
