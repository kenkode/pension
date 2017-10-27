<?php

namespace App\Http\Controllers;

use App\Document;
use Illuminate\Http\Request;
use Auth;
use App\Audit;
use App\Employee;
use Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;

class DocumentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $data['documents']=Document::select('*')
              ->where("owner_id","=",Auth::user()->id)
              ->get();
        return view('documents.index',$data);
    }    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('documents.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /*$path= Controller::showUploadFile($request);

        Document::create(array('document_name'=>$request->name,'owner_id'=>Auth::user()->id,'year'=>$request->year,'path'=>$path));  */  

        $document= new Document;
        $file = Input::file('path');
        
        $document->employee_id = Input::get('employee_id');

            $name = time().'-'.$file->getClientOriginalName();
            $file = $file->move('uploads/employees/documents/', $name);
            $input['file'] = '/uploads/employees/documents/'.$name;
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $document->document_path = $name;
            $document->document_name = Input::get('type').'.'.$extension;
        

        $document->description = Input::get('desc');

        /*$document->from_date = Input::get('fdate')[$j];

        $document->expiry_date = Input::get('edate')[$j];*/

        $document->save();

       Audit::logaudit('Documents', 'create', 'created document '.Input::get('type').' for '.Employee::getEmployeeName(Input::get('employee_id')));

        
        return Redirect::to('employees/view/'.$document->employee_id)->withFlashMessage('Employee`s document successfully created!');
    }

    /**
     * Display the specified resource.
     *
     * @pa3ee4ram  \App\Documents  $documents
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $document = Document::findOrFail($id);

        return view('documents.show', compact('document'));
    }

    /**
     * Show the form for editing the specified branch.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $document = Document::find($id);

        return view('documents.edit', compact('document'));
    }

    /**
     * Update the specified branch in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id)
    {
        $document = Document::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Document::rolesUpdate(), Document::$messsages);

        if ($validator->fails())
        {
            return Redirect::back()->withErrors($validator)->withInput();
        }
        
        if ( Input::hasFile('path')) {

            $file = Input::file('path');
            $name = time().'-'.$file->getClientOriginalName();
            $file = $file->move('uploads/employees/documents/', $name);
            $input['file'] = '/uploads/employees/documents/'.$name;
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $document->document_path = $name;
            $document->document_name = Input::get('type').'.'.$extension;
        }else{
            $name = Input::get('curpath');
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $document->document_path = $name;
            $document->document_name = Input::get('type').'.'.$extension;

        }

        $document->description = Input::get('desc');

        $document->update();

        Audit::logaudit('Documents', 'update', 'updated document '.$document->document_name.' for '.Employee::getEmployeeName($document->employee_id));

        return Redirect::to('employees/view/'.$document->employee_id)->withFlashMessage('Employee Document successfully updated!');
    }

    /**
     * Remove the specified branch from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $document = Document::findOrFail($id);
        $file= public_path(). "/uploads/employees/documents/".$document->document_path;
        
        Document::destroy($id);
        
        unlink($file);

        Audit::logaudit('Documents', 'delete', 'deleted document '.$document->document_name.' for '.Employee::getEmployeeName($document->employee_id));

        return Redirect::to('employees/view/'.$document->employee_id)->withDeleteMessage('Employee Document successfully deleted!');
    }

    public function getDownload($id){
        //PDF file is stored under project/public/download/info.pdf
        $document = Document::findOrFail($id);
        $file= public_path(). "/uploads/employees/documents/".$document->document_path;
        
        return Response::download($file, $document->document_name);
}

   
}
