<?php

namespace App\Http\Controllers;

use App\Employeenontaxable;
use App\Currency;
use App\Employee;
use App\Organization;
use App\Nontaxable;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class EmployeeNonTaxableController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$nontaxables = DB::table('employee')
		          ->join('employeenontaxables', 'employee.id', '=', 'employeenontaxables.employee_id')
		          ->join('nontaxables', 'employeenontaxables.nontaxable_id', '=', 'nontaxables.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employeenontaxables.id','first_name','middle_name','last_name','nontaxable_amount','name')
		          ->get();

		if ( !Entrust::can('view_nontaxable') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{                  
		return view('employeenontaxables.index', compact('nontaxables'));
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
		$nontaxables = Nontaxable::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		$currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();
		if ( !Entrust::can('create_nontaxable') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('employeenontaxables.create',compact('employees','nontaxables','currency'));
	}
	}

	public function createnontaxable()
	{
      $postdeduction = Input::all();
      $data = array('name' => $postdeduction['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('nontaxables')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Nontaxables', 'create', 'created non taxable income type '.$postdeduction['name']);
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
		$validator = Validator::make($data = Input::all(), Employeenontaxable::$rules, Employeenontaxable::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nontaxable = new Employeenontaxable;

		$nontaxable->employee_id = Input::get('employee');

		$nontaxable->nontaxable_id = Input::get('income');

		$nontaxable->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$nontaxable->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $nontaxable->nontaxable_amount = $a;

        $d=strtotime(Input::get('idate'));

        $nontaxable->nontaxable_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('idate'))));

        $First  = date('Y-m-01', strtotime(Input::get('idate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $nontaxable->first_day_month = $First;

        $nontaxable->last_day_month = $Last;

	    }else{
	    $nontaxable->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $nontaxable->nontaxable_amount = $a;

        $d=strtotime(Input::get('idate'));

        $nontaxable->nontaxable_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('idate')));
        $Last   = date('Y-m-t', strtotime(Input::get('idate')));
        

        $nontaxable->first_day_month = $First;

        $nontaxable->last_day_month = $Last;

	    }

        
		$nontaxable->save();
		$nontax = Nontaxable::find($nontaxable->nontaxable_id);

		Audit::logaudit('Employeenontaxables', 'create', 'assigned amount '.$nontaxable->nontaxable_amount.' to '.Employee::getEmployeeName(Input::get('employee')).' for non taxable income'.$nontax->name);

		return Redirect::route('employeenontaxables.index')->withFlashMessage('Employee non taxable income successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$nontaxable = Employeenontaxable::findOrFail($id);

		return view('employeenontaxables.show', compact('nontaxable'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$nontax = Employeenontaxable::find($id);
		$employees = Employee::where('organization_id',Auth::user()->organization_id)->get();
                $nontaxables = Nontaxable::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
                $currency = Currency::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->first();

        if ( !Entrust::can('update_nontaxable') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{        
		return view('employeenontaxables.edit', compact('nontax','employees','nontaxables','currency'));
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
		$nontaxable = Employeenontaxable::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Employeenontaxable::$rules, Employeenontaxable::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$nontaxable->nontaxable_id = Input::get('income');

		$nontaxable->formular = Input::get('formular');

		if(Input::get('formular') == 'Instalments'){
		$nontaxable->instalments = Input::get('instalments');
        $insts = Input::get('instalments');

		$a = str_replace( ',', '', Input::get('amount') );
        $nontaxable->nontaxable_amount = $a;

        $d=strtotime(Input::get('idate'));

        $nontaxable->nontaxable_date = date("Y-m-d", $d);

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime(Input::get('idate'))));

        $First  = date('Y-m-01', strtotime(Input::get('idate')));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $nontaxable->first_day_month = $First;

        $nontaxable->last_day_month = $Last;

	    }else{
	    $nontaxable->instalments = '1';
        $a = str_replace( ',', '', Input::get('amount') );
        $nontaxable->nontaxable_amount = $a;

        $d=strtotime(Input::get('idate'));

        $nontaxable->nontaxable_date = date("Y-m-d", $d);

        $First  = date('Y-m-01', strtotime(Input::get('idate')));
        $Last   = date('Y-m-t', strtotime(Input::get('idate')));
        

        $nontaxable->first_day_month = $First;

        $nontaxable->last_day_month = $Last;

	    }

		$nontaxable->update();
		$nontax = Nontaxable::find($nontaxable->nontaxable_id);

		Audit::logaudit('employeenontaxables', 'update', 'updated non taxable income '.$nontax->name.' for '.Employee::getEmployeeName($nontaxable->employee_id));

		return Redirect::route('employeenontaxables.index')->withFlashMessage('Employee non taxable income successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$nontaxable = Employeenontaxable::findOrFail($id);
		$nontax = Nontaxable::find($nontaxable->nontaxable_id);

		if ( !Entrust::can('delete_nontaxable') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $tnt  = DB::table('transact_nontaxables')->where('employee_nontaxable_id',$id)->count();
		if($tnt>0){
			return Redirect::route('employeenontaxables.index')->withDeleteMessage('Cannot delete this non taxable income because its assigned to a payroll transaction(s)!');
		}else{ 
		Employeenontaxable::destroy($id);

		Audit::logaudit('Employeenontaxables', 'delete', 'deleted non taxable income '.$nontax->name.' for '.Employee::getEmployeeName($nontaxable->employee_id));

		return Redirect::route('employeenontaxables.index')->withDeleteMessage('Employee non taxable income successfully deleted!');
	}
    }
	}

	public function view($id){

		$nontaxable = DB::table('employee')
		          ->join('employeenontaxables', 'employee.id', '=', 'employeenontaxables.employee_id')
		          ->join('nontaxables', 'employeenontaxables.nontaxable_id', '=', 'nontaxables.id')
		          ->where('employeenontaxables.id','=',$id)
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('employeenontaxables.id','first_name','last_name','middle_name','formular','instalments','nontaxable_amount','name','nontaxable_date','last_day_month','photo','signature','nontaxable_id','employee_id')
		          ->first();
        
        if ( !Entrust::can('view_nontaxable') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$organization = Organization::find(Auth::user()->organization_id);
        Audit::logaudit('Employeenontaxables', 'view', 'viewed non taxable income '.$nontaxable->name.' for '.Employee::getEmployeeName($nontaxable->employee_id));
		return view('employeenontaxables.view', compact('nontaxable'));
	}
		
	}

}
