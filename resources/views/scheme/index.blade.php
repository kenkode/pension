@extends('layouts.app')
@section('content')
<?php 
use App\Http\Controllers\UserController;
use App\Http\Controllers\Controller;
?>

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

                                      

                        <div class="ibox-tools">
                          @if(Controller::role()!='Employee')
                         <a class="btn btn-success" href="{{ route('education.create') }}">New Document</a> 
                         @endif  
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
                       
                        <th>Document name</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Uploaded by</th>
                        <th>Date</th>                        
                        <th width="280px">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    @foreach ($documents as $key => $document)
                      <tr>
                          <td>{{ $document->document_name }}</td>
                          <td>{{ $document->description}}</td>
                          <td>{{ $document->type }}</td>
                          <td>{{ UserController::name_by_id($document->uploaded_by)}}</td>
                          <td>{{ $document->created_at}}</td>
                          <td>
                        
                          <a class="btn btn-primary" href="{{ url($document->path) }}">Download</a>
               @if(Controller::role()!='Employee')
                    {!! Form::open(['method' => 'DELETE','route' => ['schemes.destroy', $document->id],'style'=>'display:inline']) !!}
                    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
                @endif

                          {!! Form::close() !!}
                         </td>

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
