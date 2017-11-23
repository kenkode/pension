@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Banks Branches</h3>

<hr>
</div>	
</div>

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

<div class="row">
	<div class="col-lg-12">

    <div class="panel panel-default">
      <div class="panel-heading">
          <a class="btn btn-info btn-sm" href="{{ URL::to('bank_branch/create')}}">new bank branch</a>
        </div>
        <div class="panel-body">


    <table id="users" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Bank Branch Code</th>
        <th>Bank Branch Name</th>
        <th>Action</th>

      </thead>
      <tbody>

        <?php $i = 1; ?>
        @foreach($bbranches as $bbranch)

        <tr>

          <td> {{ $i }}</td>
          <td>{{ $bbranch->branch_code }}</td>
          <td>{{ $bbranch->bank_branch_name }}</td>
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('bank_branch/edit/'.$bbranch->id)}}">Update</a></li>
                   
                    <li><a href="{{URL::to('bank_branch/delete/'.$bbranch->id)}}" onclick="return (confirm('Are you sure you want to delete this bank branch?'))">Delete</a></li>
                    
                  </ul>
              </div>

                    </td>



        </tr>

        <?php $i++; ?>
        @endforeach


      </tbody>


    </table>
  </div>


  </div>

</div>

@stop