@extends('layouts.app')
@section('content')
<?php use App\Http\Controllers\UserController;?>

     <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Deductions</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Deductions</a>
                        </li>
                        <li class="active">
                            <strong>summary</strong>
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
                         <p>{{ $import_msg }}</p>
                         </div>
                        @endif

                        <h5>Deductions summary</h5>                      

                        <div class="ibox-tools">
                           

                            <a class="btn btn-primary" href="{{ url('/deduction-users') }}">Enter a deduction</a>
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
                    <table class="table table-striped table-bordered table-hover deductions_tbl" >
                    <thead>
                      <tr>
                       
                        <th>Name</th>
                        <th>Employee Contribution</th>
                        <th>Employee Percentage</th>
                        <th>Employer Contribution</th>
                        <th>Employer Percentage</th>
                        <th>Interest</th>
                        <th>Total Contribution</th>
                        <th>Comments</th>
                        <th width="280px">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $employee=0;$employer=0;$interest=0; $total=0;?>

                    @foreach ($deductions as $key => $deduction)

                      <tr>
                          <td>{{ UserController::payroll_name($deduction->payroll_no)}}</td>
                          <td>{{ $deduction->payroll_no }}</td>
                          <td> Ksh {{ number_format(floatval($deduction->employee_contribution),2) }}</td>
                          <td>{{ number_format(floatval($deduction->employee_percentage),2) }}</td>
                          <td> Ksh {{ number_format(floatval( $deduction->employer_contribution),2)  }}</td>
                          <td>{{ number_format(floatval($deduction->employee_percentage),2) }}</td>
                          <td> Ksh {{ number_format(floatval( $deduction->interest),2)  }}</td>
                          <td> Ksh {{ number_format(floatval( $deduction->monthly_deduction),2)  }}</td>
                          <td>{{ $deduction->comments }}</td>
                          <td>
                        
                          <a class="btn btn-primary" href="{{ route('deductions.edit',$deduction->id) }}">Edit</a>

                         {!! Form::open(['method' => 'DELETE','route' => ['deductions.destroy', $deduction->id],'style'=>'display:inline']) !!}
                         {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
                          {!! Form::close() !!}
                         </td>

                        </tr>

                        @endforeach
                    
                    </tbody>
                    
                    </table>
                        </div>                      

                    </div>
                </div>
            </div>
            </div>
        </div>
        

@endsection
