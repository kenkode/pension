@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Update Deduction</h3>

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

		 <form method="POST" action="{{{ URL::to('deductions/update/'.$deduction->id) }}}" accept-charset="UTF-8">
    {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Deduction Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="name" id="name" value="{{ $deduction->deduction_name}}">
        </div>

        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Update Deduction</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop