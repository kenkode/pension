<?php

namespace App\Http\Controllers;

use App\Scheme;
use Illuminate\Http\Request;
use App\Category;
use Auth;

class SchemeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
       $data['documents'] = Scheme::all();

       return view('schemes.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
         $data['categories']= Category::all();
         return view('schemes.create',$data);
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

        if($file = $request->file('thefile'))$ext=$file->getClientOriginalExtension();else $ext="";

        $document = new Scheme;
        $insert=$document->create(array('document_name'=>$request->name,
                                  'year'=>$request->year,
                                  'quarter'=>$request->quarter,
                                  'path'=>$path,
                                  'type'=>$ext,
                                  'uploaded_by'=>Auth::user()->id));  

     return redirect('schemes');  

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Scheme  $scheme
     * @return \Illuminate\Http\Response
     */
    public function show(Scheme $scheme)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Scheme  $scheme
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
         $data['documents'] = Scheme::select('*')
               ->where('category','=',$id)  
               ->get();

            //return $data['documents'];
    return view('schemes.index',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Scheme  $scheme
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Scheme $scheme)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Scheme  $scheme
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $doc=Scheme::find($id);
        $doc->delete();

        return redirect(action('SchemeController@auischeme_documents', ['cat' => $doc->category]));
    }

    public function auischeme_documents(Request $request){


       $data['documents'] = Scheme::select('*')
               ->where('category','=',$request->cat)  
               ->get();

    return view('schemes.index',$data);

    }
}
