<?php

namespace App\Http\Controllers;

use App\Education;
use App\Audit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Redirect;
use Entrust;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;

class EducationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $educations = Education::all();
        Audit::logaudit('Education', 'view', 'viewed educations');

        return view('education.index', compact('educations'));
    }

    /**
     * Show the form for creating a new branch
     *
     * @return Response
     */
    public function create()
    {
        return view('education.create');
    }

    /**
     * Store a newly created branch in storage.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Education::$rules,Education::$messages);

        if ($validator->fails())
        {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $education = new Education;

        $education->education_name = Input::get('name');

        $education->organization_id = '1';

        $education->save();

        Audit::logaudit('Education', 'create', 'created education '.Input::get("name"));

        return Redirect::route('education.index')->withFlashMessage('Education successfully created!');
    }

    /**
     * Display the specified branch.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $education = Education::findOrFail($id);

        return view('education.show', compact('education'));
    }

    /**
     * Show the form for editing the specified branch.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $education = Education::find($id);

        return view('education.edit', compact('education'));
    }

    /**
     * Update the specified branch in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id)
    {
        $education = Education::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Education::$rules,Education::$messages);

        if ($validator->fails())
        {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $education->education_name = Input::get('name');
        $education->update();

        Audit::logaudit('Education', 'update', 'updated education '.Input::get("name"));

        return Redirect::route('education.index')->withFlashMessage('Education successfully updated!');
    }

    /**
     * Remove the specified branch from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $education = Education::findOrFail($id);
        Education::destroy($id);

        Audit::logaudit('Education', 'delete', 'deleted education '.$education->education_name);

        return Redirect::route('education.index')->withDeleteMessage('Education successfully deleted!');
    }

}
