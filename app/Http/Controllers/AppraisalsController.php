<?php

namespace App\Http\Controllers;

use App\Appraisal;
use App\Appraisalquestion;
use App\Appraisalcategory;
use App\Employee;
use App\User;
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
use Session;

class AppraisalsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$employees = Appraisal::where('organization_id',Auth::user()->organization_id)->get();

		$appraisals = DB::table('employee')
		          ->join('appraisals', 'employee.id', '=', 'appraisals.employee_id')
		          ->join('appraisalquestions', 'appraisals.appraisalquestion_id', '=', 'appraisalquestions.id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->select('appraisals.id','appraisalquestion_id','first_name','middle_name','last_name','question','performance','appraisals.rate')
		          ->get();

		if ( !Entrust::can('view_appraisal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		Audit::logaudit('Appraisals', 'view', 'viewed appraisals');

		return view('appraisals.index', compact('appraisals'));
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
		$appraisals = Appraisalquestion::where('organization_id',Auth::user()->organization_id)->get();
		$categories = Appraisalcategory::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();

		if ( !Entrust::can('create_appraisal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('appraisals.create',compact('employees','appraisals','categories'));
	}
	}

	public function createapp($id)
	{
		$appraisals = Appraisalquestion::where('organization_id',Auth::user()->organization_id)->get();
		$categories = Appraisalcategory::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
		return view('appraisals.createApp',compact('id','appraisals','categories'));
	}

	public function createquestion()
	{
      $postapp = Input::all();
      $data = array('appraisalcategory_id' => $postapp['category'], 
      	            'rate' => $postapp['rate'], 
      	            'question' => $postapp['question'],
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('appraisalquestions')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Appraisalquestions', 'create', 'created appraisal question '.$postapp['question']);
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
		$validator = Validator::make($data = Input::all(), Appraisal::$rules,Appraisal::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$appraisal = new Appraisal;

		$appraisal->employee_id = Input::get('employee_id');

		$appraisal->appraisalquestion_id = Input::get('appraisal_id');

                $appraisal->performance = Input::get('performance');

                $appraisal->rate = Input::get('score');

                $appraisal->examiner = Auth::user()->id;

                $appraisal->appraisaldate = Input::get('date');

                $appraisal->comment = Input::get('comment');
                
                $appraisal->organization_id = Auth::user()->organization_id;

		$appraisal->save();

		Audit::logaudit('Employee Appraisal', 'create', 'created appraisal '.$appraisal->question.' for '.Employee::getEmployeeName(Input::get('employee_id')));

        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$appraisal->employee_id)->withFlashMessage('Employee Appraisal successfully created!');
        }else{
		return Redirect::to('Appraisals/view/'.$appraisal->id)->withFlashMessage('Employee Appraisal successfully created!');
	    }
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$appraisal = Appraisal::findOrFail($id);

		return view('appraisals.show', compact('appraisal'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$appraisal = Appraisal::find($id);
		$appraisalqs = Appraisalquestion::where('organization_id',Auth::user()->organization_id)->get();
		$user = User::find($appraisal->examiner);
                $categories = Appraisalcategory::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
        if ( !Entrust::can('update_appraisal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('appraisals.edit', compact('appraisal','appraisalqs','user','categories'));
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
		$appraisal = Appraisal::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Appraisal::$rules,Appraisal::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$appraisal->appraisalquestion_id = Input::get('appraisal_id');

        $appraisal->performance = Input::get('performance');

        $appraisal->rate = Input::get('score');

        $appraisal->appraisaldate = Input::get('date');

        $appraisal->comment = Input::get('comment');
        
        $appraisal->organization_id= Auth::user()->organization_id;

		$appraisal->update();

		Audit::logaudit('Appraisal Question', 'update', 'updated appraisal '.$appraisal->question.' for '.Employee::getEmployeeName($appraisal->employee_id));

        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$appraisal->employee_id)->withFlashMessage('Employee Appraisal successfully updated!');
        }else{
		return Redirect::to('Appraisals/view/'.$id)->withFlashMessage('Employee Appraisal successfully updated!');
	    }
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$appraisal = Appraisal::findOrFail($id);

		if ( !Entrust::can('delete_appraisal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		
		Appraisal::destroy($id);

		Audit::logaudit('Employee Appraisal', 'delete', 'deleted appraisal '.$appraisal->question.' for '.Employee::getEmployeeName($appraisal->employee_id));
        
        if(Session::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$appraisal->employee_id)->withDeleteMessage('Employee Appraisal successfully deleted!');
        }else{
		return Redirect::to('Appraisals')->withDeleteMessage('Employee Appraisal successfully deleted!');
	}
    }
	}

	public function view($id){

		$appraisal = Appraisal::find($id);

		$user = User::find($appraisal->examiner);

		$organization = Organization::find(Auth::user()->organization_id);

		if ( !Entrust::can('view_appraisal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('appraisals.view', compact('appraisal','user'));
	}
		
	}

}
