<?php

namespace App\Http\Controllers;

use App\JGroup;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class JobGroupController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$jgroups = JGroup::all();

		if ( !Entrust::can('view_job_group') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Job Group', 'view', 'viewed job groups');

		return view('job_group.index', compact('jgroups'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_job_group') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('job_group.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), JGroup::$rules,JGroup::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$jgroup = new JGroup;

		$jgroup->job_group_name = Input::get('name');

        $jgroup->organization_id = '1';

		$jgroup->save();

        Audit::logaudit('Job Group', 'create', 'created job group '.Input::get('name'));
		return Redirect::route('job_group.index')->withFlashMessage('Job Group successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$jgroup = JGroup::findOrFail($id);

		return view('job_group.show', compact('jgroup'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$jgroup = JGroup::find($id);

		if ( !Entrust::can('update_job_group') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('job_group.edit', compact('jgroup'));
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
		$jgroup = JGroup::findOrFail($id);

		$validator = Validator::make($data = Input::all(), JGroup::$rules,JGroup::$messages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$jgroup->job_group_name = Input::get('name');
		$jgroup->update();

		Audit::logaudit('Job Group', 'update', 'updated job group '.Input::get('name'));

		return Redirect::route('job_group.index')->withFlashMessage('Job Group successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$jgroup = JGroup::findOrFail($id);

		if ( !Entrust::can('delete_job_group') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        $jg  = DB::table('employee')->where('job_group_id',$id)->count();
		if($jg>0){
			return Redirect::route('job_group.index')->withDeleteMessage('Cannot delete this job group because its assigned to an employee(s)!');
		}else{
		JGroup::destroy($id);

		Audit::logaudit('Job Group', 'delete', 'deleted job group '.$jgroup->job_group_name);

		return Redirect::route('job_group.index')->withDeleteMessage('Job Group successfully deleted!');
	}
    }
	}

}
