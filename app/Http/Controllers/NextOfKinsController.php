<?php

namespace App\Http\Controllers;


use App\Nextofkin;
use App\Employee;
use App\Organization;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class NextOfKinsController extends Controller {

	/**
	 * Display a listing of kins
	 *
	 * @return Response
	 */
	public function index()
	{
		$kins = DB::table('employee')
		          ->join('nextofkins', 'employee.id', '=', 'nextofkins.employee_id')
		          ->where('in_employment','=','Y')
		          ->where('organization_id',Auth::user()->organization_id)
		          ->get();

		Audit::logaudit('Next of Kins', 'view', 'viewed employee next of kin');

		return view('nextofkins.index', compact('kins'));
	}

	public function serializecheck(){
		
        return Input::get('kin_first_name');
        
	}

	/**
	 * Show the form for creating a new kin
	 *
	 * @return Response
	 */
	public function create()
	{  

		$employees = DB::table('employee')
		          ->where('in_employment','=','Y')
		          ->where('organization_id',Auth::user()->organization_id)
		          ->get();
		return view('nextofkins.create', compact('employees'));
	}

	/**
	 * Store a newly created kin in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Nextofkin::$rules,Nextofkin::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}


		$kin = new Nextofkin;

		$kin->employee_id=Input::get('employee_id');
		$kin->first_name = Input::get('fname');
		$kin->middle_name = Input::get('mname');
		$kin->last_name = Input::get('lname');
		$kin->relationship = Input::get('rship');
		$kin->contact = Input::get('contact');
		$kin->id_number = Input::get('id_number');
		$kin->save();

		Audit::logaudit('NextofKins', 'create', 'created kin '.$kin->first_name.' '.$kin->last_name.' for '.Employee::getEmployeeName(Input::get('employee_id')));


		return Redirect::to('employees/view/'.$kin->employee_id)->withFlashMessage('Employee`s next of kin successfully created!');
	}

	/**
	 * Display the specified kin.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$kin = Nextofkin::findOrFail($id);

		return view('nextofkins.show', compact('kin'));
	}

	/**
	 * Show the form for editing the specified kin.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$kin = Nextofkin::find($id);

		return view('nextofkins.edit', compact('kin'));
	}

	/**
	 * Update the specified kin in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$kin = Nextofkin::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Nextofkin::$rules,Nextofkin::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}
        
		$kin->first_name = Input::get('fname');
		$kin->middle_name = Input::get('mname');
		$kin->last_name = Input::get('lname');
		$kin->relationship = Input::get('rship');
		$kin->contact = Input::get('contact');
		$kin->id_number = Input::get('id_number');

		$kin->update();

		Audit::logaudit('NextofKins', 'update', 'updated kin '.$kin->first_name.' '.$kin->last_name.' for '.Employee::getEmployeeName($kin->employee_id));

		return Redirect::to('employees/view/'.$kin->employee_id)->withFlashMessage('Employee`s next of kin successfully updated!');
	}

	public function kinupdate($id)
	{
		$kin = Nextofkin::findOrFail(Input::get('kin_id'));

		$validator = Validator::make($data = Input::all(), Nextofkin::$rules,Nextofkin::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}
        
		$kin->first_name = Input::get('fname');
		$kin->middle_name = Input::get('mname');
		$kin->last_name = Input::get('lname');
		$kin->relationship = Input::get('rship');
		$kin->contact = Input::get('contact');
		$kin->id_number = Input::get('id_number');

		$kin->update();

		Audit::logaudit('NextofKins', 'update', 'updated kin '.$kin->first_name.' '.$kin->last_name.' for '.Employee::getEmployeeName($kin->employee_id));

		return Redirect::to('employees/view/'.$kin->employee_id)->withFlashMessage('Employee`s next of kin successfully updated!');
	}

	/**
	 * Remove the specified kin from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$kin = Nextofkin::findOrFail($id);
		Nextofkin::destroy($id);
		Audit::logaudit('NextofKins', 'delete', 'deleted kin '.$kin->first_name.' '.$kin->last_name.' for '.Employee::getEmployeeName($kin->employee_id));

		return Redirect::to('employees/view/'.$kin->employee_id)->withDeleteMessage('Employee`s next of kin successfully deleted!');
	}

	public function view($id){

		$kin = Nextofkin::find($id);

		$organization = Organization::find(Auth::user()->organization_id);

		Audit::logaudit('NextofKins', 'view', 'viewed kin '.$kin->first_name.' '.$kin->last_name.' for '.Employee::getEmployeeName($kin->employee_id));

		return view('nextofkins.view', compact('kin'));
		
	}


}
