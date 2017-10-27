<?php

namespace App\Http\Controllers;

use App\Appraisalcategory;
use App\Http\Controllers\Controller;
use App\Audit;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

class AppraisalCategoryController extends Controller {

	/**
	 * Display a listing of branches
	 *
	 * @return Response
	 */
	public function index()
	{
		$categories = Appraisalcategory::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();

        if ( !Entrust::can('view_appraisal_category') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		Audit::logaudit('Appraisalcategories', 'view', 'viewed appraisal categories');


		return view('appraisalcategories.index', compact('categories'));
	}
	}

	/**
	 * Show the form for creating a new branch
	 *
	 * @return Response
	 */
	public function create()
	{
		if ( !Entrust::can('create_appraisal_category') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
		return view('appraisalcategories.create');
	}
	}

	/**
	 * Store a newly created branch in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Appraisalcategory::$rules, Appraisalcategory::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$category = new Appraisalcategory;

		$category->name = Input::get('name');

        $category->organization_id = Auth::user()->organization_id;

		$category->save();

		Audit::logaudit('Appraisalcategories', 'create', 'created appraisal category '.$category->name);


		return Redirect::route('appraisalcategories.index')->withFlashMessage('Appraisal category successfully created!');
	}

	/**
	 * Display the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$category = Appraisalcategory::findOrFail($id);

		return view('appraisalcategories.show', compact('category'));
	}

	/**
	 * Show the form for editing the specified branch.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$category = Appraisalcategory::find($id);

		if ( !Entrust::can('update_appraisal_category') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		return view('appraisalcategories.edit', compact('category'));
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
		$category = Appraisalcategory::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Appraisalcategory::$rules, Appraisalcategory::$messsages);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$category->name = Input::get('name');
		$category->update();

		Audit::logaudit('Appraisalcategories', 'update', 'updated appraisal category '.$category->name);

		return Redirect::route('appraisalcategories.index')->withFlashMessage('Appraisal category successfully updated!');
	}

	/**
	 * Remove the specified branch from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$category = Appraisalcategory::findOrFail($id);

		if ( !Entrust::can('delete_appraisal_category') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

		$app  = DB::table('appraisalquestions')->where('appraisalcategory_id',$id)->count();
		if($app>0){
			return Redirect::route('appraisalcategories.index')->withDeleteMessage('Cannot delete this appraisal category because its assigned to appraisal question(s)!');
		}else{
		Appraisalcategory::destroy($id);

		Audit::logaudit('Appraisalcategories', 'delete', 'deleted appraisal category '.$category->name);

		return Redirect::route('appraisalcategories.index')->withDeleteMessage('Appraisal category successfully deleted!');
	}
 }
 }

}
