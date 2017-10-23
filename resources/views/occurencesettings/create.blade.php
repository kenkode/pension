@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
	<div class="col-lg-12">
  <h3>New Occurence Type</h3>

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

		 <form method="POST" action="{{{ URL::to('occurencesettings') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Occurence Type<span style="color:red">*</span> </label>
            <input class="form-control" placeholder="" type="text" name="type" id="type" value="{{{ Input::old('type') }}}">
        </div>
        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Occurence Type</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop