@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Update Relief</h3>

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

		 <form method="POST" action="{{{ URL::to('reliefs/update/'.$relief->id) }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Relief Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="name" id="name" value="{{ $relief->relief_name}}">
        </div>

        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Update Relief</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop