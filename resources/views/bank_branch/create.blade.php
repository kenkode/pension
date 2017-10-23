@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
	<div class="col-lg-12">
  <h3>New Bank Branch</h3>

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

		 <form method="POST" action="{{{ URL::to('bank_branch') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Bank Branch Code <span style="color:red">*</span> </label>
            <input class="form-control" placeholder="" type="text" name="code" id="code" value="{{{ Input::old('code') }}}">
        </div>

        <div class="form-group">
            <label for="username">Bank Branch Name <span style="color:red">*</span> </label>
            <input class="form-control" placeholder="" type="text" name="name" id="name" value="{{{ Input::old('name') }}}">
        </div>

         <div class="form-group">
                        <label>Bank</label>
                        <select name="bank_id" id="bank_id" class="form-control select2">
                            <option></option>
                            @foreach($banks as $bank)
                            <option value="{{ $bank->id }}"> {{ $bank->bank_name }}</option>
                            @endforeach

                        </select>
                
                    </div>
        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Bank Branch</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop