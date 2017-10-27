<?php

namespace App\Http\Controllers;

use App\Property;
use App\Employee;
use App\User;
use App\Currency;
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
use Response;
use Session;

class PropertiesController extends Controller {

	/**
	 * Display a listing of kins
	 *
	 * @return Response
	 */
	public function index()
	{
		$properties = DB::table('employee')
		          ->join('properties', 'employee.id', '=', 'properties.employee_id')
		          ->where('in_employment','=','Y')
		          ->where('organization_id',Auth::user()->organization_id)
		          ->get();

		if ( !Entrust::can('view_property') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Properties', 'view', 'viewed company properties');

		return view('properties.index', compact('properties'));
	}
	}

	/**
	 * Show the form for creating a new kin
	 *
	 * @return Response
	 */
	public function create()
	{
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();
		$employees = DB::table('employee')
		          ->where('in_employment','=','Y')
		          ->where('organization_id',Auth::user()->organization_id)
		          ->get();
        if ( !Entrust::can('create_property') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('properties.create', compact('employees','currency'));
	}
	}

	/**
	 * Store a newly created kin in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Property::$rules,Property::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}


		$property = new Property;

		$property->employee_id=Input::get('employee_id');
		$property->name = Input::get('name');
		$property->description = Input::get('desc');
		$property->serial = Input::get('serial');
		$property->digitalserial = Input::get('dserial');
		$a = str_replace( ',', '', Input::get('amount') );
		$property->monetary = $a;
		$property->issued_by = Auth::user()->id;
		$property->issue_date = Input::get('idate');
		$property->scheduled_return_date = Input::get('sdate');
		if(filter_var(Input::get('active'), FILTER_VALIDATE_BOOLEAN)){
        $property->state = 1;
        $property->received_by = Auth::user()->id;
        $property->return_date = Input::get('idate');
		}else{
        $property->state = 0;
        $property->received_by = 0;
        $property->return_date = null;
		}
		$property->save();

		Audit::logaudit('Properties', 'create', 'created property '.$property->name.' for '.Employee::getEmployeeName(Input::get('employee_id')));

        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$property->employee_id)->withFlashMessage('Company property successfully created!');
        }else{
		return Redirect::to('Properties/view/'.$property->id)->withFlashMessage('Company property successfully created!');
	}
	}

	/**
	 * Display the specified kin.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$property = Property::findOrFail($id);

		return view('properties.show', compact('property'));
	}

	/**
	 * Show the form for editing the specified kin.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$property = Property::find($id);

        $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();
		$user = User::findOrFail($property->issued_by);

		if($property->received_by>0){
        $retuser = User::findOrFail($property->received_by);
		}

        if ( !Entrust::can('update_property') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('properties.edit', compact('currency','property','user','retuser'));
	}
	}

	/**
	 * Update the specified kin in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$property = Property::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Property::$rules,Property::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}
        
		$property->name = Input::get('name');
		$property->description = Input::get('desc');
		$property->serial = Input::get('serial');
		$property->digitalserial = Input::get('dserial');
		$a = str_replace( ',', '', Input::get('amount') );
		$property->monetary = $a;
		$property->issue_date = Input::get('idate');
		$property->scheduled_return_date = Input::get('sdate');
		if(filter_var(Input::get('active'), FILTER_VALIDATE_BOOLEAN)){
        $property->state = 1;
        $property->received_by = Auth::user()->id;
        $property->return_date = date('Y-m-d');
		}else{
        $property->state = 0;
        $property->received_by = 0;
        $property->return_date = null;
		}

		$property->update();

		Audit::logaudit('Properties', 'update', 'updated property '.$property->name.' for '.Employee::getEmployeeName($property->employee_id));
 
        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$property->employee_id)->withFlashMessage('Company property successfully updated!');
        }else{
		return Redirect::to('Properties/view/'.$id)->withFlashMessage('Company Property successfully updated!');
	}
	}

	/**
	 * Remove the specified kin from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$property = Property::findOrFail($id);

		if ( !Entrust::can('delete_property') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		
		Property::destroy($id);

		Audit::logaudit('Properties', 'delete', 'deleted property '.$property->name.' for '.Employee::getEmployeeName($property->employee_id));

        if(Session::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$property->employee_id)->withDeleteMessage('Company Property successfully deleted!');
        }else{
		return Redirect::to('Properties')->withDeleteMessage('Company Property successfully deleted!');
	}
    }
	}
    
    public function view($id){

		$property = Property::find($id);

		$user = User::findOrFail($property->issued_by);

		if($property->received_by>0){
        $retuser = User::findOrFail($property->received_by);
		}

		$organization = Organization::find(Auth::user()->organization_id);

		if ( !Entrust::can('view_property') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('properties.view', compact('property','user','retuser'));
	}
		
	}

}
