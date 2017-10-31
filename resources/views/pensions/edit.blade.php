@extends('layouts.app')
@section('content')

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

  {!! Form::model($deduction, ['method' => 'PATCH','route' => ['deductions.update', $deduction->id]]) !!}

  <input type="hidden" name="id"  value="{{$deduction->id}}" />
<div class="row">

  <div class="col-xs-4 col-sm-4 col-md-4">
    <div class="form-group">
           <strong>Name:</strong>
      <input name="name" value="{{$deduction->name}}" class="form-control" disabled />
   </div>
  </div>

 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Payroll No:</strong>
    <input  type="text" name="payroll_no" value="{{$deduction->payroll_no}}" class="form-control" disabled="" />
   </div>
 </div>
<input type="hidden" name="payroll_no" value="{{$deduction->payroll_no}}" class="form-control"/>
<input type="hidden" name="entered_by" value="{{AUTH::user()->id}}" class="form-control"/>

<div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Employee Deduction:</strong>
    <input name="employee_contribution" id="employee_contribution"  value="{{$deduction->employee_contribution}}"  class="form-control"/>
   </div>
 </div>
 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Employer Contribution:</strong>
    <input name="employer_contribution" id="employer_contribution" value="{{$deduction->employee_contribution}}"class="form-control"/>
   </div>
 </div>

 <div class="col-xs-2 col-sm-2 col-md-2">
     <div class="form-group">
       <input type="checkbox" name="populate" onclick="cummulative()">&nbspAdd Interest
   
   </div>
 </div>
 <script>
  function cummulative() {
     var employee=parseFloat($('#employee_contribution').val());
     var employer=parseFloat($('#employer_contribution').val());
     var total=employee+employer;
     var interest=(3/100)*total;
     $('#interest').val(interest);
     var cummulative=total+interest;
     $('#cummulative_deduction').val(cummulative);
  }

 </script>

 <div class="col-xs-2 col-sm-2 col-md-2">
     <div class="form-group">
       <strong>Interest:</strong>
    <input name="interest" id="interest" value="{{$deduction->interest}}" class="form-control"/>
   </div>
 </div>
 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Total Contribution:</strong>
    <input name="monthly_deduction" id="cummulative_deduction" value="{{$deduction->monthly_deduction}}" class="form-control"/>
   </div>
 </div>

 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Entry Month</strong>
        
      <input name="month"  value="{{$deduction->month}}" " class="monthly form-control"/>
   </div>
 </div>

 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Year (e.g 2017)</strong>
    <input name="year" value="{{$deduction->year}}" class=" yearly form-control"/>
   </div>
 </div>
  
  <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Comments:</strong>
    <textarea name="comments" class="form-control">{{$deduction->comments}}</textarea> 
       </div>
 </div>



<div class="col-xs-12 col-sm-12 col-md-12 text-center">
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


