<?php

namespace App\Http\Controllers;

use App\Leaveapplication;
use App\Employee;
use App\Leavetype;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class LeaveapplicationsController extends Controller {

	/**
	 * Display a listing of leaveapplications
	 *
	 * @return Response
	 */
	public function index()
	{
		$leaveapplications = Leaveapplication::where('organization_id',Auth::user()->organization_id)->get();
        if ( !Entrust::can('view_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Vacation Application', 'view', 'viewed vacation applications');
		return Redirect::to('leavemgmt');
	}
	}

	public function createleave()
	{
      $postleave = Input::all();
      $data = array('name' => $postleave['type'], 
      	            'days' => $postleave['days'],
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('leavetypes')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Leavetypes', 'create', 'created vacation type '.$postleave['type']);
        return $check;
        }else{
         return 1;
        }
      
	}

	/**
	 * Show the form for creating a new leaveapplication
	 *
	 * @return Response
	 */
	public function create()
	{
		$employees = Employee::where('organization_id',Auth::user()->organization_id)->where('in_employment','Y')->get();

		$leavetypes = Leavetype::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
        if ( !Entrust::can('create_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('leaveapplications.create', compact('employees', 'leavetypes'));
	}
	}

	/**
	 * Store a newly created leaveapplication in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Leaveapplication::$rules,Leaveapplication::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$employee = Employee::find(array_get($data, 'employee_id'));

		$leavetype = Leavetype::find(array_get($data, 'leavetype_id'));

		$start_date = array_get($data, 'applied_start_date');
		$end_date = array_get($data, 'applied_end_date');

		/*$days_applied = Leaveapplication::getLeaveDays($start_date, $end_date);

		$balance_days = Leaveapplication::getBalanceDays($employee, $leavetype);


		if($days_applied > $balance_days){

			return Redirect::back()->with('info', 'The days you have applied are more than your balance. You have '.$balance_days.' days left');
		}*/


		Leaveapplication::createLeaveApplication($data);

		if(Auth::user()->user_type == 'member'){

			return Redirect::to('css/leave');
		} else {
            Audit::logaudit('Vacation Application', 'create', 'created vacation application for employee '.$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name.' vacation type '.$leavetype->name.' for period from '.$start_date.' to '.$end_date.' ('.Input::get("days").')');
			return Redirect::to('leavemgmt')->withFlashMessage('Vacation application successfully created!');
		}
		
	}

	/**
	 * Display the specified leaveapplication.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$leaveapplication = Leaveapplication::findOrFail($id);

		return view('leaveapplications.show', compact('leaveapplication'));
	}

	/**
	 * Show the form for editing the specified leaveapplication.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$leaveapplication = Leaveapplication::find($id);

		$employees = Employee::where('organization_id',Auth::user()->organization_id)->where("in_employment","Y")->get();

		$leavetypes = Leavetype::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
        if ( !Entrust::can('amend_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('leaveapplications.edit', compact('leaveapplication', 'employees', 'leavetypes'));
	}
	}

	/**
	 * Update the specified leaveapplication in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$leaveapplication = Leaveapplication::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Leaveapplication::$rules,Leaveapplication::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Leaveapplication::amendLeaveApplication($data, $id);

        $employee = Employee::find($leaveapplication->employee_id);
        $leavetype = Leavetype::find($leaveapplication->leavetype_id);

		Audit::logaudit('Vacation Application', 'update', 'updated vacation application for employee '.$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name.' vacation type '.$leavetype->name.' for period from '.$leaveapplication->applied_start_date.' to '.$leaveapplication->applied_end_date.' ('.Input::get("days").')');

		return Redirect::to('leaveamends')->withFlashMessage('Vacation application successfully amended!');
	}

	/**
	 * Remove the specified leaveapplication from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Leaveapplication::destroy($id);

		return Redirect::to('leavemgmt');
	}


	public function approve($id){

		$leaveapplication = Leaveapplication::find($id);

		if ( !Entrust::can('approve_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('leaveapplications.approve', compact('leaveapplication'));
	}



	}


	public function doApprove($id){



		$data = Input::all();

		$leaveapplication = Leaveapplication::findOrFail($id);

		Leaveapplication::approveLeaveApplication($data, $id);

		$employee = Employee::find($leaveapplication->employee_id);
        $leavetype = Leavetype::find($leaveapplication->leavetype_id);

		$days = Leaveapplication::getDays($leaveapplication->approved_end_date,$leaveapplication->approved_start_date,$leaveapplication->is_weekend,$leaveapplication->is_holiday)+1;

        Audit::logaudit('Vacation Application', 'approve', 'approved vacation application for employee '.$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name.' vacation type '.$leavetype->name.' for period from '.$leaveapplication->approved_start_date.' to '.$leaveapplication->approved_end_date.' ('.$days.')');

		return Redirect::to('leaveapprovals')->withFlashMessage('Vacation application successfully approved!');

	}


	public function reject($id){

		if ( !Entrust::can('reject_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Leaveapplication::rejectLeaveApplication($id);

		$leaveapplication = Leaveapplication::findOrFail($id);
         
        $employee = Employee::find($leaveapplication->employee_id);
        $leavetype = Leavetype::find($leaveapplication->leavetype_id);

		$days = Leaveapplication::getDays($leaveapplication->applied_end_date,$leaveapplication->applied_start_date,$leaveapplication->is_weekend,$leaveapplication->is_holiday)+1;
        Audit::logaudit('Vacation Application', 'reject', 'rejected vacation application for employee '.$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name.' vacation type '.$leavetype->name.' for period from '.$leaveapplication->applied_start_date.' to '.$leaveapplication->applied_end_date.' ('.$days.')');

		return Redirect::to('leaverejects')->withDeleteMessage('Vacation application successfully rejected!');
    }
	}

	public function cancel($id){

		if ( !Entrust::can('cancel_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Leaveapplication::cancelLeaveApplication($id);

		$leaveapplication = Leaveapplication::findOrFail($id);

        $employee = Employee::find($leaveapplication->employee_id);
        $leavetype = Leavetype::find($leaveapplication->leavetype_id);

		$days = Leaveapplication::getDays($leaveapplication->applied_end_date,$leaveapplication->applied_start_date,$leaveapplication->is_weekend,$leaveapplication->is_holiday)+1;
        Audit::logaudit('Vacation Application', 'cancel', 'cancelled vacation application for employee '.$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name.' vacation type '.$leavetype->name.' for period from '.$leaveapplication->applied_start_date.' to '.$leaveapplication->applied_end_date.' ('.$days.')');

		return Redirect::to('leavemgmt')->withDeleteMessage('Vacation application successfully cancelled!');
    }
	}

	public function redeem(){

		$employee = Employee::find(Input::get('employee_id'));
		$leeavetype = Leavetype::find(Input::get('leavetype_id'));

		Leaveapplication::RedeemLeaveDays($employee, $leavetype);

		return Redirect::route('leaveapplications.index');

	}


	public function approvals()
	{
		$leaveapplications = Leaveapplication::all();

		if ( !Entrust::can('view_approved_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('leaveapplications.approved', compact('leaveapplications'));
	}
	}


	public function amended()
	{
		$leaveapplications = Leaveapplication::all();
        
        if ( !Entrust::can('view_amended_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('leaveapplications.amended', compact('leaveapplications'));
	}
	}

	public function rejects()
	{
		$leaveapplications = Leaveapplication::all();
        if ( !Entrust::can('view_rejected_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('leaveapplications.rejected', compact('leaveapplications'));
	}
	}

	public function cancellations()
	{
		$leaveapplications = Leaveapplication::all();

		return view('leaveapplications.cancelled', compact('leaveapplications'));
	}

}
