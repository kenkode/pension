@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>


<div class="row">
	<div class="col-lg-12">
  <h3>New Employee Document</h3>

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

		 <form method="POST" action="{{{ URL::to('documents') }}}" accept-charset="UTF-8" enctype="multipart/form-data">
   {{ csrf_field() }}
    <fieldset>

      <div class="form-group">
            <label for="username">Employee</label>
            <input class="form-control" readonly placeholder="" type="text" name="ename" id="ename" value="{{Session::get('ename')}}">
        </div>
       <input class="form-control" placeholder="" type="hidden" name="employee_id" id="employee" value="{{Session::get('eid')}}">

       <div class="form-group">
                        <label for="username">Document</label><span style="color:red">*</span><br>
                        <input class="img" placeholder="" type="file" name="path" id="path" value="{{{ Input::old('path') }}}" required="">
                    </div>

        <div class="form-group">
            <label for="username">Document Name <span style="color:red">*</span> </label><br>
            <input class="form-control" placeholder="" type="text" name="type" id="type" value="{{{ Input::old('type') }}}" required="">
        </div>

        <div class="form-group">
            <label for="username">Description </label><br>
            <textarea name="desc" class="form-control" id="desc">{{{ Input::old('desc') }}}</textarea>
        </div>

        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Upload Document</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop