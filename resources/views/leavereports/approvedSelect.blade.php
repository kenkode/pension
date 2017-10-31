@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
    <div class="col-lg-12">
  <h3>Select Period</h3>

<hr>
</div>  
</div>

<style type="text/css">
    .select2 {z-index:10 !important; }
</style>

<div class="row">
    <div class="col-lg-5">

    
        
        @if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

		 <form target="_blank" method="POST" action="{{URL::to('leaveReports/approvedleaves')}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

        <div class="form-group">
                        <label for="username">From <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input required class="form-control datepicker3" readonly="readonly" placeholder="" type="text" name="period" id="period" value="{{{ Input::old('period') }}}">
                    </div>
       </div>

            <div class="form-group">
                        <label for="username">To <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input required class="form-control datepicker3" readonly="readonly" placeholder="" type="text" name="period1" id="period1" value="{{{ Input::old('period1') }}}">
                    </div>
       </div>

       <div class="form-group">
                        <label for="username">Select Branch: <span style="color:red">*</span></label>
                        <select required name="branch" id="branchid" class="form-control select2">
                            <option></option>
                            <option value="All">All</option>
                            @foreach($branches as $branch)
                            <option value="{{$branch->id }}"> {{ $branch->name }}</option>
                            @endforeach

                        </select>
                
        </div>

        <div class="form-group">
                        <label for="username">Select Department: <span style="color:red">*</span></label>
                        <select required name="department" id="departmentid" class="form-control select2">
                            <option></option>
                            <option value="All">All</option>
                            @foreach($departments as $department)
                            <option value="{{$department->id }}"> {{ $department->department_name }}</option>
                            @endforeach

                        </select>
                
        </div>


        <div class="form-group">
                        <label for="username">Download as: <span style="color:red">*</span></label>
                        <select required name="format" class="form-control select2">
                            <option></option>
                            <option value="excel"> Excel</option>
                            <option value="pdf"> PDF</option>
                        </select>
                
            </div>

                        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Select</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>


@stop