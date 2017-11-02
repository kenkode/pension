<?php

namespace App\Http\Controllers;

use App\Deductions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Employee;

class StatementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employeeid = Employee::where("personal_file_number",Auth::user()->name)->pluck("id")[0];
        $data['deductions'] = DB::table("transact_pensions")->select('*')
               ->where('employee_id', '=',$employeeid)
               ->orderby('year','DESC') 
               ->orderby('id','DESC') 
               ->get();

   
    return view('mystatement.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function show(Deductions $deductions)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function edit(Deductions $deductions)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Deductions $deductions)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Deductions  $deductions
     * @return \Illuminate\Http\Response
     */
    public function destroy(Deductions $deductions)
    {
        //
    }
}
