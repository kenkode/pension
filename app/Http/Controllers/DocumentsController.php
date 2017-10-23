<?php

namespace App\Http\Controllers;

use App\Document;
use Illuminate\Http\Request;
use Auth;

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
        $path= Controller::showUploadFile($request);

        Document::create(array('document_name'=>$request->name,'owner_id'=>Auth::user()->id,'year'=>$request->year,'path'=>$path));    

        
        return redirect('documents');
    }

    /**
     * Display the specified resource.
     *
     * @pa3ee4ram  \App\Documents  $documents
     * @return \Illuminate\Http\Response
     */
    public function show(Documents $document)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Documents  $documents
     * @return \Illuminate\Http\Response
     */
    public function edit(Documents $document)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Documents  $documents
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Documents $document)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Documents  $documents
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Document::find($id)->delete();

        return redirect('documents');
    }

   
}
