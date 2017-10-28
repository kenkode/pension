<?php

namespace App\Http\Controllers;

use App\EAllowances;
use App\Allowance;
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

class EmployeeAllowancesController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$eallws = DB::table('employee_allowances')
		          ->join('employee', 'employee_allowances.employee_id', '=', 'employee.id')
		          ->join('allowances', 'employee_allowances.allowance_id', '=', 'allowances.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employee_allowances.id','first_name','middle_name','last_name','allowance_amount','allowance_name')
		          ->get();

        if ( !Entrust::can('view_allowance') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		Audit::logaudit('Employee Allowances', 'view', 'viewed employee allowances');

		return view('employee_allowances.index', compact('eallws'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */

    public function createallowance()
	{
      $postallowance = Input::all();
      $data = array('allowance_name' => $postallowance['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('allowances')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Allowances', 'create', 'created allowance type '.$postallowance['name']);
        return $check;
        }else{
         return 1;
        }
      
	}    

	public function create()
	{
		
		$employees = DB::table('employee')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->get();
		$allowances = Allowance::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

		if ( !Entrust::can('create_allowance') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('employee_allowances.create',compact('employees','allowances','currency'));
	}
	}


	public function display(){
        
      $allw = Allowance::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->orderBy('id','DESC')->first();
          
      return json_encode(array("id"=>$allw->id,"name"=>$allw->allowance_name));
      exit();

    }

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), EAllowances::$rules, EAllowances::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$allowance = new EAllowances;

		$allowance->employee_id = Input::get('employee');

		$allowance->allowance_id = Input::get('allowance');

        $allowance->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$allowance->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );

        $allowance->allowance_amount = $a;

        $d=strtotime(Input::get('adate'));

        $allowance->allowance_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('adate'))));

        $First  = date('Y-m-01', strtotime(Input::get('adate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

	    }else{
	    $allowance->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );

        $allowance->allowance_amount = $a;

        $d=strtotime(Input::get('adate'));

        $allowance->allowance_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('adate')));
        $Last   = date('Y-m-t', strtotime(Input::get('adate')));
        

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

	    }
        

		$allowance->save();

		$alw = Allowance::find($allowance->allowance_id);

		Audit::logaudit('Employee Allowances', 'create', 'assigned allowance amount '.$allowance->allowance_amount.' to'.Employee::getEmployeeName(Input::get('employee')).' for allowance type '.$alw->allowance_name);

		return Redirect::route('employee_allowances.index')->withFlashMessage('Employee Allowance successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$eallw = EAllowances::findOrFail($id);

		return view('employee_allowances.show', compact('eallw'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$eallw = EAllowances::find($id);
		$employees = Employee::where('organization_id',Auth::user()->organization_id)->get();
		$allowances = Allowance::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
                $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

        if ( !Entrust::can('update_allowance') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{        
		return view('employee_allowances.edit', compact('eallw','allowances','employees','currency'));
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
		$allowance = EAllowances::findOrFail($id);

		$validator = Validator::make($data = Input::all(), EAllowances::$rules, EAllowances::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}


		$allowance->allowance_id = Input::get('allowance');

        $allowance->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$allowance->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );

        $allowance->allowance_amount = $a;

        $d=strtotime(Input::get('adate'));

        $allowance->allowance_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('adate'))));

        $First  = date('Y-m-01', strtotime(Input::get('adate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

	    }else{
	    $allowance->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );

        $allowance->allowance_amount = $a;

        $d=strtotime(Input::get('adate'));

        $allowance->allowance_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('adate')));
        $Last   = date('Y-m-t', strtotime(Input::get('adate')));
        

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

	    }


		$allowance->update();

		$alw = Allowance::find($allowance->allowance_id);

		Audit::logaudit('Employee Allowances', 'update', 'updated allowance '.$alw->allowance_name.' to '.Employee::getEmployeeName($allowance->employee_id));

		return Redirect::route('employee_allowances.index')->withFlashMessage('Employee Allowance successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$allowance = EAllowances::findOrFail($id);
        $alw = Allowance::find($allowance->allowance_id);
		if ( !Entrust::can('delete_allowance') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $talw  = DB::table('transact_allowances')->where('employee_allowance_id',$id)->count();
		if($talw>0){
			return Redirect::route('employee_allowances.index')->withDeleteMessage('Cannot delete this allowance because its assigned to a payroll transaction(s)!');
		}else{
		EAllowances::destroy($id);


		Audit::logaudit('Employee Allowances', 'delete', 'deleted allowance '.$alw->allowance_name.' for '.Employee::getEmployeeName($allowance->employee_id));


		return Redirect::route('employee_allowances.index')->withDeleteMessage('Employee Allowance successfully deleted!');
	}
    }
	}

    public function view($id){

		$eallw = DB::table('employee_allowances')
		          ->join('employee', 'employee_allowances.employee_id', '=', 'employee.id')
		          ->join('allowances', 'employee_allowances.allowance_id', '=', 'allowances.id')
		          ->where('employee_allowances.id','=',$id)
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employee_allowances.id','first_name','last_name','middle_name','allowance_amount',
		          	'allowance_name','photo','signature','formular','instalments','allowance_date','first_day_month','last_day_month','employee_id')
		          ->first();

		$organization = Organization::find(Auth::user()->organization_id);

		if ( !Entrust::can('view_allowance') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Employee Allowances', 'view', 'viewed allowance for employee '.Employee::getEmployeeName($eallw->employee_id).' for allowance type '.$eallw->allowance_name);

		return view('employee_allowances.view', compact('eallw'));
	}
		
	}


}
