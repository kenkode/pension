<?php

namespace App\Http\Controllers;

use App\Earningsetting;
use App\Earnings;
use App\Employee;
use App\Organization;
use App\Currency;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class EarningsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$earnings = DB::table('employee')
		          ->join('earnings', 'employee.id', '=', 'earnings.employee_id')
		          ->join('earningsettings', 'earnings.earning_id', '=', 'earningsettings.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('earnings.id','first_name','middle_name','last_name','earnings_amount','earning_name')
		          ->get();
        if ( !Entrust::can('view_earning') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		Audit::logaudit('Earnings', 'view', 'viewed earnings');


		return view('other_earnings.index', compact('earnings'));
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
		$earnings = Earningsetting::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();
		if ( !Entrust::can('create_earning') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('other_earnings.create',compact('employees','earnings','currency'));
	}
	}

	public function createearning()
	{
      $postearning = Input::all();
      $data = array('earning_name' => $postearning['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('earningsettings')->insertGetId( $data );
     // $id = DB::table('earningsettings')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Earningsettings', 'create', 'created earning type '.$postearning['name']);
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
		$validator = Validator::make($data = Input::all(), Earnings::$rules, Earnings::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$earning = new Earnings;

		$earning->employee_id = Input::get('employee');

		$earning->earning_id = Input::get('earning');

		$earning->narrative = Input::get('narrative');

		$earning->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$earning->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $earning->earnings_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $earning->earning_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('ddate'))));

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

	    }else{
	    $earning->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $earning->earnings_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $earning->earning_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime(Input::get('ddate')));
        

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

	    }

		$earning->save();

        $type = Earningsetting::find($earning->earning_id);

		Audit::logaudit('Earnings', 'create', 'created earning type '.$type->earning_name.' for '.Employee::getEmployeeName(Input::get('employee')));


		return Redirect::route('other_earnings.index')->withFlashMessage('Earning successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$earning = Earnings::findOrFail($id);

		return view('other_earnings.show', compact('earning'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$earning = DB::table('employee')
		          ->join('earnings', 'employee.id', '=', 'earnings.employee_id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->where('earnings.id','=',$id)
		          ->first();

	   $earningsettings = Earningsetting::all();
       $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

       if ( !Entrust::can('update_earning') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('other_earnings.edit', compact('earning','employees','earningsettings','currency'));
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
		$earning = Earnings::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Earnings::$rules, Earnings::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$earning->earning_id = Input::get('earning');

		$earning->narrative = Input::get('narrative');

        $earning->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$earning->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $earning->earnings_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $earning->earning_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('ddate'))));

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

	    }else{
	    $earning->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $earning->earnings_amount = $a;

        $d=strtotime(Input::get('ddate'));

        $earning->earning_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('ddate')));
        $Last   = date('Y-m-t', strtotime(Input::get('ddate')));
        

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

	    }

		$earning->update();
        $type = Earningsetting::find($earning->earning_id);
		Audit::logaudit('Earnings', 'update', 'updated earning type '.$type->earning_name.' for '.Employee::getEmployeeName($earning->employee_id));

		return Redirect::route('other_earnings.index')->withFlashMessage('Earning successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$earning = Earnings::findOrFail($id);
		$type = Earningsetting::find($earning->earning_id);

		if ( !Entrust::can('delete_earning') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $tern  = DB::table('transact_earnings')->where('earning_id',$id)->count();
		if($tern>0){
			return Redirect::route('other_earnings.index')->withDeleteMessage('Cannot delete this earning because its assigned to a payroll transaction(s)!');
		}else{
		Earnings::destroy($id);

		Audit::logaudit('Earnings', 'delete', 'deleted earning type '.$type->earning_name.' for '.Employee::getEmployeeName($earning->employee_id));

		return Redirect::route('other_earnings.index')->withDeleteMessage('Earning successfully deleted!');

	}
}
	
}

    public function view($id){

		$earning = Earnings::find($id);
		$type = Earningsetting::find($earning->earning_id);

		$organization = Organization::find(Auth::user()->organization_id);

		if ( !Entrust::can('view_earning') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Earnings', 'view', 'viewed earning for employee '.Employee::getEmployeeName($earning->employee_id).' for earning type '.$type->earning_name);

		return view('other_earnings.view', compact('earning'));
	}
		
	}

}
