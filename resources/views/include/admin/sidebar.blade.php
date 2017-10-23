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
                            <li><a href="{{ URL::to('Properties') }}"><i class="fa fa-users fa-fw"></i>Company Property </a></li>
                        </ul>   
                    </li>

                    
                    <li>
                        <a href="{{ URL::to('leavemgmt')}}"><i class="fa fa-list fa-fw"></i>Vacation <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                        	<li>
                        <a href="{{ URL::to('leavemgmt') }}"><i class="fa fa-file fa-fw"></i> Leave Applications</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaveamends') }}"><i class="fa fa-edit fa-fw"></i>  Leaves Amended</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaveapprovals') }}"><i class="fa fa-check fa-fw"></i>  Leaves Approved</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaverejects') }}"><i class="fa fa-barcode fa-fw"></i> Leaves Rejected</a>
                    </li>


                     

                   <li>
                        <a href="{{ URL::to('leavetypes') }}"><i class="fa fa-list fa-fw"></i> Leave Types</a>
                    </li>
                   

                   <li>
                        <a href="{{ URL::to('holidays') }}"><i class="fa fa-random fa-fw"></i> Holiday Management</a>
                    </li>
                        </ul>
                    </li>

                    
                    

                    <li>
                        <a href="#">
                            <i class="fa fa-folder-open fa-fw"></i>Reports <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('employee/select') }}">Individual Employee report</a></li>
                            <li><a href="{{ URL::to('reports/selectEmployeeStatus') }}">Employee List report</a></li>
                            <li><a href="{{ URL::to('reports/nextofkin/selectEmployee') }}">Next of Kin Report</a> </li>
                            <li><a href="{{ URL::to('reports/selectEmployeeOccurence') }}">Employee Occurence report </a></li>
                            <li><a href="{{ URL::to('reports/CompanyProperty/selectPeriod') }}">Company Property report </a></li>
                            <li><a href="{{ URL::to('reports/Appraisals/selectPeriod') }}">Appraisal report </a></li>
                            <li><a href="{{ URL::to('leaveReports/selectApplicationPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Vacation Application</a></li>
                   <li><a href="{{ URL::to('leaveReports/selectRosterPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Vacation Roster</a></li>
                   <li><a href="{{ URL::to('leaveReports/selectApprovedPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Approved</a></li>
                   <li><a href="{{ URL::to('leaveReports/selectRejectedPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Rejected</a></li>
                   <li><a href="{{ URL::to('leaveReports/selectLeave') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Balances</a></li>
                   <li><a href="{{ URL::to('leaveReports/selectLeaveType') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Employees on vacation</a></li>  
                   <li><a href="{{ URL::to('leaveReports/selectEmployee') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Individual Employee </a></li>  
                   <li>
                            <li>
                        <a href="{{ URL::to('payrollReports/selectPeriod') }}" ><i class="glyphicon glyphicon-file fa-fw"></i> Monthly Payslips</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('payrollReports/selectSummaryPeriod') }}" ><i class="glyphicon glyphicon-file fa-fw"></i> Payroll Summary</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('payrollReports/selectRemittancePeriod') }}" ><i class="glyphicon glyphicon-file fa-fw"></i> Pay Remittance</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('payrollReports/selectEarning') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Earning Report</a>
                    </li>  

                    <li>
                        <a href="{{ URL::to('payrollReports/selectAllowance') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Allowance Report</a>
                    </li>  

                    <li>
                        <a href="{{ URL::to('payrollReports/selectnontaxableincome') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Non Taxable Income Report</a>
                    </li>  

                    <li>
                        <a href="{{ URL::to('payrollReports/selectOvertime') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Overtimes Report</a>
                    </li>  

                    <li>
                        <a href="{{ URL::to('payrollReports/selectDeduction') }}" ><i class="glyphicon glyphicon-file fa-fw"></i> Deduction Report</a>
                    </li>  

                    <li>
                        <a href="{{ URL::to('payrollReports/selectRelief') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Relief Report</a>
                    </li>  
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
                            <li>
                              <a href="{{ URL::to('advance') }}"><i class="fa fa-credit-card fa-fw"></i>Advance Salaries</a>
                            </li>
                            <li>
                              <a href="{{ URL::to('payroll') }}"><i class="fa fa-credit-card fa-fw"></i>Process Payroll</a>
                            </li>
                        </ul>
                    </li> 

 <li>
                        <a href="#"><i class="fa fa-cogs fa-fw"></i>Preferences <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                            <li><a href="{{ URL::to('accounts') }}"><i class="fa fa-cog fa-fw"></i>Accounts Settings</a></li> 
                            <li><a href="{{ URL::to('migrate') }}"><i class="fa fa-random fa-fw"></i>Data Migration</a></li>
                            <li><a href="{{ URL::to('organizations') }}"><i class="fa fa-chevron-right fa-fw"></i>Organization Settings</a></li>
                            <li><a href="{{ URL::to('branches') }}"><i class="fa fa-chevron-right fa-fw"></i>Branches</a></li>
                            <li><a href="{{ URL::to('departments') }}"><i class="fa fa-chevron-right fa-fw"></i>Departments</a></li>
                            <li><a href="{{ URL::to('banks') }}"><i class="fa fa-chevron-right fa-fw"></i>Banks</a></li>
                            <li><a href="{{ URL::to('bank_branch') }}"><i class="fa fa-chevron-right fa-fw"></i>Bank Branches</a></li>
                            <li><a href="{{ URL::to('leavetypes') }}"><i class="fa fa-chevron-right fa-fw"></i>Leave Types</a></li>
                            <li><a href="{{ URL::to('holidays') }}"><i class="fa fa-chevron-right fa-fw"></i>Holiday Management</a></li>
                            <li><a href="{{ URL::to('deactives') }}"><i class="fa fa-chevron-right fa-fw"></i>Activate Employee</a></li>
                             <!-- <li><a href="{{ URL::to('benefitsettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Benefit Settings</a></li> -->
                            <li><a href="{{ URL::to('employee_type') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Types</a></li>
                            <li><a href="{{ URL::to('job_group') }}"><i class="fa fa-chevron-right fa-fw"></i>Job Groups</a></li>
                            <li><a href="{{ URL::to('occurencesettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Occurence Settings</a></li>
                            <li><a href="{{ URL::to('citizenships') }}"><i class="fa fa-chevron-right fa-fw"></i>Citizenship</a></li>
                            <li><a href="{{ URL::to('appraisalcategories') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Category</a></li>
                            <li><a href="{{ URL::to('AppraisalSettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Setting</a></li>
                            <li>
                        <a href="{{ URL::to('allowances') }}"><i class="fa fa-chevron-right fa-fw"></i> Allowances</a>
                    </li>

                     <li>
                        <a href="{{ URL::to('reliefs') }}"><i class="fa fa-list fa-fw"></i> Relief</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('deductions') }}"><i class="fa fa-list fa-fw"></i> Deductions</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('nssf') }}"><i class="fa fa-list fa-fw"></i> Nssf Rates</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('nhif') }}"><i class="fa fa-list fa-fw"></i> Nhif Rates</a>
                    </li>
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

   
