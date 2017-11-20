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
		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','pension')->count();
		$per = Remittance::where('period',Input::get('period'))->where('type','pension')->count();

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
        }else{
          $pension = Pension::where('employee_id',Input::get('employee')[$i])->first();
          $pensioninterest = new Pensioninterest;
          $pensioninterest->employee_id = Input::get('employee')[$i];
          $pensioninterest->interest = 0.00;
          $pensioninterest->comment = "";
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

		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','pension')->count();

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
        }else{
          $pension = Pension::where('employee_id',Input::get('employee')[$i])->first();
          $pensioninterest = new Pensioninterest;
          $pensioninterest->employee_id = Input::get('employee')[$i];
          $pensioninterest->interest = 0.00;
          $pensioninterest->comment = "";
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
        Audit::logaudit('Remittance', 'view', 'viewed pension remitted employees for period '.$remittance->period);
		return view('remittances.remittedemployees', compact('remittedemployees','id','emps','period'));
	}
	}



	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function remitpaye()
	{
		$remittances = Remittance::where('type','paye')->get();
		$employees = Employee::where('in_employment','Y')->count();

	   if ( !Entrust::can('remit_paye') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
       Audit::logaudit('Remittance', 'view', 'viewed paye remittances');


		return view('remittances.paye', compact('remittances','employees'));
	}
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function createpaye()
	{
		if ( !Entrust::can('remit_paye') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.createpaye',compact('employees'));
	}
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function storepaye()
	{
		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','paye')->count();
		$per = Remittance::where('period',Input::get('period'))->where('type','paye')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}if($per > 0){
        return Redirect::back()->withDeleteMessage('That pension is already remitted');
		}else{

		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'paye';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'paye';
        $remittedemployee->save();

        }

		Audit::logaudit('Remittance', 'create', 'created paye remittance for period '.$remittance->period);


		return Redirect::to('remitpaye')->withFlashMessage('Paye successfully remitted!');
	}
	}

	public function paye($id)
	{
		if ( !Entrust::can('remit_paye') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$remittedemployees = Remittedemployee::where('remittance_id',$id)->get();
		$remittance = Remittance::find($id);
		$emps = Employee::where('in_employment','Y')->count();
		$period = $remittance->period;
        Audit::logaudit('Remittance', 'view', 'viewed paye remitted employees for period '.$remittance->period);
		return view('remittances.payeemployees', compact('remittedemployees','id','emps','period'));
	}
	}

	public function finalizepaye($id)
	{
		if ( !Entrust::can('remit_paye') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $remittance = Remittance::find($id);
        $period = $remittance->period;
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.finalizepaye',compact('employees','id','period'));
	}
	}

	public function finalizepayeupdate($id)
	{

		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','paye')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}else{
		
		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'paye';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'paye';
        $remittedemployee->save();

        
        }

		Audit::logaudit('Remittance', 'create', 'created paye remittance for period '.$remittance->period);


		return Redirect::to('remitpaye')->withFlashMessage('Paye successfully remitted!');
	}
	}

	public function remitnhif()
	{
		$remittances = Remittance::where('type','nhif')->get();
		$employees = Employee::where('in_employment','Y')->count();

	   if ( !Entrust::can('remit_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
       Audit::logaudit('Remittance', 'view', 'viewed nhif remittances');


		return view('remittances.nhif', compact('remittances','employees'));
	}
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function createnhif()
	{
		if ( !Entrust::can('remit_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.createnhif',compact('employees'));
	}
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function storenhif()
	{
		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','nhif')->count();
		$per = Remittance::where('period',Input::get('period'))->where('type','nhif')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}if($per > 0){
        return Redirect::back()->withDeleteMessage('That pension is already remitted');
		}else{

		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'nhif';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'nhif';
        $remittedemployee->save();

        }

		Audit::logaudit('Remittance', 'create', 'created nhif remittance for period '.$remittance->period);


		return Redirect::to('remitnhif')->withFlashMessage('NHIF successfully remitted!');
	}
	}

	public function nhif($id)
	{
		if ( !Entrust::can('remit_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$remittedemployees = Remittedemployee::where('remittance_id',$id)->get();
		$remittance = Remittance::find($id);
		$emps = Employee::where('in_employment','Y')->count();
		$period = $remittance->period;
        Audit::logaudit('Remittance', 'view', 'viewed NHIF remitted employees for period '.$remittance->period);
		return view('remittances.nhifemployees', compact('remittedemployees','id','emps','period'));
	}
	}

	public function finalizenhif($id)
	{
		if ( !Entrust::can('remit_nhif') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $remittance = Remittance::find($id);
        $period = $remittance->period;
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.finalizenhif',compact('employees','id','period'));
	}
	}

	public function finalizenhifupdate($id)
	{

		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','nhif')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}else{
		
		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'nhif';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'nhif';
        $remittedemployee->save();

        
        }

		Audit::logaudit('Remittance', 'create', 'created nhif remittance for period '.$remittance->period);


		return Redirect::to('remitnhif')->withFlashMessage('NHIF successfully remitted!');
	}
	}

	public function remitnssf()
	{
		$remittances = Remittance::where('type','nssf')->get();
		$employees = Employee::where('in_employment','Y')->count();

	   if ( !Entrust::can('remit_nssf') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
       Audit::logaudit('Remittance', 'view', 'viewed nssf remittances');


		return view('remittances.nssf', compact('remittances','employees'));
	}
	}

	/**
	 * Update the specified branch in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function createnssf()
	{
		if ( !Entrust::can('remit_nssf') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.createnssf',compact('employees'));
	}
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function storenssf()
	{
		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','nssf')->count();
		$per = Remittance::where('period',Input::get('period'))->where('type','nssf')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}if($per > 0){
        return Redirect::back()->withDeleteMessage('That pension is already remitted');
		}else{

		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'nssf';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'nssf';
        $remittedemployee->save();

        }

		Audit::logaudit('Remittance', 'create', 'created nssf remittance for period '.$remittance->period);


		return Redirect::to('remitnssf')->withFlashMessage('NSSF successfully remitted!');
	}
	}

	public function nssf($id)
	{
		if ( !Entrust::can('remit_nssf') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$remittedemployees = Remittedemployee::where('remittance_id',$id)->get();
		$remittance = Remittance::find($id);
		$emps = Employee::where('in_employment','Y')->count();
		$period = $remittance->period;
        Audit::logaudit('Remittance', 'view', 'viewed NSSF remitted employees for period '.$remittance->period);
		return view('remittances.nssfemployees', compact('remittedemployees','id','emps','period'));
	}
	}

	public function finalizenssf($id)
	{
		if ( !Entrust::can('remit_nssf') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $remittance = Remittance::find($id);
        $period = $remittance->period;
        $employees = Employee::where('in_employment','Y')->get();
		return view('remittances.finalizenssf',compact('employees','id','period'));
	}
	}

	public function finalizenssfupdate($id)
	{

		$transno = Remittance::where('transaction_number',Input::get('transaction_no'))->where('type','nssf')->count();

		if($transno > 0){
        return Redirect::back()->withDeleteMessage('That transaction number already exists');
		}else{
		
		$remittance = new Remittance;

		$remittance->mode = Input::get('mode');

        $remittance->transaction_number = Input::get('transaction_no');

        $remittance->period = Input::get('period');

        $remittance->type = 'nssf';

		$remittance->save();

        
        for($i=0;$i<count(Input::get('employee'));$i++){
        $remittedemployee = new Remittedemployee;
        $remittedemployee->employee_id=Input::get('employee')[$i];
        $remittedemployee->remittance_id = $remittance->id;
        $remittedemployee->type = 'nssf';
        $remittedemployee->save();

        
        }

		Audit::logaudit('Remittance', 'create', 'created NSSF remittance for period '.$remittance->period);


		return Redirect::to('remitnssf')->withFlashMessage('NSSF successfully remitted!');
	}
	}
}
