@extends('layouts.app')
@section('content')

<?php
use App\Leaveapplication;
?>

<div class="row">
											
											
											
        		@if (Session::get('notice'))
            <div class="alert alert-info alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>{{ Session::get('notice') }}</div>
        @endif		

        @if (Session::has('flash_message'))

      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      {{ Session::get('delete_message') }}
     </div>
    @endif		

	<div class="col-lg-12">
	<br>

    <div class="panel panel-default">
      <div class="panel-heading">
          <a class="btn btn-info btn-sm" href="{{ URL::to('leaveapplications/create')}}">new application</a>
        </div>
        <div class="panel-body">

	<table id="mobile" class="table table-condensed table-bordered table-responsive">

  <thead>
    
    <th>Employee #</th>
    <th>Employee</th>
    <th>Leave Type</th>
    <th>Application Date</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>Leave Days</th>
    <th>Balance Days</th>
    <th></th>


  </thead>

  <tbody>

   

        @foreach($leaveapplications as $leaveapplication)
        @if($leaveapplication->status == 'applied')
         <tr>

          <td>{{$leaveapplication->employee->personal_file_number}}</td>
          <td>{{$leaveapplication->employee->first_name." ".$leaveapplication->employee->last_name." ".$leaveapplication->employee->middle_name}}</td>
          <td>{{$leaveapplication->leavetype->name}}</td>
          <td>{{$leaveapplication->application_date}}</td>
           <td>{{$leaveapplication->applied_start_date}}</td>
            <td>{{$leaveapplication->applied_end_date}}</td>
            <td>{{Leaveapplication::getLeaveDays($leaveapplication->applied_end_date,$leaveapplication->applied_start_date)}}</td>

<td>{{Leaveapplication::getBalanceDays($leaveapplication->employee, $leaveapplication->leavetype)}}</td>
          
          <td>
            @if($leaveapplication->is_supervisor_approved == 1)
           <a href="{{URL::to('leaveapplications/edit/'.$leaveapplication->id)}}">Amend</a> 
           @if(Leaveapplication::getBalanceDays($leaveapplication->employee, $leaveapplication->leavetype) >= Leaveapplication::getLeaveDays($leaveapplication->applied_end_date,$leaveapplication->applied_start_date))
           &nbsp; |
          <a href="{{URL::to('leaveapplications/approve/'.$leaveapplication->id)}}">Approve</a> &nbsp;
          @endif
          |&nbsp;<a href="{{URL::to('leaveapplications/reject/'.$leaveapplication->id)}}" onclick="return (confirm('Are you sure you want to reject this vacation?'))">Reject</a> &nbsp;|
          <a href="{{URL::to('leaveapplications/cancel/'.$leaveapplication->id)}}" onclick="return (confirm('Are you sure you want to cancel this vacation?'))">Cancel</a>
          @elseif($leaveapplication->is_supervisor_approved == 2)
          Rejected by supervisor | <a href="{{URL::to('leaveapplications/cancel/'.$leaveapplication->id)}}" onclick="return (confirm('Are you sure you want to cancel this vacation?'))">Cancel</a>
          @elseif($leaveapplication->is_supervisor_approved == 0)
          Awaiting Supervisor Approval
          @endif
          </td>
           </tr>
           @endif
        @endforeach
      

   
    

  </tbody>

        
  </table>
           
      
        </div>
		<hr>

	</div>
</div>

@stop