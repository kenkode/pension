@extends('layouts.app')
@section('content')

<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Employees</h2>
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

                        <div class="ibox-tools">

                        <a class="btn btn-primary" href="{{ url('employees') }}"> Back</a>


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

  {!! Form::open(array('url' => 'reg-employee','method'=>'POST')) !!}
<div class="row">

  <div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Name:</strong>
      {!! Form::text('name', null, array('placeholder' => 'First Name','class' => 'form-control')) !!}
   </div>
  </div>

<div class="col-xs-3 col-sm-3 col-md-3">
     <div class="form-group">
       <strong>Email:</strong>
    {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
   </div>
 </div>
  
<div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Payroll No:</strong>
      {!! Form::text('payroll_no', null, array('placeholder' => 'Payroll No','class' => 'form-control')) !!}
   </div>
  </div>

  <div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Gender:</strong>
       <select id="gender" class="form-control" name="gender">
    <option value="">Select Gender</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    
    </select>
   </div>
  </div>

  <div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Date of Birth:</strong>
      {!! Form::text('dob', null, array('placeholder' => 'Date of birth','class' => 'daily form-control')) !!}
   </div>
  </div>

  <div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Date Joined Organization:</strong>
      {!! Form::text('date_joined', null, array('placeholder' => 'Date Joined Organization','class' => 'daily form-control')) !!}
   </div>
  </div>



<input type="hidden" name="role" value="Employee"/>
<div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Gross Salary:</strong>
      {!! Form::text('salary', null, array('placeholder' => 'Gross Salary','class' => 'form-control')) !!}
   </div>
  </div>


<div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>National ID No:</strong>
      {!! Form::text('national_id', null, array('placeholder' => 'National ID ','class' => 'form-control')) !!}
   </div>
  </div>


<div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
           <strong>Drivers Licence No:</strong>
      {!! Form::text('dl_no', null, array('placeholder' => 'Drivers Licence','class' => 'form-control')) !!}
   </div>
  </div>

    <div class="col-xs-3 col-sm-3 col-md-3">
       <div class="form-group">
   <strong>Marital Status:</strong>
    <select id="marital_status" class="form-control" name="role">
    <option value="">Select status</option>
    <option value="Single">Single</option>
    <option value="Married">Married</option>
    <option value="Divorced">Separeted</option>
    <option value="Divorced">Divorced</option>
    <option value="Divorced">Widowed</option>
    </select>
  </div>
</div>  

  

<div class="col-xs-12 col-sm-12 col-md-12">
   <fieldset class="form-group">
     <legend>Login:</legend>
  <div class="col-xs-3 col-sm-3 col-md-3">
       <div class="form-group">
           <strong>Password:</strong>
    {!! Form::password('password', array('placeholder' => 'Password','class' => 'form-control')) !!}
      </div>
</div>

<div class="col-xs-3 col-sm-3 col-md-3">
   <div class="form-group">
     <strong>Confirm Password:</strong>
    {!! Form::password('password_confirmation', array('placeholder' => 'Confirm Password','class' => 'form-control')) !!}
  </div>
</div>
  </fieldset> 
</div>



<div class="col-xs-12 col-sm-12 col-md-12">
   <fieldset >
     <legend>Next Of Kin:</legend>
    <div class="col-xs-3 col-sm-3 col-md-3 form-group">
    {!! Form::text('kin_name',null, array('placeholder' => 'Names','class' => 'form-control')) !!}
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 form-group">
    {!! Form::text('kin_phone',null, array('placeholder' => 'Phone Number','class' => 'form-control')) !!}
    </div>
     <div class="col-xs-3 col-sm-3 col-md-3 form-group">
    {!! Form::text('kin_address',null, array('placeholder' => 'Address','class' => 'form-control')) !!}
    </div>
   <div class="col-xs-3 col-sm-3 col-md-3 form-group">
    {!! Form::text('kin_relationship',null, array('placeholder' => 'Relationship','class' => 'form-control')) !!}
    </div>
   
  </fieldset> 
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





























