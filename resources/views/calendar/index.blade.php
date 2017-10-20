@extends('layouts.app')
@section('content')
<?php use App\Http\Controllers\UserController;?>

     <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2> Calendar</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a>Calendar</a>
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

                       <div id="calendar"></div>                      

                    </div>
                </div>
            </div>
            </div>
        </div>
        

@endsection
