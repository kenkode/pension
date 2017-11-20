<!DOCTYPE html>
<html>

<head>
@include('include.admin.head')   

</head>

<body >
    <div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse" >
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <h1>PENSION</h1></a>
                       
                    </div>
                    <div class="logo-element">
                        PMS
                    </div>
                </li>

                 @include('include.admin.sidebar')
                
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg" style="background: white !important">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
           <!--  <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form> -->
        </div>
            <ul class="nav navbar-top-links navbar-right">
               

                <li class="dropdown">
                    @if(Auth::user()->role == 'Employee')
                    <?php 
                    $employee = App\Employee::where('personal_file_number',Auth::user()->name)->first(); 
                    ?>
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">{{ $employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name }}</a>
                    @else
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">{{ Auth::user()->name }}</a>
                    @endif
                    <ul class="dropdown-menu">
                        <li>
                           <a href="{{ URL::to('users/profile/'.Auth::user()->id) }}"><i class="fa fa-user fa-fw"></i> Profile</a>
                       </li>
                        
                        <li class="divider"></li>
                        
                         <li>
                                        <a href="{{ url('/logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            <i class="fa fa-sign-out fa-fw"></i>Logout
                                        </a>

                                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                    </ul>
                </li>

            </ul>

        </nav>
        </div>



             


               @yield('content')

               
        

       


        <div class="footer">
            
            <div>
                <strong>Copyright</strong> Priority Mobile &copy; <?php echo date("Y", time());?>
            </div>
        </div>

        </div>
        
    </div>
   @include('include.admin.footer')
   
</body>
</html>

