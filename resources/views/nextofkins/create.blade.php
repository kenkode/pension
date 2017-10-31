@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
	<div class="col-lg-12">
  <h3>New Kin</h3>

<hr>
</div>	
</div>


<div class="row">
	<div class="col-lg-5">

    
		
		@if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

		 <form method="POST" action="{{{ URL::to('NextOfKins') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

       <div class="form-group">
            <label for="username">Employee</label>
            <input class="form-control" readonly placeholder="" type="text" name="ename" id="ename" value="{{Session::get('ename')}}">
        </div>
       <input class="form-control" placeholder="" type="hidden" name="employee_id" id="employee" value="{{Session::get('eid')}}">

        <div class="form-group">
            <label for="username">First Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="fname" id="fname" value="{{{ Input::old('id_number') }}}">
        </div>

        <div class="form-group">
            <label for="username">Middle Name</label>
            <input class="form-control" placeholder="" type="text" name="mname" id="mname" value="{{{ Input::old('id_number') }}}">
        </div>

        <div class="form-group">
            <label for="username">last Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="lname" id="lname" value="{{{ Input::old('id_number') }}}">
        </div>


        <div class="form-group">
            <label for="username">ID Number</label>
            <input class="form-control" placeholder="" type="text" name="id_number" id="id_number" value="{{{ Input::old('id_number') }}}">
        </div>
        
        <div class="form-group">
            <label for="username">Relationship </label>
            <input class="form-control" placeholder="" type="text" name="rship" id="rship" value="{{{ Input::old('rship') }}}">
        </div>

        <div class="form-group">
            <label for="username">Contact </label>
            <textarea class="form-control" name="contact" id="contact">{{{ Input::old('contact') }}}</textarea>
        </div>
        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Kin</button>
        </div>
       <br><br>
    </fieldset>
</form>
		

  </div>

</div>
























@stop