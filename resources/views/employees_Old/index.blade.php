@extends('layouts.app')
@section('content')

<?php
use \App\Http\Controllers\UserController;

?>

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
                            <strong>All</strong>
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

                      @if ($message = Session::get('success'))
                       <div class="alert alert-success">
                         <p>{{ $message }}</p>
                         </div>
                        @endif

                        <h5>Employees</h5>       
             

                        <div class="ibox-tools">

                        <a class="btn btn-primary" href="{{ url('register-employee') }}"> Register Employee</a>


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

                        <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <thead>
                      <tr>
                       
                        <th>Name</th>                        
                        <th>Payroll No</th>
                        <th>Email</th>
                        <th>Gender</th>                        
                        <th>Age</th>
                        <th>Action</th>                        
                       



                        <!--<th width="280px">Action</th>-->
                      </tr>
                    </thead>
                    <tbody>
                    @foreach ($users as $key => $user)
                      <tr>
                         
                          <td>{{ $user->name }}</td>                          
                          <td>{{ $user->payroll_no }}</td>
                          <td>{{ $user->email }}</td>
                          <td>{{ $user->gender }}</td>
                          <td>{{ $user->dob}}</td>  

                          <td><a href="{{url('detailed-employee',$user->id)}}" class="btn btn-primary">View</a></td> 
                          @if(1==2) 
                          <td>
                       
                      {!! Form::open(['method' => 'DELETE','route' => ['users.destroy', $user->id],'style'=>'display:inline']) !!}
                      {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
                      {!! Form::close() !!}
                     
                         </td>
                         @endif
                        </tr>

                        @endforeach
                    
                    </tfoot>
                    </table>
                        </div>                      

                    </div>
                </div>
            </div>
            </div>
        </div>
        

@endsection
