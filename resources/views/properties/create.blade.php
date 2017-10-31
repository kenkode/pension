@extends('layouts.app')

{{Html::script('media/jquery-1.8.0.min.js') }}

<script type="text/javascript">
$(document).ready(function(){
console.log($("#issuedby").val());

 $("#active").change(function() {
  if(this.checked) {
   
    $("#receivedby").val($("#issuedby").val());

  }
  else{
    $("#receivedby").val('');
  }
 });
});

</script>

<?php
use Illuminate\Support\Facades\Input;
?>


@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>New Property</h3>

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

		 <form method="POST" action="{{{ URL::to('Properties') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>


       @if(Session::has('eid') && Session::get('page') == "employee")
       <div class="form-group">
            <label for="username">Employee</label>
            <input class="form-control" readonly placeholder="" type="text" name="ename" id="ename" value="{{Session::get('ename')}}">
        </div>
       <input class="form-control" placeholder="" type="hidden" name="employee_id" id="employee" value="{{Session::get('eid')}}">
       @else
       <div class="form-group">
                        <label for="username">Employee <span style="color:red">*</span></label>
                        <select name="employee_id" class="form-control select2">
                           <option></option>
                            @foreach($employees as $employee)
                            <option value="{{ $employee->id }}"> {{ $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name }}</option>
                            @endforeach
                        </select>
                
                    </div>   
       @endif
       <input class="form-control" placeholder="" type="hidden" name="page" id="page" value="{{Session::get('page')}}">
                          
        <div class="form-group">
            <label for="username">Property Name<span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="name" id="name" value="{{{ Input::old('name') }}}">
        </div>

        <div class="form-group">
            <label for="username">Description</label>
            <textarea class="form-control" name="desc" id="desc">{{{ Input::old('desc') }}}</textarea>
        </div>
        
        <div class="form-group">
            <label for="username">Serial Number</label>
            <input class="form-control" placeholder="" type="text" name="serial" id="serial" value="{{{ Input::old('serial') }}}">
        </div>

        <div class="form-group">
            <label for="username">Digital Serial Number</label>
            <input class="form-control" placeholder="" type="text" name="dserial" id="dserial" value="{{{ Input::old('dserial') }}}">
        </div>

         <div class="form-group">
            <label for="username">Amount <span style="color:red">*</span></label>
            <div class="input-group">
            <span class="input-group-addon">{{$currency->shortname}}</span>
            <input class="form-control" placeholder="" type="text" name="amount" id="amount" value="{{{ Input::old('amount') }}}">
            </div>
            <script type="text/javascript">
                       $(document).ready(function() {
                       $('#amount').priceFormat();
                       });
                       </script>
        </div>
        
        <div class="form-group">
            <label for="username">Issued By </label>
            <input class="form-control" readonly placeholder="" type="text" name="issuedby" id="issuedby" value="{{Auth::user()->name}}">
        </div>

        <div class="form-group">
            <label for="username">Issue Date <span style="color:red">*</span></label>
             <div class="right-inner-addon ">
            <i class="glyphicon glyphicon-calendar"></i>
            <input class="form-control expiry" readonly placeholder="" type="text" name="idate" id="idate" value="{{date('Y-m-d')}}">
        </div>
        </div>

        <div class="form-group">
            <label for="username">Scheduled Return Date <span style="color:red">*</span></label>
            <div class="right-inner-addon ">
            <i class="glyphicon glyphicon-calendar"></i>
            <input class="form-control expiry" readonly placeholder="" type="text" name="sdate" id="sdate" value="{{date('Y-m-d')}}">
            </div>
        </div>

        <div class="checkbox">
                        <label>
                            <input type="checkbox" name="active" id="active">
                               Returned
                        </label>
                    </div>

        <div class="form-group">
            <label for="username">Received By </label>
            <input class="form-control" readonly placeholder="" type="text" name="receivedby" id="receivedby" >
        </div>

        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Property</button>
        </div>
<br><br><br>
    </fieldset>
</form>
		

  </div>

</div>

@stop