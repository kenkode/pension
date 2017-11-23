@extends('layouts.app')

<script type="text/javascript">
function YNconfirm() { 
var per = document.getElementById("period").value;
 if (window.confirm('Do you wish to process payroll for '+per+'?'))
 {
   window.location.href = "{{ URL::to('payroll/accounts')}}";
 }
}
</script>

@section('content')

<style>
    .select2 {z-index:10 !important; }
</style>

<div class="row">
    <div class="col-lg-12">
  <h3>Period</h3>

<hr>
</div>  
</div>

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">
    <div class="col-lg-5">
      @if (Session::has('errors'))

      <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      {{ Session::get('errors') }}
     </div>
    @endif

         <form method="POST" action="{{ URL::to('email/payslip/employees')}}" accept-charset="UTF-8">
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
                        <label for="username">Select Employee <span style="color:red">*</span></label>
                        <select required="" name="employeeid" class="form-control select2">
                           <option></option>
                            @foreach($employees as $employee)
                            <option value="{{ $employee->id }}"> {{ $employee->personal_file_number.' '.$employee->first_name.' '.$employee->last_name }}</option>
                            @endforeach
                        </select>
                
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" checked name="sel">
                              Select All
                        </label>
                    </div>

        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm" >Select</button>
        </div>

    </fieldset>
</form>
        

  </div>

</div>

@stop