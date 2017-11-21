@extends('layouts.app')
@section('content')
<?php use App\Http\Controllers\UserController;?>

     <!-- <div class="row wrapper border-bottom white-bg page-heading">
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
      </div> -->


      <div class="row">
      <div class="col-lg-12">
       <h3>Pension</h3>

       <hr>
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

                        <h5>Pension Contributions</h5>                      

                        <div class="ibox-tools">
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
                    <table class="table table-striped table-bordered table-hover statement_tbl" >
                    <thead>
                      <tr>           
                        <th>#</th>
                        <th>Year</th>
                        <th>Month</th>
                        <th>Employee Contribution (Ksh)</th>
                        <th>Employee Percentage</th>
                        <th>Employer Contribution (Ksh)</th>
                        <th>Employer Percentage</th>
                        <th>Interest (Ksh)</th>
                        <th>Total Contribution (Ksh)</th>                       
                        <th>Comments</th>
                      </tr>
                    </thead>
                    <tbody>
                    <?php $year="year"; $i=0;$x=1;?>


                    <?php $employee=0;$employer=0;$interest=0; $total=0;?>

                    @foreach ($deductions as $key => $deduction)

                        <?php 
                          $employee+=$deduction->employee_amount;
                          $employer+=$deduction->employer_amount;
                          $interest+=App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year);
                          $total+=$deduction->employee_amount+$deduction->employer_amount+App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year);
                          
                          
                        ?>


                     <?php if($year!=$deduction->year){$i=0;$year=$deduction->year;} 
                           if($i==0)$display_year=$deduction->year;else $display_year="";

                        ?>
                      <tr>                      
                          <td>{{ $i+1}}</td>
                          <td>{{ $deduction->year}}</td>
                          <td>{{ $deduction->month }}</td>
                          <td> {{ number_format(floatval($deduction->employee_amount),2) }}</td>
                          <td>{{ number_format(floatval($deduction->employee_percentage),2) }}</td>
                          <td> {{ number_format(floatval( $deduction->employer_amount),2)  }}</td>
                          <td>{{ number_format(floatval($deduction->employee_percentage),2) }}</td>

                          <td> {{ number_format(floatval( App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year)),2)  }}</td>
                          <td> {{ number_format(floatval( $deduction->employee_amount+$deduction->employer_amount+App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year)),2)  }}</td>                         
                          <td>{{ App\Pensioninterest::getTransactComment($deduction->employee_id,$deduction->financial_month_year) }}</td>                         

                        </tr>
                        <?php $i++; ?>

                             
                        @endforeach
                    
                    </tbody>
                     <tfoot>
                      <tr>
                       
                        <th colspan="3">Totals</th>
                        <th colspan="2"> Ksh {{ number_format($employee,2)}}</th>
                        <th colspan="2">Ksh {{ number_format($employer,2)}}</th>
                        <th width="120px">Ksh {{ number_format($interest,2)}}</th>
                        <th colspan="2">Ksh {{ number_format($total,2)}}</th> 
                        
                      </tr>
                    </tfoot>
                    </table>
                        </div>                      

                    </div>
                </div>
            </div>
            </div>
        </div>
        

@endsection
