@extends('layouts.app')
@section('content')

<?php


function asMoney($value) {
  return number_format($value, 2);
}

?>
<br>
<div class="row">
	<div class="col-lg-12">


<a class="btn btn-info btn-sm "  href="{{ URL::to('overtimes/edit/'.$overtime->id)}}">update details</a>
<a class="btn btn-danger btn-sm "  href="{{URL::to('overtimes/delete/'.$overtime->id)}}" onclick="return (confirm('Are you sure you want to delete this employee`s overtime?'))">Delete</a>
<a class="btn btn-success btn-sm "  href="{{ URL::to('overtimes')}}">Go Back</a>
<hr>
</div>	
</div>


<div class="row">

<div class="col-lg-3">

<img src="{{asset('/uploads/employees/photo/'.$overtime->employee->photo) }}" width="150px" height="130px" alt=""><br>
<br>
<img src="{{asset('/uploads/employees/signature/'.$overtime->employee->signature) }}" width="120px" height="50px" alt="">
</div>

<div class="col-lg-6">

<table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Overtime Information</span></strong></td></tr>
      @if($overtime->employee->middle_name != null || $overtime->employee->middle_name != ' ')
      <tr><td><strong>Employee: </strong></td><td> {{$overtime->employee->last_name.' '.$overtime->employee->first_name.' '.$overtime->employee->middle_name}}</td>
      @else
      <td><strong>Employee: </strong></td><td> {{$overtime->employee->last_name.' '.$overtime->employee->first_name}}</td>
      @endif
      </tr>
      <tr><td><strong>Period Worked: </strong></td><td>{{$overtime->period}}</td></tr>

      <tr><td><strong>Formular: </strong></td><td>{{$overtime->formular}}</td></tr>
      @if($overtime->instalments > 1)
      <tr><td><strong>Instalments: </strong></td><td>{{$overtime->instalments}}</td></tr>
      <tr><td><strong>Amount: </strong></td><td align="right">{{asMoney($overtime->amount)}}</td></tr>
      <tr><td><strong>Total Amount: </strong></td><td align="right">{{asMoney((double)$overtime->amount*(double)$overtime->instalments*(double)$overtime->period)}}</td></tr>
      @else
      <tr><td><strong>Amount: </strong></td><td align="right">{{asMoney($overtime->amount)}}</td></tr>
      <tr><td><strong>Total Amount: </strong></td><td align="right">{{asMoney((double)$overtime->amount*(double)$overtime->period)}}</td></tr>
      @endif
      @if($overtime->formular == 'One Time' || $overtime->formular == 'Instalments')
      <tr><td><strong>Start Date: </strong></td><td>{{$overtime->overtime_date}}</td></tr>
      <tr><td><strong>End Date: </strong></td><td>{{$overtime->last_day_month}}</td></tr>
      @else
      <tr><td><strong>Start Date: </strong></td><td>{{$overtime->overtime_date}}</td></tr>
      @endif
</table>
</div>

</div>


@stop