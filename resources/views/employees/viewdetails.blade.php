@extends('layouts.app')
@section('content')

<?php


function asMoney($value) {
  return number_format($value, 2);
}
  Session::put( 'eid', $employee->id);
  Session::put( 'page', 'employee');
  Session::put( 'ename', $employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name);

?>

<?php
use App\Department;
use App\Branch;
use App\Appraisalquestion;
use Illuminate\Support\Facades\Input;
?>

<br><br>
<div class="row">
	<div class="col-lg-12">

    <div class="modal fade" id="newkin" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">New Kin</h4>
      </div>
      <div class="modal-body">

@if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

     <form method="POST" action="{{{ URL::to('NextOfKins') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

        <input class="form-control" placeholder="" type="hidden" readonly name="employee_id" id="employee_id" value="{{ $id }}">

        <div class="form-group">
            <label for="username">First Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="fname" id="fname" value="{{{ Input::old('id_number') }}}" required="">
        </div>

        <div class="form-group">
            <label for="username">Middle Name</label>
            <input class="form-control" placeholder="" type="text" name="mname" id="mname" value="{{{ Input::old('id_number') }}}" >
        </div>

        <div class="form-group">
            <label for="username">last Name <span style="color:red">*</span></label>
            <input class="form-control" placeholder="" type="text" name="lname" id="lname" value="{{{ Input::old('id_number') }}}" required="">
        </div>


        <div class="form-group">
            <label for="username">ID Number</label>
            <input class="form-control" placeholder="" type="text" name="id_number" id="id_number" value="{{{ Input::old('id_number') }}}">
        </div>
        
        <div class="form-group">
            <label for="username">Relationship </label>
            <input class="form-control" placeholder="" type="text" name="rship" id="rship" value="{{{ Input::old('rship') }}}">
        </div>

        <div class="form-group">
            <label for="username">Contact </label>
            <textarea class="form-control" name="contact" id="contact">{{{ Input::old('contact') }}}</textarea>
        </div>
        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Kin</button>
        </div>

    </fieldset>
</form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="newdocument" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">New Document</h4>
      </div>
      <div class="modal-body">


@if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

     <form method="POST" action="{{{ URL::to('documents') }}}" accept-charset="UTF-8" enctype="multipart/form-data">
   {{ csrf_field() }}
    <fieldset>

            <input class="form-control" placeholder="" type="hidden" name="employee" id="employee" value="{{$id}}">

       <div class="form-group">
                        <label for="username">Document</label><span style="color:red">*</span><br>
                        <input class="img" placeholder="" type="file" name="path" id="path" value="{{{ Input::old('path') }}}" required="">
                    </div>

        <div class="form-group">
            <label for="username">Document Name <span style="color:red">*</span> </label><br>
            <input class="form-control" placeholder="" type="text" name="type" id="type" value="{{{ Input::old('type') }}}" required="">
        </div>

        <div class="form-group">
            <label for="username">Description </label><br>
            <textarea name="desc" class="form-control" id="desc">{{{ Input::old('desc') }}}</textarea>
        </div>

        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Upload Document</button>
        </div>

    </fieldset>
</form>
      </div>
    </div>
  </div>
</div>

<a class="btn btn-info btn-sm "  href="{{ URL::to('employees/editdetails/'.$employee->id)}}">update details</a>

<hr>
</div>	
</div>



<div class="row">
    <div class="col-lg-12">

<hr>

</div>  
</div>



 <div class="row">

<div class="col-lg-2">

<img src="{{asset('/uploads/employees/photo/'.$employee->photo) }}" width="150px" height="130px" alt=""><br>
<br>
<img src="{{asset('/uploads/employees/signature/'.$employee->signature) }}" width="120px" height="50px" alt="">
</div>

<div class="col-lg-5">

<table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Personal Information</span></strong></td></tr>
     <tr><td><strong>Payroll Number: </strong></td><td>{{$employee->personal_file_number}}</td></tr>
      @if($employee->middle_name != null || $employee->middle_name != ' ')
      <tr><td><strong>Employee Name: </strong></td><td> {{$employee->last_name.' '.$employee->first_name.' '.$employee->middle_name}}</td>
      @else
      <td><strong>Employee Name: </strong></td><td> {{$employee->last_name.' '.$employee->first_name}}</td>
      @endif
      </tr>
      <tr><td><strong>Identity Number: </strong></td><td>{{$employee->identity_number}}</td></tr>
     <tr><td><strong>Gender:</strong></td>
        @if($employee->gender != null)
        <td>{{$employee->gender}}</td>
        @else
        <td></td>
        @endif
        </tr>
        
</table>
</div>

<div class="col-lg-5">

<table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Personal Information</span></strong></td></tr>
     
        <tr><td><strong>Marital Status:</strong></td>
        @if($employee->marital_status != null)
        <td>{{$employee->marital_status}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Date of Birth:</strong></td>
        @if($employee->yob != null)
        <td>{{$employee->yob}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Citizenship:</strong></td>
        @if($employee->citizenship != null)
        <td>{{$employee->citizenship->name}}</td>
        @else
        <td></td>
        @endif
        </tr>
      <tr><td><strong>Education:</strong></td>
        @if($employee->education_type_id != 0)
        <td><?php 
            $education = DB::table('education')->where('id', '=', $employee->education_type_id)->pluck('education_name');            
            ?>

            {{ $education[0]}}</td>
        @else
        <td></td>
        @endif
        </tr>
</table>
</div>
</div>




<div class="row">


    <div class="col-lg-12">

@if (Session::has('flash_message'))

      <div class="alert alert-success">
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger">
      {{ Session::get('delete_message') }}
     </div>
    @endif



        <div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#employeeinfo" aria-controls="employeeinfo" role="tab" data-toggle="tab">Employee Information</a></li>
    <li role="presentation"><a href="#kins" aria-controls="kins" role="tab" data-toggle="tab">Next of Kin</a></li>
    <li role="presentation"><a href="#documents" aria-controls="documents" role="tab" data-toggle="tab">Documents</a></li>
    <li role="presentation"><a href="#appraisals" aria-controls="appraisals" role="tab" data-toggle="tab">Appraisal</a></li>
    <li role="presentation"><a href="#properties" aria-controls="properties" role="tab" data-toggle="tab">Company Property</a></li>
    <li role="presentation"><a href="#occurences" aria-controls="occurences" role="tab" data-toggle="tab">Occurence</a></li>
    <!-- <li role="presentation"><a href="#benefits" aria-controls="benefits" role="tab" data-toggle="tab">Benefits</a></li> -->
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">


  <div role="tabpanel" class="tab-pane active" id="employeeinfo">
        <br>

     <div class="row">

<div class="col-lg-4">

<table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Company Information</span></strong></td></tr>

<tr><td><strong>Branch: </strong></td> 
        @if($employee->branch_id != 0)
        <td> {{ $employee->branch->name}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Department: </strong></td>
        @if($employee->department_id != 0)
        <td> {{ $employee->department->department_name.' ('.$employee->department->codes.')'}}</td>
        @else
        <td></td>
        @endif
        </tr>

 <tr><td><strong>Job Group: </strong></td>
        @if($employee->job_group_id != 0)
        <td>
            <?php 
            $jgroup = DB::table('job_group')->where('id', '=', $employee->job_group_id)->pluck('job_group_name');            
            ?>

            {{ $jgroup[0]}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Employee Type: </strong></td>
        @if($employee->type_id != 0)
        <td>
            <?php 
            $etype = DB::table('employee_type')->where('id', '=', $employee->type_id)->pluck('employee_type_name');            
            ?>

            {{ $etype[0]}}</td>
        @else
        <td></td>
        @endif

       @if($employee->type_id == 2)
        <tr><td><strong> Start Date </strong></td><td> {{ $employee->start_date}}</td></tr>
        <tr><td><strong> End Date </strong></td><td> {{ $employee->end_date}}</td></tr>
        @else
        
        @endif

        </tr>
        
        <tr><td><strong>Work Permit: </strong></td>
        @if($employee->work_permit_number != null)
        <td>{{$employee->work_permit_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Job Title: </strong></td>
        @if($employee->job_title != null)
        <td>{{$employee->job_title}}</td>
        @else
        <td></td>
        @endif
        </tr>

        @if(Entrust::can('manager_payroll'))
        <tr><td><strong>Basic Salary: </strong></td>
        <td align="right">{{asMoney((double)$employee->basic_pay)}}</td>
        </tr>
        @else
        @if($employee->job_group_id != 2)
        <tr><td><strong>Basic Salary: </strong></td>
        <td align="right">{{asMoney((double)$employee->basic_pay)}}</td>
        </tr>
        @endif
        @endif
        
        <tr><td><strong>Date Joined:</strong></td>
        @if($employee->date_joined != null)
        <td>{{$employee->date_joined}}</td>
        @else
        <td></td>
        @endif
        </tr>

        <tr><td><strong>Supervisor:</strong></td>     
        @if($c>0)
        <?php
        $sup = App\Supervisor::where('employee_id',$employee->id)->first();
        $supervisor = App\Employee::where('id',$sup->supervisor_id)->first();
        ?>
        <td>{{$supervisor->first_name.' '.$supervisor->last_name}}</td>
        @else
        <td></td>
        @endif
        </tr>

</table>


</div>

<div class="col-lg-4">
    <table class="table table-bordered table-hover">
<tr><td colspan="2"><strong><span style="color:green">Goverment Requirements</span></strong></td></tr>
     <tr><td><strong>Kra Pin: </strong></td>
        @if($employee->pin != null)
        <td>{{$employee->pin}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Nssf Number: </strong></td>
        @if($employee->social_security_number != null)
        <td>{{$employee->social_security_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Nhif Number: </strong></td>
        @if($employee->hospital_insurance_number != null)
        <td>{{$employee->hospital_insurance_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
      </table>
    </div>

  <div class="col-lg-4" >
    <table class="table table-bordered table-hover">
      <tr><td colspan="2"><strong><span style="color:green">Bank Information</span></strong></td></tr>
      <tr><td><strong>Mode of Payment:</strong></td>
        @if($employee->mode_of_payment == 'Others')
        <td>{{$employee->custom_field1}}</td>
        @else
        <td>{{$employee->mode_of_payment}}</td>
        @endif
        </tr>
      <tr><td><strong>Employee Bank: </strong></td>
        @if($employee->bank_id != 0)
        <td>
            <?php 
            $bank = DB::table('banks')->where('id', '=', $employee->bank_id)->pluck('bank_name');            
            ?>

            {{ $bank[0]}}</td>
        @else
        <td></td>
        @endif
        </tr>
 
        <tr><td><strong>Bank Branch: </strong></td>
        @if($employee->bank_id != 0)
        <td>
            <?php 
            $bbranch = DB::table('bank_branches')->where('id', '=', $employee->bank_branch_id)->pluck('bank_branch_name');            
            ?>

            {{ $bbranch[0]}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Bank Account Number:</strong></td>
        @if($employee->bank_account_number != null)
        <td>{{$employee->bank_account_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Sort Code:</strong></td>
        @if($employee->bank_eft_code != null)
        <td>{{$employee->bank_eft_code}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Swift Code:</strong></td>
        @if($employee->swift_code != null)
        <td>{{$employee->swift_code}}</td>
        @else
        <td></td>
        @endif
        </tr>

</table>
</div>
</div>
<div class="row">
 <div class="col-lg-4">
<table class="table table-bordered table-hover">
 <tr><td colspan="2"><strong><span style="color:green">Contact Information</span></strong></td></tr>
 <tr><td><strong>Office Email:</strong></td>
        @if($employee->email_office != null)
        <td>{{$employee->email_office}}</td>
        @else
        <td></td>
        @endif
        </tr>
<tr><td><strong>Personal Email:</strong></td>
        @if($employee->email_personal != null)
        <td>{{$employee->email_personal}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Mobile Phone:</strong></td>
        @if($employee->telephone_mobile != null)
        <td>{{$employee->telephone_mobile}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Postal Address:</strong></td>
        @if($employee->postal_address != null)
        <td>{{$employee->postal_address}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Postal Zip:</strong></td>
        @if($employee->postal_zip != null)
        <td>{{$employee->postal_zip}}</td>
        @else
        <td></td>
        @endif
        </tr>
</table>
<br><br><br>
</div>


<div class="col-lg-4" >
<table class="table table-bordered table-hover">
 <tr><td colspan="2"><strong><span style="color:green">Other Information</span></strong></td></tr>
 <tr><td><strong>Apply Tax:</strong></td>
        @if($employee->income_tax_applicable != null)
        <td>Yes</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>Apply Tax Relief:</strong></td>
        @if($employee->income_tax_relief_applicable != null)
        <td>Yes</td>
        @else
        <td>No</td>
        @endif
        </tr>
        <tr><td><strong>Apply Nssf:</strong></td>
        @if($employee->hospital_insurance_applicable != null)
        <td>Yes</td>
        @else
        <td>No</td>
        @endif
        </tr>
        <tr><td><strong>Apply Nhif:</strong></td>
        @if($employee->social_security_applicable != null)
        <td>Yes</td>
        @else
        <td>No</td>
        @endif
        </tr>
        
</table>
</div>

</div>

    </div>
   

     <div role="tabpanel" class="tab-pane" id="kins">

        <br>

     <div class="row">
          <div class="col-lg-12">

    <div class="panel panel-default">

      <div class="panel-heading">
          <a class="btn btn-info btn-sm" href="{{ URL::to('NextOfKins/create')}}">new kin</a>
        </div>
     
        <div class="panel-body">


    <table id="users" width="1000" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Kin Name</th>
         <th>ID Number</th>
         <th>Relationship</th>
        <th></th>

      </thead>

      <!-- <tfoot>

        <th>#</th>
        <th>Kin Name</th>
         <th>ID Number</th>
         <th>Relationship</th>
        
      </tfoot> -->

      <tbody>

        <?php $i = 1; ?>
        @foreach($kins as $kin)

        <tr>

          <td> {{ $i }}</td>
          @if($kin->middle_name == '')
          <td>{{ $kin->first_name.' '.$kin->last_name }}</td>
          @else
          <td>{{ $kin->first_name.' '.$kin->middle_name.' '.$kin->last_name }}</td>
          @endif
          @if($kin->id_number!=' ' || $kin->id_number!=null)
          <td>{{ $kin->id_number }}</td>
          @else
          <td></td>
          @endif
          @if($kin->id_number!=' ' || $kin->id_number!=null)
          <td>{{ $kin->relationship }}</td>
           @else
          <td></td>
          @endif
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('NextOfKins/view/'.$kin->id)}}">View</a></li>   
                    <li><a href="{{URL::to('NextOfKins/edit/'.$kin->id)}}">Update</a></li>
                    <li><a href="{{URL::to('NextOfKins/delete/'.$kin->id)}}" onclick="return (confirm('Are you sure you want to delete this employee`s kin?'))">Delete</a></li>
                     

                 
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

</div>
    </div>

    <div role="tabpanel" class="tab-pane" id="documents">

        <br>

        
<div class="row">
    <div class="col-lg-12">

    <div class="panel panel-default">
      <div class="panel-heading">
          <a class="btn btn-info btn-sm" href="{{ URL::to('documents/create')}}">new employee document</a>
        </div>
      
        <div class="panel-body">


    <table id="doc" width="1000" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Document Type</th>
        <th>Description</th>
        <th></th>

      </thead>

      <!-- <tfoot>

        <th>#</th>
        <th>Document Type</th>
        <th>From Date</th>
        <th>End Date</th>

      </tfoot> -->
      <tbody>
          
        <?php $i = 1; ?>
        @foreach($documents as $document)
        <?php
         $name = $document->document_name;
         $file_name = pathinfo($name, PATHINFO_FILENAME); 
        ?>
        <tr>

          <td> {{ $i }}</td>
          <td>{{ $file_name }}</td>
          <td>{{ $document->description }}</td>
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                  <!-- <li><a target="blank" href="{{asset('/public/uploads/employees/documents/'.$document->document_path) }}">Download</a></li> -->
                    <li><a href='{{asset("uploads/employees/documents/".$document->document_path)}}'>Download</a></li> 
                    <li><a href="{{URL::to('documents/edit/'.$document->id)}}">Update</a></li>
                    <li><a href="{{URL::to('documents/delete/'.$document->id)}}" onclick="return (confirm('Are you sure you want to delete this employee`s document?'))">Delete</a></li>
                    
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

</div>
    </div>

    <div role="tabpanel" class="tab-pane" id="appraisals">


<br>

<div class="row">
    <div class="col-lg-12">

    <div class="panel panel-default">
     <div class="panel-heading">
          <h4>Appraisals</h4>
        </div>
        <div class="panel-body">
    

    <table id="appr" width="1000" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Appraisal Question</th>
        <th>Performance</th>
        <th>Score</th>
        <th></th>

      </thead>

       <!-- <tfoot>

        <th>#</th>
        <th>Appraisal Question</th>
        <th>Performance</th>
        <th>Score</th>
      </tfoot> -->

      <tbody>

        <?php $i = 1; ?>
        @foreach($appraisals as $appraisal)

        <tr>
          

          <td> {{ $i }}</td>
          <td>{{ Appraisalquestion::getQuestion($appraisal->appraisalquestion_id) }}</td>
          <td>{{ $appraisal->performance }}</td>
          <td>{{ $appraisal->rate.' / '. Appraisalquestion::getScore($appraisal->appraisalquestion_id) }}</td>
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('Appraisals/view/'.$appraisal->id)}}">View</a></li> 
                    
                    
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

    </div>

</div>

    <div role="tabpanel" class="tab-pane" id="properties">

      <br>


<div class="row">
    <div class="col-lg-12">

    <div class="panel panel-default">
      <div class="panel-heading">
        <h4>Company Property</h4>
        </div>
     
        <div class="panel-body">


    <table id="prop" width="1000" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Name</th>
         <th>Amount</th>
         
        <th></th>

      </thead>

      <!-- <tfoot>

        <th>#</th>
        <th>Name</th>
         <th>Amount</th>
      </tfoot> -->

      <tbody>

        <?php $i = 1; ?>
        @foreach($properties as $property)

        <tr>

          <td> {{ $i }}</td>
          <td>{{ $property->name }}</td>
          <td align="right">{{ asMoney((double)$property->monetary) }}</td>
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('Properties/view/'.$property->id)}}">View</a></li> 
                    
                    
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

        </div>

        </div>


 <div role="tabpanel" class="tab-pane" id="occurences">

      <br>


<div class="row">
    <div class="col-lg-12">

    <div class="panel panel-default">
       <div class="panel-heading">
        <h4>Occurrences</h4>
        </div>
        <div class="panel-body">


    <table id="occ" width="1000" class="table table-condensed table-bordered table-responsive table-hover">


      <thead>

        <th>#</th>
        <th>Occurence</th>
        <th></th>

      </thead>

      <!-- <tfoot>

        <th>#</th>
        <th>Occurence</th>

      </tfoot> -->

      <tbody>

        <?php $i = 1; ?>
        @foreach($occurences as $occurence)

        <tr>

          <td> {{ $i }}</td>
          <td>{{ $occurence->occurence_brief }}</td>
          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('occurences/view/'.$occurence->id)}}">View</a></li>
                     <li><a href="{{asset('public/uploads/employees/documents/'.$occurence->doc_path)}}">Download</a></li>
                    
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
    </div>


	</div>


  

</div>
</div>


@stop