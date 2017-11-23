@extends('layouts.membercss')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Member</h3>

<hr>
</div>	
</div>


<div class="row">
	<div class="col-lg-12">

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

    <div class="panel panel-default">
      <div class="panel-heading">
          <a class="btn btn-info btn-sm" href="{{ URL::to('member/edit/'.$member->id)}}">update details</a>
        </div>
        <div class="panel-body">


  
      <table id="users" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>
        <th>Member Number</th>
        <th>Member Name</th>
        <th>Member Branch</th>

        <th></th>
        

      </thead>
      <tbody>

        <tr>
          <td>{{ $member->membership_no }}</td>
          <td>{{ $member->name }}</td>
          <td>{{ $member->branch->name }}</td>
          <td>
             <a href="{{ URL::to('member/show/'.$member->id) }}" class="btn btn-info btn-sm">Manage</a>

                    </td>



        </tr>


      </tbody>


    </table>
  </div>


  </div>

</div>
























@stop