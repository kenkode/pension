@extends('layouts.app')
@section('content')
<?php use App\Http\Controllers\UserController;?>

     <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2> Emails</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Emails</a>
                        </li>
                        <li class="active">
                            <strong>send</strong>
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
                       <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                         <p>{{ $message }}</p>
                         </div>
                        @endif

                        <h5>Select user to email</h5>                      
             

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
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <thead>
                      <tr>
                       
                        <th>Name</th>
                        <th>Email</th>
                        <th>Roles</th>
                        <th width="280px">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    @foreach ($users as $key => $user)
                      <tr>
                         
                          <td>{{ $user->name }}</td>
                          <td>{{ $user->email }}</td>
                          @if(App\Role::check($user->id) > 0)
                          <td>{{ App\Role::getRole($user->id) }}</td>
                          @else
                          <td>Employee</td>
                          @endif
                          <td>
                        
                          <a class="btn btn-primary" href="{{ route('emails.edit',$user->id) }}">Send Email</a>

                        
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
        </div>v>
        

@endsection
