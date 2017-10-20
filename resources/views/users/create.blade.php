@extends('layouts.app')
@section('content')

<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Users</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Users</a>
                        </li>
                        <li class="active">
                            <strong>Create</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

          </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Create New User</h5>                       

                        <div class="ibox-tools">

                        <a class="btn btn-primary" href="{{ route('users.index') }}"> Back</a>


                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">Config option 1</a>
                                </li>
                                <li><a href="#">Config option 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">


                    @if (count($errors) > 0)
     <div class="alert alert-danger">
        <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
      @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
      @endforeach
  </ul>
    </div>
@endif

  {!! Form::open(array('route' => 'users.store','method'=>'POST')) !!}
<div class="row">

  <div class="col-xs-4 col-sm-4 col-md-4">
    <div class="form-group">
           <strong>Name:</strong>
      {!! Form::text('name', null, array('placeholder' => 'First Name','class' => 'form-control')) !!}
   </div>
  </div>

<div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Email:</strong>
    {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
   </div>
 </div>
  

    <div class="col-xs-4 col-sm-4 col-md-4">
       <div class="form-group">
   <strong>Role:</strong>
    <select id="role" class="form-control" name="role" required>
    <option value="">Select Role</option>
    <option value="Admin">Admin</option>
    <option value="Finance">Finance</option>
    <option value="Human Resource">Human Resource</option>
    <option value="Employee">Employee</option>
    </select>
  </div>
</div>

 <div class="col-xs-4 col-sm-4 col-md-4">
    <div class="form-group">
           <strong>Payroll No:</strong>
      {!! Form::text('payroll_no', null, array('placeholder' => 'Payroll No','class' => 'form-control')) !!}
   </div>
  </div>



  

  <div class="col-xs-4 col-sm-4 col-md-4">
       <div class="form-group">
           <strong>Password:</strong>
    {!! Form::password('password', array('placeholder' => 'Password','class' => 'form-control')) !!}
      </div>
</div>

<div class="col-xs-4 col-sm-4 col-md-4">
   <div class="form-group">
     <strong>Confirm Password:</strong>
    {!! Form::password('password_confirmation', array('placeholder' => 'Confirm Password','class' => 'form-control')) !!}
  </div>
</div>






<div class="col-xs-12 col-sm-12 col-md-12 text-center">
    <button type="submit" class="btn btn-primary">Submit</button>
</div>


</div>




                                   

                    </div>
                    
                </div>
            </div>
            </div>
  </div>


  {!! Form::close() !!}

@endsection





























