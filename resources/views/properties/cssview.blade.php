@extends('layouts.app')
@section('content')

<?php


function asMoney($value) {
  return number_format($value, 2);
}
use App\Employee

?>
<div class="row">
	<div class="col-lg-12">

  @if (Session::has('flash_message'))

      <div class="alert alert-success">
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger">
      {{ Session::get('delete_message') }}
     </div>
    @endif

<br><br>

<a class="btn btn-success btn-sm "  href="{{ URL::to('employee/viewdetails/'.$property->employee_id)}}">Go Back</a>

<hr>
</div>	
</div>


<div class="row">

<div class="col-lg-2">

<img src="{{asset('/uploads/employees/photo/'.$property->employee->photo) }}" width="150px" height="130px" alt=""><br>
<br>
<img src="{{asset('/uploads/employees/signature/'.$property->employee->signature) }}" width="120px" height="50px" alt="">
</div>

<div class="col-lg-6">

<table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Property Information</span></strong></td></tr>
      @if($property->employee->middle_name != null || $property->employee->middle_name != ' ')
      <tr><td><strong>Employee: </strong></td><td> {{$property->employee->last_name.' '.$property->employee->first_name.' '.$property->employee->middle_name}}</td>
      @else
      <td><strong>Employee: </strong></td><td> {{$property->employee->last_name.' '.$property->employee->first_name}}</td>
      @endif
      </tr>
      <tr><td><strong>Property Name: </strong></td><td>{{$property->name}}</td></tr>
      <tr><td><strong>Description: </strong></td><td>{{$property->description}}</td></tr>
      <tr><td><strong>Serial: </strong></td><td>{{$property->serial}}</td></tr>
      <tr><td><strong>Digital Serial: </strong></td><td>{{$property->digitalserial}}</td></tr>
      <tr><td><strong>Value: </strong></td><td align="right">{{asMoney($property->monetary)}}</td></tr>
      <tr><td><strong>Issued By: </strong></td><td>{{$user->name}}</td></tr>
      <?php
       $d=strtotime($property->issue_date);
       $d1=strtotime($property->scheduled_return_date);
       $d2=strtotime($property->return_date);
       ?>
      <tr><td><strong>Issued Date: </strong></td><td>{{ date("F j, Y", $d)}}</td></tr>
      <tr><td><strong>Scheduled Return Date: </strong></td><td>{{ date("F j, Y", $d1)}}</td></tr>
      @if($property->state == 1)
      <tr><td><strong>Returned: </strong></td><td>Yes</td>
      <tr><td><strong>Returned On: </strong></td><td>{{ date("F j, Y", $d2)}}</td></tr>
      <tr><td><strong>Received By: </strong></td><td>{{$retuser->name}}</td></tr>
      @else
      <td><strong>Returned: </strong></td><td>No</td>
      <tr><td><strong>Returned On: </strong></td><td></td></tr>
      <tr><td><strong>Received By: </strong></td><td></td></tr>
      @endif
      
</table>
</div>

</div>

<br><br>

@stop