@extends('layouts.app')
@section('content')

<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Payroll</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Salaries</a>
                        </li>
                        <li class="active">
                            <strong>Edit</strong>
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
                        <h5>Edit User</h5>                       

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

  {!! Form::model($user, ['method' => 'PATCH','route' => ['payroll.update', $user->id]]) !!}

  <div class="row">

    <div class="col-xs-4 col-sm-4 col-md-4">

            <div class="form-group">
                <strong>Name:</strong>
          {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control','disabled')) !!}
        
            </div>

        </div>

      <div class="col-xs-4 col-sm-4 col-md-4">

            <div class="form-group">

                <strong>Email:</strong>

                {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control','disabled')) !!}

            </div>

        </div>

         <div class="col-xs-4 col-sm-4 col-md-4">
       <div class="form-group">
   <strong>Role:</strong>
    <select id="role" class="form-control" name="role" disabled>
    <option value="{{$user->role}}">{{$user->role}}</option>
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

                {!! Form::text('payroll_no', null, array('placeholder' => 'Payroll No','class' => 'form-control','disabled')) !!}

            </div>

        </div>


    <div class="col-xs-4 col-sm-4 col-md-4">

            <div class="form-group">

                <strong>Salary:</strong>

                {!! Form::text('salary', null, array('placeholder' => 'Salary','class' => 'form-control')) !!}

            </div>

        </div>

       
        <div class="col-xs-4 col-sm-6 col-md-4 text-center">
        <input type="hidden" name="id" value="{{$user->id}}" />
        <button type="submit" class="btn btn-primary">Submit</button>

        </div>

  </div>

  {!! Form::close() !!}
  </div><!-- Main row -->

                                   

                    </div>
                    
                </div>
            </div>
            
  </div>


@endsection


