@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Members</h3>

<hr>
</div>	
</div>


<div class="row">
	<div class="col-lg-12">

    @if (Session::get('check'))
            <div class="alert alert-info alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>{{ Session::get('check') }}</div>
        @endif

    <div class="panel panel-default">
      <div class="panel-heading">
          <p>Active Members</p>
        </div>
        <div class="panel-body">


  
      <table id="users" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Personal File Number</th>
        <th>Employee</th>
      

        <th></th>
        

      </thead>
      <tbody>

        <?php $i = 1; ?>
        @foreach($employees as $employee)

        <tr>

          <td> {{ $i }}</td>
          <td>{{ $employee->personal_file_number }}</td>
          @if($employee->middle_name == null || $employee->middle_name == '')
          <td>{{ $employee->first_name.' '.$employee->last_name }}</td>
          @else
          <td>{{ $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name }}</td>
          @endif
           <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    @if($employee->is_css_active == false)
                    <li><a href="{{URL::to('portal/activate/'.$employee->id)}}">Activate</a></li>
                   @endif

                    @if($employee->is_css_active == true)

                    <li><a href="{{URL::to('portal/deactivate/'.$employee->id)}}">Deactivate</a></li>

                    @endif

                    <li><a href="{{URL::to('css/reset/'.$employee->id)}}">Reset Password</a></li>
                    
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