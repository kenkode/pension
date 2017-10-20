 <?php 

    use App\Http\Controllers\UserController;
    use App\Http\Controllers\Controller;
    use App\Category;

     $categories= Category::all();

    ?>

 <li class="active">
<a href="{{ url('/login') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard</span> </a> </li>

@if(Controller::role()=='Admin')
<li><a href="{{ url('/users') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Users</span> </a> </li>
<li><a href="{{ url('/deductions') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Deductions</span> </a> </li>

<li><a href="{{ url('schemes') }}"><i class="fa fa-pencil"></i> <span class="nav-label"></span>AIU Scheme </a> </li>

<li><a href="{{ url('/calendar') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Calendar</span> </a> </li>
<li><a href="{{ url('/emails') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Emails</span> </a> </li>

@elseif(Controller::role()=='Finance')
<li><a href="{{ url('/deductions') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Deductions</span> </a> </li>

<li><a href="{{ url('schemes') }}"><i class="fa fa-pencil"></i> <span class="nav-label"></span>AIU Scheme </a> </li>

<li><a href="{{ url('/calendar') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Calendar</span> </a> </li>
<li><a href="{{ url('/emails') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Emails</span> </a> </li>

@elseif(Controller::role()=='Human Resource')
<!-- <li><a href="{{ url('/employees') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Employees</span> </a> </li> -->
                    <li>
                        <a href="#"><i class="fa fa-users fa-fw"></i>Employees <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('employees/create') }}"><i class="fa fa-chevron-right fa-fw"></i>New Employee</a></li>
                            <li><a href="{{ URL::to('employees') }}"><i class="fa fa-chevron-right fa-fw"></i>Manage Employees </a></li>
                            <li><a href="{{ URL::to('Appraisals') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Appraisal</a></li>
                            <li><a href="{{ URL::to('occurences') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Occurence </a></li>
                            <li><a href="{{ URL::to('deactives') }}"><i class="fa fa-chevron-right fa-fw"></i>Activate Employee</a></li>
                            <li><a target="_blank" href="{{ URL::to('EmployeeForm') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Detail Form</a></li>
                            <li><a href="{{ URL::to('payrollReports/selectPeriod') }}"><i class="fa fa-chevron-right fa-fw"></i>Payslips</a></li>
                        </ul>   
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-bell fa-fw"></i>Reminders <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('reminderview') }}"><i class="fa fa-bell fa-fw"></i>Contract Reminders</a></li>
                            <li><a href="{{ URL::to('reminderdoc/indexdoc') }}"><i class="fa fa-bell fa-fw"></i>Document Reminders</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="{{ URL::to('leavemgmt')}}"><i class="fa fa-list fa-fw"></i>Vacation Management</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('Properties') }}"><i class="fa fa-users fa-fw"></i>Company Property </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <i class="fa fa-sitemap fa-fw"></i>Company Information <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('organizations') }}"><i class="fa fa-chevron-right fa-fw"></i>Organization Settings</a></li>
                            <li><a href="{{ URL::to('branches') }}"><i class="fa fa-chevron-right fa-fw"></i>Branches</a></li>
                            <li><a href="{{ URL::to('departments') }}"><i class="fa fa-chevron-right fa-fw"></i>Departments</a></li>
                            <li><a href="{{ URL::to('portal')}}"><i class="fa fa-chevron-right fa-fw"></i>Portal</a></li>
                        </ul>
                    </li> 

                    <li>
                        <a href="#">
                            <i class="fa fa-university fa-fw"></i>Bank Information <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('banks') }}"><i class="fa fa-chevron-right fa-fw"></i>Banks</a></li>
                            <li><a href="{{ URL::to('bank_branch') }}"><i class="fa fa-chevron-right fa-fw"></i>Bank Branches</a></li>
                        </ul>
                    </li> 

                    <li>
                        <a href="#">
                            <i class="fa fa-folder-open fa-fw"></i>HR Reports <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('employee/select') }}">Individual Employee report</a></li>
                            <li><a href="{{ URL::to('reports/selectEmployeeStatus') }}">Employee List report</a></li>
                            <li><a href="{{ URL::to('reports/nextofkin/selectEmployee') }}">Next of Kin Report</a> </li>
                            <li><a href="{{ URL::to('reports/selectEmployeeOccurence') }}">Employee Occurence report </a></li>
                            <li><a href="{{ URL::to('reports/CompanyProperty/selectPeriod') }}">Company Property report </a></li>
                            <li><a href="{{ URL::to('reports/Appraisals/selectPeriod') }}">Appraisal report </a></li>
                        </ul>
                    </li> 

                    
                    <li>
                        <a href=""><i class="fa fa-cog fa-fw"></i>Preferences<i class="fa fa-caret-down fa-fw"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('departments') }}"><i class="fa fa-chevron-right fa-fw"></i>HR Settings</a></li>
                            <li><a href="{{ URL::to('system') }}"><i class="fa fa-chevron-right fa-fw"></i>System Settings</a></li>
                            <li><a href="{{ URL::to('leavetypes') }}"><i class="fa fa-chevron-right fa-fw"></i>Leave Types</a></li>
                            <li><a href="{{ URL::to('holidays') }}"><i class="fa fa-chevron-right fa-fw"></i>Holiday Management</a></li>
                            <li><a href="{{ URL::to('deactives') }}"><i class="fa fa-chevron-right fa-fw"></i>Activate Employee</a></li>
                            <li><a href="{{ URL::to('migrate') }}"><i class="fa fa-chevron-right fa-fw"></i>Data Migration</a></li> 
                            <li><a href="{{ URL::to('activatedproducts') }}"><i class="fa fa-chevron-right fa-fw"></i>Upgrade License</a></li> 
                        </ul>
                    </li>

                    <li>
                        <a href=""><i class="fa fa-cogs fa-fw"></i>General Settings<i class="fa fa-caret-down fa-fw"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('benefitsettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Benefit Settings</a></li>
                            <li><a href="{{ URL::to('employee_type') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Types</a></li>
                            <li><a href="{{ URL::to('job_group') }}"><i class="fa fa-chevron-right fa-fw"></i>Job Groups</a></li>
                            <li><a href="{{ URL::to('occurencesettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Occurence Settings</a></li>
                            <li><a href="{{ URL::to('citizenships') }}"><i class="fa fa-chevron-right fa-fw"></i>Citizenship</a></li>
                            <li><a href="{{ URL::to('appraisalcategories') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Category</a></li>
                            <li><a href="{{ URL::to('AppraisalSettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Setting</a></li>
                        </ul>
                    </li>
                        
                   <li>
                        <a href="#"><i class="fa fa-credit-card fa-fw"></i>Payroll Management <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('other_earnings') }}"><i class="fa fa-credit-card fa-fw"></i>Earnings</a>
                            <li><a href="{{ URL::to('employee_allowances') }}"><i class="fa fa-credit-card fa-fw"></i>Allowances</a>
                            <li><a href="{{ URL::to('overtimes') }}"><i class="fa fa-credit-card fa-fw"></i>Overtimes</a> 
                            <li><a href="{{ URL::to('employee_deductions') }}"><i class="fa fa-barcode fa-fw"></i>Deductions</a>
                            <li><a href="{{ URL::to('employee_relief') }}"><i class="fa fa-credit-card fa-fw"></i>Relief</a>
                            <li><a href="{{ URL::to('employeenontaxables') }}"><i class="fa fa-credit-card fa-fw"></i>Non-Taxable Income</a></li>
                            <li><a href="{{ URL::to('payrollcalculator') }}"><i class="fa fa-calculator fa-fw"></i>Payroll Calculator</a>
                            <li><a href="{{ URL::to('email/payslip') }}"><i class="fa fa-envelope fa-fw"></i>Email Payslips</a>  
                        </ul>
                    </li> 

                    <li>
                        <a href="#"><i class="fa fa-cogs fa-fw"></i>Process <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li>
                              <a href="{{ URL::to('advance') }}"><i class="fa fa-credit-card fa-fw"></i>Advance Salaries</a>
                            </li>
                            <li>
                              <a href="{{ URL::to('payroll') }}"><i class="fa fa-credit-card fa-fw"></i>Payroll</a>
                            </li>
                        </ul>
                    </li> 

                    <li>
                        <a href="#"><i class="fa fa-folder-open fa-fw"></i>Reports <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li>
                                <a href="{{ URL::to('advanceReports') }}"><i class="fa fa-folder-open fa-fw"></i>Advance Reports</a>
                            </li>
                            <li>
                                <a href="{{ URL::to('payrollReports') }}"><i class="fa fa-folder-open fa-fw"></i>Payroll Reports</a>
                            </li>
                            <li>
                                <a href="{{ URL::to('statutoryReports') }}"><i class="fa fa-folder-open fa-fw"></i>Statutory Reports</a>
                            </li>
                        </ul>
                    </li> 

                    <li>
                      <a href="{{ URL::to('allowances') }}"><i class="glyphicon glyphicon-cog fa-fw"></i>  Payroll Settings</a>
                    </li> 

                    <li>
                        <a href="#"><i class="fa fa-cogs fa-fw"></i>Preferences <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('accounts') }}"><i class="fa fa-cog fa-fw"></i>Accounts Settings</a></li> 
                            <li><a href="{{ URL::to('migrate') }}"><i class="fa fa-random fa-fw"></i>Data Migration</a></li>
                        </ul>
                    </li>
<li><a href="{{ url('schemes') }}"><i class="fa fa-pencil"></i> <span class="nav-label"></span>AIU Scheme </a> </li>

<li><a href="{{ url('/calendar') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Calendar</span> </a> </li>
<li><a href="{{ url('/emails') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Emails</span> </a> </li>

@elseif(Controller::role()=='Employee')
<li><a href="{{ url('/statement') }}"><i class="fa fa-th-large"></i> <span class="nav-label">My statement</span> </a> </li>
<li><a href="{{ url('/documents') }}"><i class="fa fa-th-large"></i> <span class="nav-label">My Documents</span> </a> </li>
<li><a href="{{ url('schemes') }}"><i class="fa fa-pencil"></i> <span class="nav-label"></span>AIU Scheme </a> </li>

<li><a href="{{ url('/calendar') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Calendar</span> </a> </li>
<li><a href="{{ url('/emails') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Emails</span> </a> </li>


@endif
<li>
<a href="{{ url('/logout') }}"
    onclick="event.preventDefault();
             document.getElementById('logout-form').submit();">
    Logout
</a>

<form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>
</li>

   
