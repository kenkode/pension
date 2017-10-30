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
                            <li><a href="{{ URL::to('occurences') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Occurrence </a></li>
                            <li><a href="{{ URL::to('Properties') }}"><i class="fa fa-chevron-right fa-fw"></i>Company Property </a></li>
                            <li><a href="{{ URL::to('deactives') }}"><i class="fa fa-chevron-right fa-fw"></i>Activate Employee</a></li>
                            <li><a target="_blank" href="{{ URL::to('EmployeeForm') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Detail Form</a></li>
                            <li><a href="{{ URL::to('payrollReports/selectPeriod') }}"><i class="fa fa-chevron-right fa-fw"></i>Payslips</a></li>
                        </ul>   
                    </li>

                    
                    <li>
                        <a href="{{ URL::to('leavemgmt')}}"><i class="fa fa-list fa-fw"></i>Vacation <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                        	<li>
                        <a href="{{ URL::to('leavemgmt') }}"><i class="fa fa-file fa-fw"></i> Vacation Applications</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaveamends') }}"><i class="fa fa-edit fa-fw"></i>  Vacation Amended</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaveapprovals') }}"><i class="fa fa-check fa-fw"></i>  Vacation Approved</a>
                    </li>

                    <li>
                        <a href="{{ URL::to('leaverejects') }}"><i class="fa fa-barcode fa-fw"></i> Vacation Rejected</a>
                    </li>


                     

                   <!-- <li>
                        <a href="{{ URL::to('leavetypes') }}"><i class="fa fa-list fa-fw"></i> Vacation Types</a>
                    </li>
                   

                   <li>
                        <a href="{{ URL::to('holidays') }}"><i class="fa fa-random fa-fw"></i> Holiday Management</a>
                    </li> -->
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
                            <li>
                            <a href="#"><i class="fa fa-cog fa-fw"></i>Process <i class="fa fa-caret-down"></i></a>
                            <ul class="nav"> 
                            <li>
                              <a href="{{ URL::to('advance') }}"><i class="fa fa-credit-card fa-fw"></i>Advance Salaries</a>
                            </li>
                            <li>
                              <a href="{{ URL::to('payroll') }}"><i class="fa fa-credit-card fa-fw"></i> Payroll</a>
                            </li>
                            </ul>
                            </li>
                            <li><a href="{{ URL::to('payrollcalculator') }}"><i class="fa fa-calculator fa-fw"></i>Payroll Calculator</a>
                            <li><a href="{{ URL::to('email/payslip') }}"><i class="fa fa-envelope fa-fw"></i>Email Payslips</a> 
                            
                        </ul>
                    </li> 
                    

                    <li>
                        <a href="#">
                            <i class="fa fa-folder-open fa-fw"></i>Reports <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="nav">
                            <li>
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Employee Reports <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
                            <li><a href="{{ URL::to('employee/select') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Individual Employee report</a></li>
                            <li><a href="{{ URL::to('reports/selectEmployeeStatus') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Employee List report</a></li>
                            <li><a href="{{ URL::to('reports/nextofkin/selectEmployee') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Next of Kin Report</a> </li>
                            <li><a href="{{ URL::to('reports/selectEmployeeOccurence') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Employee Occurrence report </a></li>
                            <li><a href="{{ URL::to('reports/CompanyProperty/selectPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Company Property report </a></li>
                            <li><a href="{{ URL::to('reports/Appraisals/selectPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Appraisal report </a></li>
                            </ul>
                            </li>
                            <li>
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Vacation Reports <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
                            <li><a href="{{ URL::to('leaveReports/selectApplicationPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Vacation Application</a></li>
                   
                           <li><a href="{{ URL::to('leaveReports/selectApprovedPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Approved</a></li>
                           <li><a href="{{ URL::to('leaveReports/selectRejectedPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Rejected</a></li>
                           <li><a href="{{ URL::to('leaveReports/selectLeave') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Vacation Balances</a></li>
                           <li><a href="{{ URL::to('leaveReports/selectLeaveType') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Employees on vacation</a></li>  
                           <li><a href="{{ URL::to('leaveReports/selectEmployee') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Individual Employee </a></li>  
                           </ul>
                           </li>
                           <li>
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Payroll <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
                            <li>
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Salary Advance Reports <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">

                            <li><a href="{{ URL::to('advanceReports/selectSummaryPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Advance Summary</a></li>
                            <li><a href="{{ URL::to('advanceReports/selectRemittancePeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Advance Remittance</a></li>
                            </ul>
                            </li>
                            <li>
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Payroll Reports <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
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
                            <a href="#"><i class="fa fa-folder-open fa-fw"></i>Statutory Reports <i class="fa fa-caret-down"></i></a>
                            <ul class="nav">

                            <li>
                            <a href="{{ URL::to('payrollReports/selectNssfPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> NSSF Returns</a>
                            </li>

                            <li>
                                <a href="{{ URL::to('payrollReports/selectNhifPeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> NHIF Returns</a>
                            </li>

                            <li>
                                <a href="{{ URL::to('payrollReports/selectPayePeriod') }}"><i class="glyphicon glyphicon-file fa-fw"></i> Paye Returns</a>
                            </li>

                            <li>
                              <a href="{{ URL::to('payrollReports/selectYear') }}"><i class="glyphicon glyphicon-file fa-fw"></i>P9 Form</a>
                            </li>

                            <li>
                               <a href="{{ URL::to('itax/download') }}"><i class="glyphicon glyphicon-file fa-fw"></i>Download Itax Template</a>
                            </li>
                            </ul>
                            </li>
                                </ul>
                            </li>
                            </ul>
                            </li>
           

                       <li>
                        <a href="#"><i class="fa fa-cogs fa-fw"></i>Preferences <i class="fa fa-caret-down"></i></a>
                        <ul class="nav">
                          <li>
                           <a href="#"><i class="fa fa-cogs fa-fw"></i>System Settings <i class="fa fa-caret-down"></i></a>
                            <ul class="nav"> 
                            <li><a href="{{ URL::to('organizations') }}"><i class="fa fa-building fa-fw"></i>Organization Settings</a></li>
                            <li><a href="{{ URL::to('users') }}"><i class="fa fa-user fa-fw"></i> System Users</a></li>
                            <li><a href="{{ URL::to('roles') }}"><i class="fa fa-bookmark fa-fw"></i> System Roles</a></li> 
                            <li><a href="{{ URL::to('audits') }}"><i class="fa fa-list fa-fw"></i> Audit Trail</a></li>
                            </ul>
                           </li>
                            <li>
                            <a href="#"><i class="fa fa-cogs fa-fw"></i>HR Settings <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
                            <li><a href="{{ URL::to('branches') }}"><i class="fa fa-chevron-right fa-fw"></i>Branches</a></li>
                            <li><a href="{{ URL::to('departments') }}"><i class="fa fa-chevron-right fa-fw"></i>Departments</a></li>
                            <li><a href="{{ URL::to('banks') }}"><i class="fa fa-chevron-right fa-fw"></i>Banks</a></li>
                            <li><a href="{{ URL::to('bank_branch') }}"><i class="fa fa-chevron-right fa-fw"></i>Bank Branches</a></li>
                             <!-- <li><a href="{{ URL::to('benefitsettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Benefit Settings</a></li> -->
                            <li><a href="{{ URL::to('employee_type') }}"><i class="fa fa-chevron-right fa-fw"></i>Employee Types</a></li>
                            <li><a href="{{ URL::to('job_group') }}"><i class="fa fa-chevron-right fa-fw"></i>Job Groups</a></li>
                            <li><a href="{{ URL::to('occurencesettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Occurrence Settings</a></li>
                            <li><a href="{{ URL::to('citizenships') }}"><i class="fa fa-chevron-right fa-fw"></i>Citizenship</a></li>
                            <li><a href="{{ URL::to('education') }}"><i class="fa fa-chevron-right fa-fw"></i>Education</a></li>
                            <li><a href="{{ URL::to('appraisalcategories') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Category</a></li>
                            <li><a href="{{ URL::to('AppraisalSettings') }}"><i class="fa fa-chevron-right fa-fw"></i>Appraisal Setting</a></li>
                            <li><a href="{{ URL::to('leavetypes') }}"><i class="fa fa-chevron-right fa-fw"></i>Leave Types</a></li>
                            <li><a href="{{ URL::to('holidays') }}"><i class="fa fa-chevron-right fa-fw"></i>Holiday Management</a></li>
                            </ul>
                           </li>

                           <li>
                            <a href="#"><i class="fa fa-cogs fa-fw"></i>Payroll Settings <i class="fa fa-caret-down"></i></a>
                             <ul class="nav">
                                <li><a href="{{ URL::to('accounts') }}"><i class="fa fa-calculator fa-fw"></i>Accounts Settings</a></li> 
                            
                            <li>
                            <a href="{{ URL::to('allowances') }}"><i class="fa fa-list fa-fw"></i> Allowances</a>
                            </li>

                            <li>
                            <a href="{{ URL::to('earningsettings') }}"><i class="fa fa-list fa-fw"></i> Earning</a>
                            </li>
                    
                            <li>
                           <a href="{{ URL::to('nontaxables') }}"><i class="fa fa-list fa-fw"></i> Non Taxable Income</a>
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
    <i class="fa fa-sign-out fa-fw"></i>Logout
</a>

<form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>
</li>

   
