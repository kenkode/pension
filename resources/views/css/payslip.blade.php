@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Select Period</h3>

<hr>
</div>	
</div>

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
	<div class="col-lg-5">

    
		
		@if (Session::has('errors'))
        <div class="alert alert-danger">
              {{ Session::get('errors') }}
        </div>
        @endif

		 <form target="blank" method="POST" action="{{URL::to('payrollReports/payslip')}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

        <div class="form-group">
                        <label for="username">Period <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input required class="form-control datepicker2" readonly="readonly" placeholder="" type="text" name="period" id="period" value="{{{ Input::old('period') }}}">
                    </div>
       </div>
        
        <input type="hidden" name="employeeid" value="{{$employee->id}}">
           
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">view Payslip</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>


@stop