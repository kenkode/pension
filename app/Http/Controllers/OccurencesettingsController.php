<?php

namespace App\Http\Controllers;

use App\Occurencesetting;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;


class OccurencesettingsController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$occurences = Occurencesetting::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();

       if ( !Entrust::can('view_occurrence_setting') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        
		Audit::logaudit('Occurencesettings', 'view', 'viewed occurrence settings');


		return view('occurencesettings.index', compact('occurences'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_occurrence_setting') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('occurencesettings.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Occurencesetting::$rules, Occurencesetting::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$occurence = new Occurencesetting;

		$occurence->occurence_type = Input::get('type');

                $occurence->organization_id = Auth::user()->organization_id;

		$occurence->save();

		Audit::logaudit('Occurencesettings', 'create', 'created occurrence setting '.$occurence->occurence_type);


		return Redirect::route('occurencesettings.index')->withFlashMessage('Occurrence type successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$occurence = Occurencesetting::findOrFail($id);

		return view('Occurencesettings.show', compact('occurence'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$occurence = Occurencesetting::find($id);

        if ( !Entrust::can('update_occurrence_setting') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('occurencesettings.edit', compact('occurence'));
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
		$occurence = Occurencesetting::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Occurencesetting::$rules, Occurencesetting::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$occurence->occurence_type = Input::get('type');
		$occurence->update();

		Audit::logaudit('Occurencesettings', 'update', 'updated occurrence setting '.$occurence->occurence_type);

		return Redirect::route('occurencesettings.index')->withFlashMessage('Occurrence type successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$occurence = Occurencesetting::findOrFail($id);
		if ( !Entrust::can('view_occurrence_setting') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		$occ = DB::table('occurences')->where('occurencesetting_id',$id)->count();
		if($occ>0){
			return Redirect::route('occurencesettings.index')->withDeleteMessage('Cannot delete this occurrence type because its assigned to an employee occurence(s)!');
		}else{
		Occurencesetting::destroy($id);

		Audit::logaudit('Occurencesettings', 'delete', 'deleted occurrence setting '.$occurence->occurence_type);

		return Redirect::route('occurencesettings.index')->withDeleteMessage('Occurrence type successfully deleted!');
	}
}
}

}
