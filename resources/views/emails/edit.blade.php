@extends('layouts.app')
@section('content')

<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Emails</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Emails</a>
                        </li>
                        <li class="active">
                            <strong>Send</strong>
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
                        <h5>Send Email to {{$user->name}}</h5>                       

                        <div class="ibox-tools">

                        <a class="btn btn-primary" href="{{ route('emails.index') }}"> Back</a>


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

  {!! Form::model($user, ['method' => 'PATCH','route' => ['emails.update', $user->id]]) !!}

 <div class="row">

   <input  type="hidden" name="to" value="{{$user->email}}"/>
   <input  type="hidden" name="name" value="{{$user->name}}"/>

 <div class="col-xs-8 col-sm-8 col-md-8">
     <div class="form-group">
       <strong>Subject:</strong>
    <input  type="text" name="subject" value="" class="form-control"/>
   </div>
 </div>

  
  <div class="col-xs-8 col-sm-8 col-md-8">
     <div class="form-group">
       <strong>Message:</strong>
    <textarea name="msg" class="form-control"></textarea> 
       </div>
 </div>



<div class="col-xs-12 col-sm-12 col-md-12 text-center">
    <button type="submit" class="btn btn-primary">SEND</button>
</div>


</div>

  {!! Form::close() !!}
  </div><!-- Main row -->

                                   

                    </div>
                    
                </div>
            </div>
            
  </div>


@endsection


