@extends('layouts.app')
@section('content')

  <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2> Aui Scheme</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Scheme</a>
                        </li>
                     
                </div>
                <div class="col-lg-2">

                </div>
      </div>
            


<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Upload new document</h5>                       

                        <div class="ibox-tools">

                        <a class="btn btn-primary" href="{{ url('/education') }}"> Back</a>


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

  {!! Form::open(array('route' => 'schemes.store','method'=>'POST','files'=>'true')) !!}
<div class="row">
<div class="col-xs-4 col-sm-4 col-md-4">
    <div class="form-group">
           <strong> Document Name:</strong>
      <input name="name" value="" class="form-control"/>
   </div>
  </div>

 <div class="col-xs-4 col-sm-4 col-md-4">
     <div class="form-group">
       <strong>Description:</strong>
    <textarea  name="description" class="form-control"></textarea>
   </div>
 </div>

 <div class="col-xs-4 col-sm-4 col-md-4">
    <div class="form-group">
           <strong> Category:</strong>
      <select name="category" class="form-control"/>
         @foreach($categories as $category)
         <option value="{{$category->id}}">{{$category->name}}</option>
         @endforeach
      </select>
   </div>
  </div>



  <div class="col-xs-8 col-sm-8 col-md-8">
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

 


<div class="col-xs-4 col-sm-4 col-md-4 text-center">
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

