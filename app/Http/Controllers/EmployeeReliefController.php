<?php

namespace App\Http\Controllers;

use App\ERelief;
use App\Currency;
use App\Employee;
use App\Organization;
use App\Relief;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class EmployeeReliefController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$rels = DB::table('employee')
		          ->join('employee_relief', 'employee.id', '=', 'employee_relief.employee_id')
		          ->join('relief', 'employee_relief.relief_id', '=', 'relief.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employee_relief.id','first_name','middle_name','last_name','relief_amount','relief_name')
		          ->get();

		if ( !Entrust::can('view_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{                 
		Audit::logaudit('Employee Reliefs', 'view', 'viewed employee relief');
		return view('employee_relief.index', compact('rels'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		
		$employees = DB::table('employee')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->get();
		$reliefs = Relief::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

		if ( !Entrust::can('create_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{      
		return view('employee_relief.create',compact('employees','reliefs','currency'));
	}
	}

	public function createrelief()
	{
      $postrelief = Input::all();
      $data = array('relief_name' => $postrelief['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('relief')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Reliefs', 'create', 'created relief type '.$postrelief['name']);
        return $check;
        }else{
         return 1;
        }
      
	}    

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), ERelief::$rules, ERelief::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$rel = new ERelief;

		$rel->employee_id = Input::get('employee');

		$rel->relief_id = Input::get('relief');

		$a = str_replace( ',', '', Input::get('amount') );

        $rel->relief_amount = $a;

		$rel->save();
		$r = Relief::find($rel->relief_id);

		Audit::logaudit('Employee Reliefs', 'create', 'created relief amount '.$rel->relief_amount.' for '.Employee::getEmployeeName(Input::get('employee')).' for relief type '.$r->relief_name);

		return Redirect::route('employee_relief.index')->withFlashMessage('Employee Relief successfully created!');
	}
	

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$rel = ERelief::findOrFail($id);

		return view('employee_relief.show', compact('rel'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		
		$rel = ERelief::find($id);
		$employees = Employee::where('employee.organization_id',Auth::user()->organization_id)->get();
                $reliefs = Relief::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
                $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();
        if ( !Entrust::can('update_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{      
		return view('employee_relief.edit', compact('rel','employees','reliefs','currency'));
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
		$rel = ERelief::findOrFail($id);

		$validator = Validator::make($data = Input::all(), ERelief::$rules, ERelief::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$rel->relief_id = Input::get('relief');

        $a = str_replace( ',', '', Input::get('amount') );

        $rel->relief_amount = $a;

		$rel->update();

		$r = Relief::find($rel->relief_id);

		Audit::logaudit('Employee Reliefs', 'update', 'updated relief '.$r->relief_name.' for employee '.Employee::getEmployeeName($rel->employee_id));

		return Redirect::route('employee_relief.index')->withFlashMessage('Employee Relief successfully updated!');
	}
	

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$rel = ERelief::findOrFail($id);
		$r = Relief::find($rel->relief_id);
		if ( !Entrust::can('delete_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{   
        $trel  = DB::table('transact_reliefs')->where('employee_relief_id',$id)->count();
		if($trel>0){
			return Redirect::route('employee_relief.index')->withDeleteMessage('Cannot delete this relief because its assigned to a payroll transaction(s)!');
		}else{   
		ERelief::destroy($id);
        Audit::logaudit('Employee Reliefs', 'delete', 'deleted: '.$rel->relief_amount.' for '.Employee::getEmployeeName($rel->employee_id));
		return Redirect::route('employee_relief.index')->withDeleteMessage('Employee Relief successfully deleted!');
	}
	}
	}

	public function view($id){

		$rel = DB::table('employee')
		          ->join('employee_relief', 'employee.id', '=', 'employee_relief.employee_id')
		          ->join('relief', 'employee_relief.relief_id', '=', 'relief.id')
		          ->where('employee_relief.id','=',$id)
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employee_relief.id','first_name','last_name','relief_amount','relief_name','middle_name','photo','signature','employee_id','relief_id')
		          ->first();

		$r = Relief::find($rel->relief_id);

        if ( !Entrust::can('view_relief') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{      
		$organization = Organization::find(Auth::user()->organization_id);
        Audit::logaudit('Employee Reliefs', 'view', 'viewed relief '.$r->relief_name.' for '.Employee::getEmployeeName($rel->employee_id));
		return view('employee_relief.view', compact('rel'));
	}
		
	}

}
