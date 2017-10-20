@extends('layouts.app')
@section('content')

 <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2> Employee Documents</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Documents</a>
                        </li>
                        <li class="active">
                            <strong>new</strong>
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

                        <a class="btn btn-primary" href="{{ url('/employees') }}"> Back</a>


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

  {!! Form::open(array('route' => 'documents.store','method'=>'POST','files'=>'true')) !!}


<div class="row">
<div class="col-xs-3 col-sm-3 col-md-3">
    <div class="form-group">
      <select name="name" class="form-control"/>
      <option value="">Document Name:</option>
      <option value="National ID"> National ID</option>
      <option value="Driving Licence">Driving Licence</option>
      <option value="KCPE Certificate">KCPE Certificate</option>
      <option value="KCSE Certificate">KCSE Certificate</option>
      <option value="DIPLOMA Certificate">DIPLOMA Certificate</option>
      <option value="DEGREE Certificate">DEGREE Certificate</option>
      <option value="MASTERS Certificate">MASTERS Certificate</option> 
      <option value="PHD Certificate">PHD Certificate</option>
      <option value="OTHER Certificate">OTHER Certificate</option>
      </select>
   </div>
  </div>
  <div class="col-xs-1 col-sm-1 col-md-1">
    <div class="form-group">
      <input type="text" name="year" placeholder="year" class="yearly form-control"/>
      
   </div>
  </div>



  <div class="col-xs-6 col-sm-6 col-md-6">
    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
    <div class="form-control" data-trigger="fileinput">
        <i class="glyphicon glyphicon-file fileinput-exists"></i>
    <span class="fileinput-filename"></span>
    </div>
    <span class="input-group-addon btn btn-default btn-file">
        <span class="fileinput-new">Select file</span>
        <span class="fileinput-exists">Change</span>
        <input type="file" name="thefile"/>
    </span>
    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
</div> 
  </div> 


<div class="col-xs-2 col-sm-2 col-md-1text-center">
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