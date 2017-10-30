@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Select Deduction</h3>

<hr>
</div>	
</div>

<?php
use Illuminate\Support\Facades\Input;
?>

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

		 <form target="_blank" method="POST" action="{{URL::to('payrollReports/deductions')}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

        <div class="form-group">
                        <label for="username">Period <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input required class="form-control datepicker2" readonly="readonly" placeholder="" type="text" name="period" id="period" value="{{{ Input::old('period') }}}">
                    </div>
       </div>

            <div class="form-group">
                        <label for="username">Select: <span style="color:red">*</span></label>
                        <select required name="deduction" class="form-control select2">
                            <option></option>
                            <option value='All'>All</option>
                            @foreach($deds as $ded)
                            <option value="{{$ded->deduction_name}}"> {{ $ded->deduction_name }}</option>
                            @endforeach

                        </select>
                
            </div>

            <!-- <div class="form-group">
                        <label for="username">Select Category <span style="color:red">*</span></label>
                        <select name="type" id="type" class="form-control" required>
                           <option></option>
                           @if(Entrust::can('manager_payroll'))
                           <option value='All'>All</option>
                           <option value="management"> Management </option>
                           @endif
                           <option value="normal"> Normal </option>
                        </select>
                
                    </div> -->

            <input type="hidden" name="type" value="normal">
                    
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