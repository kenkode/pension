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
                            <strong>View</strong>
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

                        <h5>{{$user->name}}</h5>       
             

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



                     
                        <div class="table-responsive">
                   
                          <div class="col-md-6">
                        <ul class="list-group clear-list m-t">
                            <li class="list-group-item fist-item">
                                <span class="pull-right">
                                   {{ $user->payroll_no }}
                                </span>
                                <strong>Payroll No.</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    {{ $user->email }}
                                </span>
                                <strong>Email</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    {{ $user->gender }}
                                </span>
                                <strong>Gender</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    {{ $user->dob}}
                                </span>
                              <strong>Age</strong>
                            </li>
                             <li class="list-group-item">
                                <span class="pull-right">
                                   {{ $user->national_id }}
                                </span>
                              <strong>ID No</strong>
                            </li>
                             <li class="list-group-item">
                                <spa{{ $user->dl_no }}
                                </span>
                              <strong>DL No</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                   {{ $user->date_joined }}
                                </span>
                                <strong>Date Joined</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    {{ $user->role }}
                                </span>
                                <strong>Role</strong>
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    {{ $user->salary}}
                                </span>
                                <strong>Gross Salary</strong>
                            </li>
                           
                        </ul>
                    </div>


                     


                    <div class="col-md-6">
                        <ul class="list-group clear-list m-t">
                          <li class="list-group-item fist-item">
                                
                                <strong>Documents</strong>
                            </li>
                            {{ UserController::get_documents($user->id) }}
                            
                           
                        </ul>
                    </div>




                        </div>                      

                    </div>
                </div>
            </div>
            </div>
        </div>
        

@endsection
