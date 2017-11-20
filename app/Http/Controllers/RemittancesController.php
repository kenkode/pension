<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Remittance;
use Redirect;
use App\Pensioninterest;
use App\Http\Controllers\Controller;
use App\Audit;
use App\Employee;
use App\Pension;
use App\Remittedemployee;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class RemittancesController extends Controller
{
    /**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function remitpension()
	{
		$remittances = Remittance::where('type','pension')->get();
		$employees = Employee::where('in_employment','Y')->count();

	   if ( !Entrust::can('remit_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
       Audit::logaudit('Remittance', 'view', 'viewed pension remittances');


		return view('remittances.pension', compact('remittances','employees'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function createpension()
	{
		if ( !Entrust::can('remit_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.createpension',compact('employees'));
	}
	}

	public function finalizepension($id)
	{
		if ( !Entrust::can('remit_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $remittance = Remittance::find($id);
        $period = $remittance->period;
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.finalizepension',compact('employees','id','period'));
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function storepension()
	{
		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->count();
		$per = Remittance::where('period',Input::get('period'))->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}if($per > 0){
        return Redirect::back()->withDeleteMessage('That pension is already remitted');
		}else{

		$today = date('Y-m-d');
		$remittancedate = date('Y-m-03');

		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'pension';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'pension';
        $remittedemployee->save();

        if($today > $remittancedate){
          $pension = Pension::where('employee_id',Input::get('employee')[$i])->first();
          $pensioninterest = new Pensioninterest;
          $pensioninterest->employee_id = Input::get('employee')[$i];
          $pensioninterest->interest = $pension->employee_contribution * 0.03;
          $pensioninterest->comment = "Interest accrued for period ".Input::get('period');
          $pensioninterest->period = Input::get('period');
          $pensioninterest->save();
        }
        }

		Audit::logaudit('Remittance', 'create', 'created pension remittance for period '.$remittance->period);


		return Redirect::to('remitpension')->withFlashMessage('Pension successfully remitted!');
	}
	}

	public function finalizeupdate($id)
	{

		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}else{
		$today = date('Y-m-d');
		$remittancedate = date('Y-m-03');

		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'pension';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'pension';
        $remittedemployee->save();

        if($today > $remittancedate){
          $pension = Pension::where('employee_id',Input::get('employee')[$i])->first();
          $pensioninterest = new Pensioninterest;
          $pensioninterest->employee_id = Input::get('employee')[$i];
          $pensioninterest->interest = $pension->employee_contribution * 0.03;
          $pensioninterest->comment = "Interest accrued for period ".Input::get('period');
          $pensioninterest->period = Input::get('period');
          $pensioninterest->save();
        }
        }

		Audit::logaudit('Remittance', 'create', 'created pension remittance for period '.$remittance->period);


		return Redirect::to('remitpension')->withFlashMessage('Pension successfully remitted!');
	}
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function employees($id)
	{
		if ( !Entrust::can('remit_pension') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$remittedemployees = Remittedemployee::where('remittance_id',$id)->get();
		$remittance = Remittance::find($id);
		$emps = Employee::where('in_employment','Y')->count();
		$period = $remittance->period;
        Audit::logaudit('Remittance', 'view', 'viewed remitted employees for period '.$remittance->period);
		return view('remittances.remittedemployees', compact('remittedemployees','id','emps','period'));
	}
	}



	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$allowance = Allowance::find($id);
        if ( !Entrust::can('update_allowance_type') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('allowances.edit', compact('allowance'));
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
		$allowance = Allowance::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Allowance::$rules, Allowance::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$allowance->allowance_name = Input::get('name');
		$allowance->update();

		Audit::logaudit('Allowances', 'update', 'updated allowance type '.$allowance->allowance_name);

		return Redirect::route('allowances.index')->withFlashMessage('Allowance successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$allowance = Allowance::findOrFail($id);

		if ( !Entrust::can('delete_allowance_type') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $alw  = DB::table('employee_allowances')->where('allowance_id',$id)->count();
        $talw  = DB::table('transact_allowances')->where('allowance_id',$id)->count();
		if($alw>0){
			return Redirect::route('allowances.index')->withDeleteMessage('Cannot delete this allowance because its assigned to an employee(s)!');
		}else if($talw>0){
			return Redirect::route('allowances.index')->withDeleteMessage('Cannot delete this allowance because its assigned to a payroll transaction(s)!');
		}else{
		Allowance::destroy($id);

		Audit::logaudit('Allowances', 'delete', 'deleted allowance type '.$allowance->allowance_name);

		return Redirect::route('allowances.index')->withFlashMessage('Allowance successfully deleted!');
	}
	}
}
}
