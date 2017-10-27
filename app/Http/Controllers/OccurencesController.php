<?php

namespace App\Http\Controllers;

use App\Occurence;
use App\Occurencesetting;
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
use Response;
use Session;

class OccurencesController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$occurences = DB::table('employee')
		          ->join('occurences', 'employee.id', '=', 'occurences.employee_id')
		          ->where('in_employment','=','Y')
		          ->where('employee.organization_id',Auth::user()->organization_id)
		          ->get();

		if ( !Entrust::can('view_occurrence') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Occurrences', 'view', 'viewed occurrences');

		return view('occurences.index', compact('occurences'));
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
		          ->where('organization_id',Auth::user()->organization_id)
		          ->get();
		$occurences = Occurencesetting::all();
		if ( !Entrust::can('create_occurrence') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('occurences.create',compact('employees','occurences'));
	}
	}

	public function createoccurence()
	{
      $postocc = Input::all();
      $data = array('occurence_type' => $postocc['name'], 
      	            'organization_id' => Auth::user()->organization_id,
      	            'created_at' => DB::raw('NOW()'),
      	            'updated_at' => DB::raw('NOW()'));
      $check = DB::table('occurencesettings')->insertGetId( $data );
     // $id = DB::table('earningsettings')->insertGetId( $data );

		if($check > 0){
         
		Audit::logaudit('Occurencesettings', 'create', 'created occurence '.$postocc['name']);
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
		$validator = Validator::make($data = Input::all(), Occurence::$rules, Occurence::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$occurence = new Occurence;

		$occurence->occurence_brief = Input::get('brief');

		$occurence->employee_id = Input::get('employee');

		$occurence->occurencesetting_id = Input::get('type');

		$occurence->narrative = Input::get('narrative');

		$occurence->occurence_date = Input::get('date');

		if ( Input::hasFile('path')) {

            $file = Input::file('path');
            $name = $file->getClientOriginalName();
            $file = $file->move('public/uploads/employees/documents/', $name);
            $input['file'] = '/public/uploads/employees/documents/'.$name;
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $occurence->doc_path = $name;
        }

        $occurence->organization_id = Auth::user()->organization_id;

		$occurence->save();

		Audit::logaudit('Occurences', 'create', 'created occurence '.$occurence->occurence_brief.' for '.Employee::getEmployeeName(Input::get('employee')));

        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$occurence->employee_id)->withFlashMessage('Occurence successfully created!');
        }else{
		return Redirect::to('occurences/view/'.$occurence->id)->withFlashMessage('Occurence successfully created!');
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
		$occurence = Occurence::findOrFail($id);

		return view('occurences.show', compact('occurence'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$occurence = Occurence::find($id);

		$occurencesettings = Occurencesetting::all();

		$employees = Employee::all();

		if ( !Entrust::can('update_occurrence') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('occurences.edit', compact('occurence','employees','occurencesettings'));
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
		$occurence = Occurence::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Occurence::$rules, Occurence::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$occurence->occurence_brief = Input::get('brief');

		$occurence->occurencesetting_id = Input::get('type');

		$occurence->narrative = Input::get('narrative');

		$occurence->occurence_date = Input::get('date');

		if ( Input::hasFile('path')) {

            $file = Input::file('path');
            $name = $file->getClientOriginalName();
            $file = $file->move('public/uploads/employees/documents/', $name);
            $input['file'] = '/public/uploads/employees/documents/'.$name;
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $occurence->doc_path = $name;
        }

		$occurence->update();

		Audit::logaudit('Occurences', 'update', 'updated occurence '.$occurence->occurence_brief.' for '.Employee::getEmployeeName(Input::get('employee')));

        if(Input::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$occurence->employee_id)->withFlashMessage('Occurence successfully updated!');
        }else{
		return Redirect::to('occurences/view/'.$id)->withFlashMessage('Occurence successfully updated!');
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
		$occurence = Occurence::findOrFail($id);
		if ( !Entrust::can('delete_occurrence') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		Occurence::destroy($id);

		Audit::logaudit('Occurences', 'delete', 'deleted occurence '.$occurence->occurence_brief.' for '.Employee::getEmployeeName($occurence->employee_id));

        if(Session::get('page') == 'employee'){
        return Redirect::to('employees/view/'.$occurence->employee_id)->withDeleteMessage('Occurence successfully deleted!');
        }else{
		return Redirect::to('occurences')->withDeleteMessage('Occurence successfully deleted!');
	}
    }
	}

    public function view($id){

		$occurence = Occurence::find($id);

		$organization = Organization::find(Auth::user()->organization_id);
        if ( !Entrust::can('view_occurrence') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('occurences.view', compact('occurence'));
	}
		
	}

	public function getDownload($id){
        //PDF file is stored under project/public/download/info.pdf
        $occurence = Occurence::findOrFail($id);
        $file= public_path(). "/uploads/employees/documents/".$occurence->doc_path;
        
        return Response::download($file, $occurence->doc_path);
}

}
