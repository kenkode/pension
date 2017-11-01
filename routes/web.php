<?php

use App\Audit;
use App\Organization;
use App\User;
use Illuminate\Support\Facades\Auth;
use App\Employee;
use App\Allowance;
use App\Deduction;
use App\Relief;
use App\Bank;
use App\Leaveapplication;
use App\Department;
use App\Branch;
use App\Notification;
use App\Jobgroup;
use App\Appraisalquestion;
use App\Currency;
use App\Leavetype;
use App\Account;
use App\BBranch;
use App\EType;
use App\Earnings;
use App\Earningsetting;
use App\EAllowances;
use App\ERelief;
use App\EDeduction;
use App\Pension;
use Illuminate\Support\Facades\PHPExcel;
use Maatwebsite\Excel\Facades\Excel as Excel;
use Illuminate\Support\Facades\Input;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;

Route::get('/', function () {
	if (Auth::user()) {

        return Redirect::to("/home");

    } else {
        return view('landing');
    }
});

Auth::routes();
Route::get('/home', 'HomeController@index');

Route::group( ['middleware' => 'auth' ], function()
{

	Route::resource('users', 'UserController');
	Route::resource('payroll', 'Payroll');
	Route::get('deduction-users', 'PensionsController@deductions');
	Route::get('employees', 'UserController@employees');
	Route::get('detailed-employee/{id}', 'UserController@detailed_employee');
	Route::resource('pensions', 'PensionsController');
  Route::post('pensions/update/{id}', 'PensionsController@update');
  Route::get('pensions/delete/{id}', 'PensionsController@destroy');
  Route::get('pensions/edit/{id}', 'PensionsController@edit');
  Route::get('pensions/view/{id}', 'PensionsController@show');
	Route::resource('statement', 'StatementController');
	//Route::resource('education', 'EducationController');
	Route::resource('calendar', 'CalendarController');
	Route::resource('documents', 'DocumentsController');
	Route::resource('emails', 'MailController');
	Route::get('aui-scheme','SchemeController@auischeme_documents');
	Route::resource('schemes', 'SchemeController');
	Route::get('/user-import/{id}','DeductionsController@user_import');
	Route::post('/import','DeductionsController@import');
	Route::get('register-employee', function () {
	    return view('employees.create');
	});

	Route::post('reg-employee','UserController@reg_employee');

	Route::get('employee-documents', function () {
	    return view('documents.create');
	});

});

Route::post('/uploadfile','Controller@showUploadFile');




Route::get('/dashboard', function()
{
  if (Auth::user()) {


       return Redirect::to("/home");

      
        } else {
            return view('landing');
        }
});
//

Route::get('fpassword', function(){

  return view(Config::get('Auth::forgot_password_form'));

});
// Auth routes
Route::resource('users', 'UsersController');
Route::get('users/create', 'UsersController@create');
Route::get('users/edit/{user}', 'UsersController@edit');
Route::get('users/edituser/{user}', 'UsersController@edituser');
Route::post('users/update/{user}', 'UsersController@update');
Route::post('users/updateuser/{user}', 'UsersController@updateuser');
Route::post('users', 'UsersController@store');
Route::get('users/add', 'UsersController@add');
Route::post('users/newuser', 'UsersController@newuser');
Route::get('users/login', 'UsersController@login');
Route::post('users/login', 'UsersController@doLogin');
Route::get('users/confirm/{code}', 'UsersController@confirm');
Route::get('users/forgot_password', 'UsersController@forgotPassword');
Route::post('users/forgot_password', 'UsersController@doForgotPassword');
Route::get('users/reset_password/{token}', 'UsersController@resetPassword');
Route::post('users/reset_password', 'UsersController@doResetPassword');
Route::get('users/logout', 'UsersController@logout');
Route::get('users/activate/{user}', 'UsersController@activate');
Route::get('users/deactivate/{user}', 'UsersController@deactivate');
Route::get('users/destroy/{user}', 'UsersController@destroy');
Route::get('users/password/{user}', 'UsersController@Password');
Route::post('users/password/{user}', 'UsersController@changePassword2');
Route::get('users/profile/{user}', 'UsersController@profile');
Route::get('users/show/{user}', 'UsersController@show');



Route::post('users/pass', 'UsersController@changePassword2');

Route::group( ['middleware' => 'auth' ], function()
{

Route::resource('roles', 'RolesController');
Route::get('roles/create', 'RolesController@create');
Route::get('roles/edit/{id}', 'RolesController@edit');
Route::get('roles/show/{id}', 'RolesController@show');
Route::post('roles/update/{id}', 'RolesController@update');
Route::get('roles/delete/{id}', 'RolesController@destroy');



Route::get('import', function(){

    return view('import');
});


Route::group(['before' => 'manage_system'], function() {

Route::get('system', function(){


    $organization = Organization::find(1);

    return view('system.index', compact('organization'));
});

});



Route::get('license', function(){


    $organization = Organization::find(1);

    return view('system.license', compact('organization'));
});

/**
* Organization routes
*/

Route::group(['before' => 'manage_organization'], function() {

Route::resource('organizations', 'OrganizationsController');

Route::post('organizations/update/{id}', 'OrganizationsController@update');
Route::post('organizations/logo/{id}', 'OrganizationsController@logo');

});

Route::get('language/{lang}', 
           array(
                  'as' => 'language.select', 
                  'uses' => 'OrganizationsController@language'
                 )
          );




Route::resource('currencies', 'CurrenciesController');
Route::get('currencies/edit/{id}', 'CurrenciesController@edit');
Route::post('currencies/update/{id}', 'CurrenciesController@update');
Route::get('currencies/delete/{id}', 'CurrenciesController@destroy');
Route::get('currencies/create', 'CurrenciesController@create');



/*
* branches routes
*/

Route::group(['before' => 'manage_branches'], function() {

Route::resource('branches', 'BranchesController');
Route::post('branches/update/{id}', 'BranchesController@update');
Route::get('branches/delete/{id}', 'BranchesController@destroy');
Route::get('branches/edit/{id}', 'BranchesController@edit');
});


/*
* accounts routes
*/

Route::group(['before' => 'process_payroll'], function() {

Route::resource('accounts', 'AccountsController');
Route::post('accounts/update/{id}', 'AccountsController@update');
Route::get('accounts/delete/{id}', 'AccountsController@destroy');
Route::get('accounts/edit/{id}', 'AccountsController@edit');
Route::get('accounts/show/{id}', 'AccountsController@show');
Route::get('accounts/create/{id}', 'AccountsController@create');

});

/*
* journals routes
*/
Route::resource('journals', 'JournalsController');
Route::post('journals/update/{id}', 'JournalsController@update');
Route::get('journals/delete/{id}', 'JournalsController@destroy');
Route::get('journals/edit/{id}', 'JournalsController@edit');
Route::get('journals/show/{id}', 'JournalsController@show');

/*
* license routes
*/

Route::post('license/key', 'OrganizationsController@generate_license_key');
Route::post('license/activate', 'OrganizationsController@activate_license');
Route::get('license/activate/{id}', 'OrganizationsController@activate_license_form');

/*
* Audits routes
*/
Route::group(['before' => 'manage_audits'], function() {

Route::resource('audits', 'AuditsController');

});


/*
* #####################################################################################################################
*/
Route::group(['before' => 'manage_holiday'], function() {

Route::resource('holidays', 'HolidaysController');
Route::get('holidays/edit/{id}', 'HolidaysController@edit');
Route::get('holidays/delete/{id}', 'HolidaysController@destroy');
Route::post('holidays/update/{id}', 'HolidaysController@update');

});

Route::group(['before' => 'manage_leavetype'], function() {

Route::resource('leavetypes', 'LeavetypesController');
Route::get('leavetypes/edit/{id}', 'LeavetypesController@edit');
Route::get('leavetypes/delete/{id}', 'LeavetypesController@destroy');
Route::post('leavetypes/update/{id}', 'LeavetypesController@update');

});


Route::resource('leaveapplications', 'LeaveapplicationsController');
Route::get('leaveapplications/edit/{id}', 'LeaveapplicationsController@edit');
Route::get('leaveapplications/delete/{id}', 'LeaveapplicationsController@destroy');
Route::post('leaveapplications/update/{id}', 'LeaveapplicationsController@update');
Route::get('leaveapplications/approve/{id}', 'LeaveapplicationsController@approve');
Route::post('leaveapplications/approve/{id}', 'LeaveapplicationsController@doapprove');
Route::get('leaveapplications/cancel/{id}', 'LeaveapplicationsController@cancel');
Route::get('leaveapplications/reject/{id}', 'LeaveapplicationsController@reject');
Route::get('leaveapplications/show/{id}', 'LeaveapplicationsController@show');

Route::get('leaveapplications/approvals', 'LeaveapplicationsController@approvals');
Route::get('leaveapplications/rejects', 'LeaveapplicationsController@rejects');
Route::get('leaveapplications/cancellations', 'LeaveapplicationsController@cancellations');
Route::get('leaveapplications/amends', 'LeaveapplicationsController@amended');
Route::post('createLeave', 'LeaveapplicationsController@createleave');


Route::get('leaveapprovals', function(){

  $leaveapplications = Leaveapplication::all();
if ( !Entrust::can('view_approved_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
  Audit::logaudit('Vacation', 'view', 'viewed approved vacations');
  return view('leaveapplications.approved', compact('leaveapplications'));
}

} );

Route::group(['before' => 'amend_application'], function() {

Route::get('leaveamends', function(){

  $leaveapplications = Leaveapplication::all();
  if ( !Entrust::can('view_amended_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
  Audit::logaudit('Vacation', 'view', 'viewed amended vacations');
  return view('leaveapplications.amended', compact('leaveapplications'));
}

} );

});

Route::group(['before' => 'reject_application'], function() {

Route::get('leaverejects', function(){

  $leaveapplications = Leaveapplication::all();
  if ( !Entrust::can('view_rejected_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
  Audit::logaudit('Vacation', 'view', 'viewed rejected vacations');
  return view('leaveapplications.rejected', compact('leaveapplications'));
}
} );

});


Route::get('migrate', function(){
if ( !Entrust::can('data_migration') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
    return view('migration');
  }

});



/*
*pension template
*
*/

Route::get('template/pensions', function(){

  $employees = Employee::where('in_employment','Y')->get();

  Audit::logaudit('Pension', 'download', 'downloaded pension template');

  Excel::create('Pensions', function($excel) use($employees) {

    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

    

    $excel->sheet('pensions', function($sheet) use($employees){


              $sheet->row(1, array(
     'EMPLOYEE', 'FORMULAR', 'EMPLOYEE PERCENTAGE', 'EMPLOYEE CONTRIBUTION', 'EMPLOYER PERCENTAGE', 'EMPLOYER CONTRIBUTION', 'INTEREST', 'COMMENT', 'MONTH', 'YEAR'
));

             
                $empdata = array();

                foreach($employees as $d){

                  $empdata[] = $d->personal_file_number.':'.$d->first_name.' '.$d->last_name.' '.$d->middle_name;
                }

                $emplist = implode(", ", $empdata);

                

                
    for($i=2; $i <= 250; $i++){
                $objValidation = $sheet->getCell('A'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('"'.$emplist.'"'); //note this!

                $objValidation = $sheet->getCell('B'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('"Flat Value, Percentage"'); //note this!

    }

                

                
        

    });

  })->export('xls');



});




/*
* #####################################################################################################################
*/
/*
* banks routes
*/

Route::resource('banks', 'BanksController');
Route::post('banks/update/{id}', 'BanksController@update');
Route::get('banks/delete/{id}', 'BanksController@destroy');
Route::get('banks/edit/{id}', 'BanksController@edit');

/*
* departments routes
*/

Route::resource('departments', 'DepartmentsController');
Route::post('departments/update/{id}', 'DepartmentsController@update');
Route::get('departments/delete/{id}', 'DepartmentsController@destroy');
Route::get('departments/edit/{id}', 'DepartmentsController@edit');


/*
* bank branch routes
*/

Route::resource('bank_branch', 'BankBranchController');
Route::post('bank_branch/update/{id}', 'BankBranchController@update');
Route::get('bank_branch/delete/{id}', 'BankBranchController@destroy');
Route::get('bank_branch/edit/{id}', 'BankBranchController@edit');

/*
* allowances routes
*/

Route::resource('allowances', 'AllowancesController');
Route::post('allowances/update/{id}', 'AllowancesController@update');
Route::get('allowances/delete/{id}', 'AllowancesController@destroy');
Route::get('allowances/edit/{id}', 'AllowancesController@edit');

/*
* reliefs routes
*/

Route::resource('reliefs', 'ReliefsController');
Route::post('reliefs/update/{id}', 'ReliefsController@update');
Route::get('reliefs/delete/{id}', 'ReliefsController@destroy');
Route::get('reliefs/edit/{id}', 'ReliefsController@edit');

/*
* deductions routes
*/

Route::resource('deductions', 'PayrollDeductionsController');
Route::post('deductions/update/{id}', 'PayrollDeductionsController@update');
Route::get('deductions/delete/{id}', 'PayrollDeductionsController@destroy');
Route::get('deductions/edit/{id}', 'PayrollDeductionsController@edit');

/*
* nssf routes
*/

Route::resource('nssf', 'NssfController');
Route::post('nssf/update/{id}', 'NssfController@update');
Route::get('nssf/delete/{id}', 'NssfController@destroy');
Route::get('nssf/edit/{id}', 'NssfController@edit');

/*
* nhif routes
*/

Route::resource('nhif', 'NhifController');
Route::post('nhif/update/{id}', 'NhifController@update');
Route::get('nhif/delete/{id}', 'NhifController@destroy');
Route::get('nhif/edit/{id}', 'NhifController@edit');

/*
* job group routes
*/

Route::resource('job_group', 'JobGroupController');
Route::post('job_group/update/{id}', 'JobGroupController@update');
Route::get('job_group/delete/{id}', 'JobGroupController@destroy');
Route::get('job_group/edit/{id}', 'JobGroupController@edit');

/*
* employee type routes
*/

Route::resource('employee_type', 'EmployeeTypeController');
Route::post('employee_type/update/{id}', 'EmployeeTypeController@update');
Route::get('employee_type/delete/{id}', 'EmployeeTypeController@destroy');
Route::get('employee_type/edit/{id}', 'EmployeeTypeController@edit');

/*
* education type routes
*/

Route::resource('education', 'EducationController');
Route::post('education/update/{id}', 'EducationController@update');
Route::get('education/delete/{id}', 'EducationController@destroy');
Route::get('education/edit/{id}', 'EducationController@edit');

/*
* employees routes
*/

Route::resource('employees', 'EmployeesController');
Route::post('employees/update/{id}', 'EmployeesController@update');
Route::get('employees/delete/{id}', 'EmployeesController@destroy');
Route::get('employees/edit/{id}', 'EmployeesController@edit');

/*
* employee earnings routes
*/

Route::resource('other_earnings', 'EarningsController');
Route::post('other_earnings/update/{id}', 'EarningsController@update');
Route::get('other_earnings/delete/{id}', 'EarningsController@destroy');
Route::get('other_earnings/edit/{id}', 'EarningsController@edit');

/*
* employee reliefs routes
*/

Route::resource('employee_relief', 'EmployeeReliefController');
Route::post('employee_relief/update/{id}', 'EmployeeReliefController@update');
Route::get('employee_relief/delete/{id}', 'EmployeeReliefController@destroy');
Route::get('employee_relief/edit/{id}', 'EmployeeReliefController@edit');

/*
* employee allowances routes
*/

Route::resource('employee_allowances', 'EmployeeAllowancesController');
Route::post('employee_allowances/update/{id}', 'EmployeeAllowancesController@update');
Route::get('employee_allowances/delete/{id}', 'EmployeeAllowancesController@destroy');
Route::get('employee_allowances/edit/{id}', 'EmployeeAllowancesController@edit');

/*
* employee deductions routes
*/

Route::resource('employee_deductions', 'EmployeeDeductionsController');
Route::post('employee_deductions/update/{id}', 'EmployeeDeductionsController@update');
Route::get('employee_deductions/delete/{id}', 'EmployeeDeductionsController@destroy');
Route::get('employee_deductions/edit/{id}', 'EmployeeDeductionsController@edit');

/*
* payroll routes
*/


Route::resource('payroll', 'PayrollController');
Route::post('deleterow', 'PayrollController@del_exist');
Route::post('payroll/preview', 'PayrollController@create');


Route::post('payroll/edit{id}', 'PayrollController@edit');


/*
* employees routes
*/
Route::resource('employees', 'EmployeesController');
Route::get('employees/show/{id}', 'EmployeesController@show');
Route::group(['before' => 'create_employee'], function() {
Route::get('employees/create', 'EmployeesController@create');
});
Route::get('employees/edit/{id}', 'EmployeesController@edit');
Route::post('employees/update/{id}', 'EmployeesController@update');
Route::get('employees/delete/{id}', 'EmployeesController@destroy');





Route::get('payrollReports', function(){

    return view('employees.payrollreports');
});

Route::get('statutoryReports', function(){

    return view('employees.statutoryreports');
});

Route::get('email/payslip', 'payslipEmailController@index');
Route::post('email/payslip/employees', 'payslipEmailController@sendEmail');

Route::get('reports/selectEmployeeStatus', 'ReportsController@selstate');
Route::post('reports/employeelist', 'ReportsController@employees');
Route::get('employee/select', 'ReportsController@emp_id');
Route::post('reports/employee', 'ReportsController@individual');
Route::get('payrollReports/selectPeriod', 'ReportsController@period_payslip');
Route::post('payrollReports/payslip', 'ReportsController@payslip');
Route::get('payrollReports/selectAllowance', 'ReportsController@employee_allowances');
Route::post('payrollReports/allowances', 'ReportsController@allowances');
Route::get('payrollReports/selectEarning', 'ReportsController@employee_earnings');
Route::post('payrollReports/earnings', 'ReportsController@earnings');
Route::get('payrollReports/selectOvertime', 'ReportsController@employee_overtimes');
Route::post('payrollReports/overtimes', 'ReportsController@overtimes');
Route::get('payrollReports/selectRelief', 'ReportsController@employee_reliefs');
Route::post('payrollReports/reliefs', 'ReportsController@reliefs');
Route::get('payrollReports/selectDeduction', 'ReportsController@employee_deductions');
Route::post('payrollReports/deductions', 'ReportsController@deductions');
Route::get('payrollReports/selectnontaxableincome', 'ReportsController@employeenontaxableselect');
Route::post('payrollReports/nontaxables', 'ReportsController@employeenontaxables');
Route::get('payrollReports/selectPayePeriod', 'ReportsController@period_paye');
Route::post('payrollReports/payeReturns', 'ReportsController@payeReturns');
Route::get('payrollReports/selectRemittancePeriod', 'ReportsController@period_rem');
Route::get('payrollReports/selectRemittance/{period}', 'ReportsController@process_rem');
Route::post('payrollReports/payRemittances', 'ReportsController@payeRems');
Route::get('payrollReports/selectSummaryPeriod', 'ReportsController@period_summary');
Route::get('payrollReports/selectSummary/{period}', 'ReportsController@process_summary');
Route::post('payrollReports/payrollSummary', 'ReportsController@paySummary');
Route::get('payrollReports/selectNssfPeriod', 'ReportsController@period_nssf');
Route::post('payrollReports/nssfReturns', 'ReportsController@nssfReturns');
Route::get('payrollReports/selectNhifPeriod', 'ReportsController@period_nhif');
Route::post('payrollReports/nhifReturns', 'ReportsController@nhifReturns');
Route::get('payrollReports/selectNssfExcelPeriod', 'ReportsController@period_excel');
Route::post('payrollReports/nssfExcel', 'ReportsController@export');
Route::get('reports/selectEmployeeOccurence', 'ReportsController@selEmp');
Route::post('reports/occurence', 'ReportsController@occurence');
Route::get('reports/CompanyProperty/selectPeriod', 'ReportsController@propertyperiod');
Route::post('reports/companyproperty', 'ReportsController@property');
Route::get('reports/Appraisals/selectPeriod', 'ReportsController@appraisalperiod');
Route::post('reports/appraisal', 'ReportsController@appraisal');
Route::get('reports/nextofkin/selectEmployee', 'ReportsController@selempkin');
Route::post('reports/EmployeeKin', 'ReportsController@kin');
Route::get('advanceReports/selectRemittancePeriod', 'ReportsController@period_advrem');
Route::post('advanceReports/advanceRemittances', 'ReportsController@payeAdvRems');
Route::get('advanceReports/selectSummaryPeriod', 'ReportsController@period_advsummary');
Route::post('advanceReports/advanceSummary', 'ReportsController@payAdvSummary');

Route::get('leaveReports/selectApplicationPeriod', 'ReportsController@appperiod');
Route::post('leaveReports/leaveapplications', 'ReportsController@leaveapplications');

Route::get('leaveReports/selectApprovedPeriod', 'ReportsController@approvedperiod');
Route::post('leaveReports/approvedleaves', 'ReportsController@approvedleaves');

Route::get('leaveReports/selectRejectedPeriod', 'ReportsController@rejectedperiod');
Route::post('leaveReports/rejectedleaves', 'ReportsController@rejectedleaves');

Route::get('leaveReports/selectLeave', 'ReportsController@balanceselect');
Route::post('leaveReports/leaveBalances', 'ReportsController@leavebalances');

Route::get('leaveReports/selectLeaveType', 'ReportsController@leaveselect');
Route::post('leaveReports/Employeesonleave', 'ReportsController@employeesleave');

Route::get('leaveReports/selectEmployee', 'ReportsController@employeeselect');
Route::post('leaveReports/IndividualEmployeeLeave', 'ReportsController@individualleave');


/*
*#################################################################
*/
Route::group(['before' => 'process_payroll'], function() {

    


Route::get('payrollmgmt', function(){

     $employees = Employee::all();

  return view('payrollmgmt', compact('employees'));

});

});

Route::group(['before' => 'leave_mgmt'], function() {

Route::get('leavemgmt', function(){

  $leaveapplications = Leaveapplication::all();
  if ( !Entrust::can('view_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
  Audit::logaudit('Vacation', 'view', 'viewed all vacations applied');
  return view('leavemgmt', compact('leaveapplications'));
}

});

});


Route::get('import', function(){

    return view('import');
});


Route::post('license/key', 'OrganizationsController@generate_license_key');
Route::post('license/activate', 'OrganizationsController@activate_license');
Route::get('license/activate/{id}', 'OrganizationsController@activate_license_form');

Route::get('portal', function(){

    $employees = DB::table('employee')->where('in_employment', '=', "Y")->get();
    if ( !Entrust::can('view_portal') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
    }else{
    Audit::logaudit('Employee Portal', 'view', 'viewed employee portal list');
    return view('css.members', compact('employees'));
  }
});


Route::get('portal/activate/{id}', 'EmployeesController@activateportal');
Route::get('portal/deactivate/{id}', 'EmployeesController@deactivateportal');
Route::get('css/reset/{id}', 'EmployeesController@reset');





Route::resource('mails', 'MailsController');
Route::get('mailtest', 'MailsController@test');


Route::get('seedmail', function(){

  $mail = new Mailsender;

  $mail->driver = 'smtp';
  $mail->save();
});

Route::get('mail', function(){
  $mail = Mailsender::find(1);  
  return view('system.mail', compact('mail'));

});


Route::group(['before' => 'loggedin'], function() {
Route::resource('banks', 'BanksController');
Route::post('banks/update/{id}', 'BanksController@update');
Route::get('banks/delete/{id}', 'BanksController@destroy');
Route::get('banks/edit/{id}', 'BanksController@edit');

/*
* departments routes
*/

Route::resource('departments', 'DepartmentsController');
Route::post('departments/update/{id}', 'DepartmentsController@update');
Route::get('departments/delete/{id}', 'DepartmentsController@destroy');
Route::get('departments/edit/{id}', 'DepartmentsController@edit');


/*
* bank branch routes
*/

Route::resource('bank_branch', 'BankBranchController');
Route::post('bank_branch/update/{id}', 'BankBranchController@update');
Route::get('bank_branch/delete/{id}', 'BankBranchController@destroy');
Route::get('bank_branch/edit/{id}', 'BankBranchController@edit');

/*
* allowances routes
*/

Route::resource('allowances', 'AllowancesController');
Route::post('allowances/update/{id}', 'AllowancesController@update');
Route::get('allowances/delete/{id}', 'AllowancesController@destroy');
Route::get('allowances/edit/{id}', 'AllowancesController@edit');

/*
* earningsettings routes
*/

Route::resource('earningsettings', 'EarningsettingsController');
Route::post('earningsettings/update/{id}', 'EarningsettingsController@update');
Route::get('earningsettings/delete/{id}', 'EarningsettingsController@destroy');
Route::get('earningsettings/edit/{id}', 'EarningsettingsController@edit');

/*
* benefits setting routes
*/

Route::resource('benefitsettings', 'BenefitSettingsController');
Route::post('benefitsettings/update/{id}', 'BenefitSettingsController@update');
Route::get('benefitsettings/delete/{id}', 'BenefitSettingsController@destroy');
Route::get('benefitsettings/edit/{id}', 'BenefitSettingsController@edit');

/*
* reliefs routes
*/

Route::resource('reliefs', 'ReliefsController');
Route::post('reliefs/update/{id}', 'ReliefsController@update');
Route::get('reliefs/delete/{id}', 'ReliefsController@destroy');
Route::get('reliefs/edit/{id}', 'ReliefsController@edit');

/*
* deductions routes
*/


/*
* nontaxables routes
*/

Route::resource('nontaxables', 'NonTaxablesController');
Route::post('nontaxables/update/{id}', 'NonTaxablesController@update');
Route::get('nontaxables/delete/{id}', 'NonTaxablesController@destroy');
Route::get('nontaxables/edit/{id}', 'NonTaxablesController@edit');

/*
* nssf routes
*/

Route::resource('nssf', 'NssfController');
Route::post('nssf/update/{id}', 'NssfController@update');
Route::get('nssf/delete/{id}', 'NssfController@destroy');
Route::get('nssf/edit/{id}', 'NssfController@edit');

/*
* nhif routes
*/

Route::resource('nhif', 'NhifController');
Route::post('nhif/update/{id}', 'NhifController@update');
Route::get('nhif/delete/{id}', 'NhifController@destroy');
Route::get('nhif/edit/{id}', 'NhifController@edit');

/*
* job group routes
*/

Route::resource('job_group', 'JobGroupController');
Route::post('job_group/update/{id}', 'JobGroupController@update');
Route::get('job_group/delete/{id}', 'JobGroupController@destroy');
Route::get('job_group/edit/{id}', 'JobGroupController@edit');
Route::get('job_group/show/{id}', 'JobGroupController@show');

/*
* employee type routes
*/

Route::resource('employee_type', 'EmployeeTypeController');
Route::post('employee_type/update/{id}', 'EmployeeTypeController@update');
Route::get('employee_type/delete/{id}', 'EmployeeTypeController@destroy');
Route::get('employee_type/edit/{id}', 'EmployeeTypeController@edit');

/*
* occurence settings routes
*/

Route::resource('occurencesettings', 'OccurencesettingsController');
Route::post('occurencesettings/update/{id}', 'OccurencesettingsController@update');
Route::get('occurencesettings/delete/{id}', 'OccurencesettingsController@destroy');
Route::get('occurencesettings/edit/{id}', 'OccurencesettingsController@edit');

/*
* citizenship routes
*/

Route::resource('citizenships', 'CitizenshipController');
Route::post('citizenships/update/{id}', 'CitizenshipController@update');
Route::get('citizenships/delete/{id}', 'CitizenshipController@destroy');
Route::get('citizenships/edit/{id}', 'CitizenshipController@edit');

/*
* employees routes
*/

Route::get('deactives', function(){

  $employees = Employee::getDeactiveEmployee();

  if ( !Entrust::can('view_deactive_employee') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
    }else{
  return view('employees.activate', compact('employees'));
}
} );
});
Route::group(['before' => 'loggedin'], function() {
  //dd(Auth::user());
Route::resource('employees', 'EmployeesController');
Route::post('employees/update/{id}', 'EmployeesController@update');
Route::get('employees/deactivate/{id}', 'EmployeesController@deactivate');
Route::get('employees/activate/{id}', 'EmployeesController@activate');
Route::get('employees/edit/{id}', 'EmployeesController@edit');
Route::get('employees/editdetails/{id}', 'EmployeesController@editdetails');
Route::get('employees/view/{id}', 'EmployeesController@view');
Route::get('employee/viewdetails/{id}', 'EmployeesController@viewdetails');
Route::get('employees/viewdeactive/{id}', 'EmployeesController@viewdeactive');

Route::post('createCitizenship', 'EmployeesController@createcitizenship');
Route::post('createEducation', 'EmployeesController@createeducation');
Route::post('createBank', 'EmployeesController@createbank');
Route::post('createBankBranch', 'EmployeesController@createbankbranch');
Route::post('createBranch', 'EmployeesController@createbranch');
Route::post('createDepartment', 'EmployeesController@createdepartment');
Route::post('createType', 'EmployeesController@createtype');
Route::post('createGroup', 'EmployeesController@creategroup');
Route::post('createEmployee', 'EmployeesController@serializeDoc');
Route::get('employeeIndex', 'EmployeesController@getIndex');

Route::get('EmployeeForm', function(){

  $organization = Organization::find(Auth::user()->organization_id);

  $pdf = PDF::loadView('pdf.employee_form', compact('organization'))->setPaper('a4');
    
  return $pdf->stream('Employee_Form.pdf');

});
});


Route::get('hrdashboard', array('before' => 'loggedin', function(){
  $employees = Employee::getActiveEmployee();
  return view('hrdashboard',compact('employees'));

}));

Route::get('payrolldashboard', array('before' => 'loggedin', function(){
  
  return view('payrolldashboard');

}));

/*
* occurences routes
*/
Route::group(['before' => 'loggedin'], function() {
Route::resource('occurences', 'OccurencesController');
Route::post('occurences/update/{id}', 'OccurencesController@update');
Route::get('occurences/delete/{id}', 'OccurencesController@destroy');
Route::get('occurences/edit/{id}', 'OccurencesController@edit');
Route::get('occurences/view/{id}', 'OccurencesController@view');
Route::get('occurences/download/{id}', 'OccurencesController@getDownload');
Route::post('createOccurence', 'OccurencesController@createoccurence');
/*
* employee earnings routes
*/

Route::resource('other_earnings', 'EarningsController');
Route::post('other_earnings/update/{id}', 'EarningsController@update');
Route::get('other_earnings/delete/{id}', 'EarningsController@destroy');
Route::get('other_earnings/edit/{id}', 'EarningsController@edit');
Route::get('other_earnings/view/{id}', 'EarningsController@view');
Route::post('createEarning', 'EarningsController@createearning');

/*
* employee reliefs routes
*/

Route::resource('employee_relief', 'EmployeeReliefController');
Route::post('employee_relief/update/{id}', 'EmployeeReliefController@update');
Route::get('employee_relief/delete/{id}', 'EmployeeReliefController@destroy');
Route::get('employee_relief/edit/{id}', 'EmployeeReliefController@edit');
Route::get('employee_relief/view/{id}', 'EmployeeReliefController@view');
Route::post('createRelief', 'EmployeeReliefController@createrelief');

/*
* employee allowances routes
*/

Route::resource('employee_allowances', 'EmployeeAllowancesController');
Route::post('employee_allowances/update/{id}', 'EmployeeAllowancesController@update');
Route::get('employee_allowances/delete/{id}', 'EmployeeAllowancesController@destroy');
Route::get('employee_allowances/edit/{id}', 'EmployeeAllowancesController@edit');
Route::get('employee_allowances/view/{id}', 'EmployeeAllowancesController@view');
Route::post('createAllowance', 'EmployeeAllowancesController@createallowance');
Route::post('reloaddata', 'EmployeeAllowancesController@display');

/*
* employee nontaxables routes
*/

Route::resource('employeenontaxables', 'EmployeeNonTaxableController');
Route::post('employeenontaxables/update/{id}', 'EmployeeNonTaxableController@update');
Route::get('employeenontaxables/delete/{id}', 'EmployeeNonTaxableController@destroy');
Route::get('employeenontaxables/edit/{id}', 'EmployeeNonTaxableController@edit');
Route::get('employeenontaxables/view/{id}', 'EmployeeNonTaxableController@view');
Route::post('createNontaxable', 'EmployeeNonTaxableController@createnontaxable');

/*
* employee deductions routes
*/

Route::resource('employee_deductions', 'EmployeeDeductionsController');
Route::post('employee_deductions/update/{id}', 'EmployeeDeductionsController@update');
Route::get('employee_deductions/delete/{id}', 'EmployeeDeductionsController@destroy');
Route::get('employee_deductions/edit/{id}', 'EmployeeDeductionsController@edit');
Route::get('employee_deductions/view/{id}', 'EmployeeDeductionsController@view');
Route::post('createDeduction', 'EmployeeDeductionsController@creatededuction');
/*
* payroll routes
*/


Route::resource('payroll', 'PayrollController');
Route::post('deleterow', 'PayrollController@del_exist');
Route::post('showrecord', 'PayrollController@display');
Route::post('shownet', 'PayrollController@disp');
Route::post('showgross', 'PayrollController@dispgross');
Route::post('payroll/preview', 'PayrollController@create');
Route::get('payrollpreviewprint/{period}', 'PayrollController@previewprint');
Route::post('createNewAccount', 'PayrollController@createaccount');

Route::get('payrollcalculator', function(){
  $currency = Currency::find(1);
  return view('payroll.payroll_calculator',compact('currency'));

});

/*
* advance routes
*/


Route::resource('advance', 'AdvanceController');
Route::post('deleteadvance', 'AdvanceController@del_exist');
Route::post('advance/preview', 'AdvanceController@create');
Route::post('createAccount', 'AdvanceController@createaccount');
});
/*
* employees routes
*/
Route::group(['before' => 'loggedin'], function() {
Route::resource('employees', 'EmployeesController');
Route::get('employees/show/{id}', 'EmployeesController@show');
Route::group(['before' => 'create_employee'], function() {
Route::get('employees/create', 'EmployeesController@create');
});
Route::get('employees/edit/{id}', 'EmployeesController@edit');
Route::post('employees/update/{id}', 'EmployeesController@update');
Route::get('employees/delete/{id}', 'EmployeesController@destroy');
});

Route::group(['before' => 'loggedin'], function() {
Route::get('advanceReports', function(){

    return view('employees.advancereports');
});


Route::get('payrollReports', function(){

    return view('employees.payrollreports');
});

Route::get('statutoryReports', function(){

    return view('employees.statutoryreports');
});

Route::get('payrollReports/selectYear', function(){
    $branches = Branch::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
    $departments = Department::whereNull('organization_id')->orWhere('organization_id',Auth::user()->organization_id)->get();
    $employees = Employee::where('organization_id',Auth::user()->organization_id)->get();

    if ( !Entrust::can('view_paye_report') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
    return view('pdf.p9Select',compact('employees','branches','departments'));
  }
});

Route::get('email/payslip', 'payslipEmailController@index');
Route::post('email/payslip/employees', 'payslipEmailController@sendEmail');



Route::get('reports/employees', array('before' => 'loggedin', function(){
    
    return view('reports');
}));

Route::get('itax/download', 'ReportsController@getDownload');


Route::get('reports/negativeleaves', 'ReportsController@negativeleaves');

Route::get('reports/selectEmployeeStatus', 'ReportsController@selstate');
Route::post('reports/employeelist', 'ReportsController@employees');
Route::get('employee/select', 'ReportsController@emp_id');
Route::post('reports/employee', 'ReportsController@individual');
Route::get('reports/compliance/selectEmployee', 'ReportsController@selEmpDisc');
Route::post('reports/compliance', 'ReportsController@discipline');
Route::get('reports/promotion/selectEmployee', 'ReportsController@selPromEmp');
Route::post('reports/promotion', 'ReportsController@promotion');
Route::get('payrollReports/selectPeriod', 'ReportsController@period_payslip');
Route::post('payrollReports/payslip', 'ReportsController@payslip');
Route::get('payrollReports/selectAllowance', 'ReportsController@employee_allowances');
Route::post('payrollReports/allowances', 'ReportsController@allowances');
Route::get('payrollReports/selectEarning', 'ReportsController@employee_earnings');
Route::post('payrollReports/earnings', 'ReportsController@earnings');
Route::get('payrollReports/selectOvertime', 'ReportsController@employee_overtimes');
Route::post('payrollReports/overtimes', 'ReportsController@overtimes');
Route::get('payrollReports/selectRelief', 'ReportsController@employee_reliefs');
Route::post('payrollReports/reliefs', 'ReportsController@reliefs');
Route::get('payrollReports/selectDeduction', 'ReportsController@employee_deductions');
Route::post('payrollReports/deductions', 'ReportsController@deductions');
Route::get('payrollReports/selectnontaxableincome', 'ReportsController@employeenontaxableselect');
Route::post('payrollReports/nontaxables', 'ReportsController@employeenontaxables');
Route::get('payrollReports/selectPayePeriod', 'ReportsController@period_paye');
Route::post('payrollReports/payeReturns', 'ReportsController@payeReturns');
Route::post('payrollReports/p9form', 'ReportsController@p9form');
Route::get('payrollReports/selectRemittancePeriod', 'ReportsController@period_rem');
Route::post('payrollReports/payRemittances', 'ReportsController@payeRems');
Route::get('payrollReports/selectSummaryPeriod', 'ReportsController@period_summary');
Route::post('payrollReports/payrollSummary', 'ReportsController@paySummary');
Route::get('payrollReports/selectNssfPeriod', 'ReportsController@period_nssf');
Route::post('payrollReports/nssfReturns', 'ReportsController@nssfReturns');
Route::get('payrollReports/selectNhifPeriod', 'ReportsController@period_nhif');
Route::post('payrollReports/nhifReturns', 'ReportsController@nhifReturns');
Route::get('payrollReports/selectNssfExcelPeriod', 'ReportsController@period_excel');
Route::post('payrollReports/nssfExcel', 'ReportsController@export');
Route::get('reports/selectEmployeeOccurence', 'ReportsController@selEmp');
Route::post('reports/occurence', 'ReportsController@occurence');
Route::get('reports/CompanyProperty/selectPeriod', 'ReportsController@propertyperiod');
Route::post('reports/companyproperty', 'ReportsController@property');
Route::get('reports/Appraisals/selectPeriod', 'ReportsController@appraisalperiod');
Route::post('reports/appraisal', 'ReportsController@appraisal');
Route::get('reports/nextofkin/selectEmployee', 'ReportsController@selempkin');
Route::post('reports/EmployeeKin', 'ReportsController@nextkin');
Route::get('advanceReports/selectRemittancePeriod', 'ReportsController@period_advrem');
Route::post('advanceReports/advanceRemittances', 'ReportsController@payeAdvRems');
Route::get('advanceReports/selectSummaryPeriod', 'ReportsController@period_advsummary');
Route::post('advanceReports/advanceSummary', 'ReportsController@payAdvSummary');


});
/*
*#################################################################
*/
Route::group(['before' => 'process_payroll'], function() {

    


Route::get('payrollmgmt', function(){

     $employees = Employee::getActiveEmployee();

  return view('payrollmgmt', compact('employees'));

});

});

Route::get('leavemgmt', function(){
 
  $leaveapplications = Leaveapplication::where('organization_id',Auth::user()->organization_id)->get();

  if ( !Entrust::can('view_application') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Vacation Application', 'view', 'viewed all vacations applied');
  return view('leavemgmt', compact('leaveapplications'));
}

});


Route::get('automatedreports', 'ReportsController@automated');

Route::group(['before' => 'loggedin'], function() {
Route::resource('currencies', 'CurrenciesController');
Route::get('currencies/edit/{id}', 'CurrenciesController@edit');
Route::post('currencies/update/{id}', 'CurrenciesController@update');
Route::get('currencies/delete/{id}', 'CurrenciesController@destroy');
Route::get('currencies/create', 'CurrenciesController@create');

Route::resource('compliance', 'DisciplineController');
Route::get('compliance/edit/{id}', 'DisciplineController@edit');
Route::post('compliance/update/{id}', 'DisciplineController@update');
Route::get('compliance/delete/{id}', 'DisciplineController@destroy');
Route::get('compliance/create', 'DisciplineController@create');
Route::get('compliance/show/{id}', 'DisciplineController@show');

Route::resource('promotions', 'PromotionsController');
Route::get('promotions/edit/{id}', 'PromotionsController@edit');
Route::post('promotions/update/{id}', 'PromotionsController@update');
Route::get('promotions/delete/{id}', 'PromotionsController@destroy');
Route::get('promotions/create', 'PromotionsController@create');
Route::get('promotions/show/{id}', 'PromotionsController@show');
});

Route::resource('overtimes', 'OvertimesController');
Route::get('overtimes/edit/{id}', 'OvertimesController@edit');
Route::post('overtimes/update/{id}', 'OvertimesController@update');
Route::get('overtimes/delete/{id}', 'OvertimesController@destroy');
Route::get('overtimes/view/{id}', 'OvertimesController@view');

/*
* employee documents routes
*/

Route::get('css/payslips', function(){

  $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', Auth::user()->name)->pluck('id')[0];

  $employee = Employee::findorfail($employeeid);

  return view('css.payslip', compact('employee'));
});


Route::get('css/leave', function(){

  $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', Auth::user()->name)->pluck('id')[0];


  $employee = Employee::findorfail($employeeid);

   $leaveapplications = DB::table('leaveapplications')->where('organization_id',Auth::user()->organization_id)->where('employee_id', '=', $employee->id)->get();

  return view('css.leave', compact('employee', 'leaveapplications'));
});


Route::get('css/leaveapply', function(){

  $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', Auth::user()->name)->pluck('id')[0];

  $employee = Employee::findorfail($employeeid);
  $leavetypes = Leavetype::where('organization_id',Auth::user()->organization_id)->get();

  return view('css.leaveapply', compact('employee', 'leavetypes'));
});


Route::get('css/balances', function(){

  $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', Auth::user()->name)->pluck('id')[0];

  $employee = Employee::findorfail($employeeid);
  $leavetypes = Leavetype::where('organization_id',Auth::user()->organization_id)->get();

  return view('css.balances', compact('employee', 'leavetypes'));
});


Route::resource('documents', 'DocumentsController');
Route::post('documents/update/{id}', 'DocumentsController@update');
Route::get('documents/delete/{id}', 'DocumentsController@destroy');
Route::get('documents/edit/{id}', 'DocumentsController@edit');
Route::get('documents/download/{id}', 'DocumentsController@getDownload');
Route::get('documents/create/{id}', 'DocumentsController@create');
Route::post('createDoc', 'DocumentsController@serializecheck');

Route::resource('NextOfKins', 'NextOfKinsController');
Route::post('NextOfKins/update/{id}', 'NextOfKinsController@update');
Route::get('NextOfKins/delete/{id}', 'NextOfKinsController@destroy');
Route::get('NextOfKins/edit/{id}', 'NextOfKinsController@edit');
Route::get('NextOfKins/view/{id}', 'NextOfKinsController@view');
Route::get('NextOfKins/create/{id}', 'NextOfKinsController@create');
Route::post('createKin', 'NextOfKinsController@serializecheck');

Route::resource('Appraisals', 'AppraisalsController');
Route::post('Appraisals/update/{id}', 'AppraisalsController@update');
Route::get('Appraisals/delete/{id}', 'AppraisalsController@destroy');
Route::get('Appraisals/edit/{id}', 'AppraisalsController@edit');
Route::get('Appraisals/view/{id}', 'AppraisalsController@view');
Route::get('Appraisals/createapp/{id}', 'AppraisalsController@createapp');
Route::post('createQuestion', 'AppraisalsController@createquestion');

Route::resource('Properties', 'PropertiesController');
Route::post('Properties/update/{id}', 'PropertiesController@update');
Route::get('Properties/delete/{id}', 'PropertiesController@destroy');
Route::get('Properties/edit/{id}', 'PropertiesController@edit');
Route::get('Properties/view/{id}', 'PropertiesController@view');

Route::resource('AppraisalSettings', 'AppraisalSettingsController');
Route::post('AppraisalSettings/update/{id}', 'AppraisalSettingsController@update');
Route::get('AppraisalSettings/delete/{id}', 'AppraisalSettingsController@destroy');
Route::get('AppraisalSettings/edit/{id}', 'AppraisalSettingsController@edit');
Route::post('createCategory', 'AppraisalSettingsController@createcategory');

Route::resource('appraisalcategories', 'AppraisalCategoryController');
Route::post('appraisalcategories/update/{id}', 'AppraisalCategoryController@update');
Route::get('appraisalcategories/delete/{id}', 'AppraisalCategoryController@destroy');
Route::get('appraisalcategories/edit/{id}', 'AppraisalCategoryController@edit');

Route::group(['before' => 'loggedin'], function() {
Route::get('template/employees', function(){

  $bank_data = Bank::where('organization_id',Auth::user()->organization_id)->get();

  $data = Employee::where('organization_id',Auth::user()->organization_id)->get();

  $employees = Employee::where('organization_id',Auth::user()->organization_id)->get();

  $bankbranch_data = BBranch::where('organization_id',Auth::user()->organization_id)->get();
 
  $branch_data = Branch::where('organization_id',Auth::user()->organization_id)->get();

  $department_data = Department::where('organization_id',Auth::user()->organization_id)->get();

  $employeetype_data = EType::where('organization_id',Auth::user()->organization_id)->get();

  $jobgroup_data = Jobgroup::where('organization_id',Auth::user()->organization_id)->get();

  Audit::logaudit('Employee', 'download', 'downloaded employee template');

  Excel::create('Employees', function($excel) use($bank_data, $bankbranch_data, $branch_data, $department_data, $employeetype_data, $jobgroup_data,$employees, $data) {


    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

    

    $excel->sheet('employees', function($sheet) use($bank_data, $bankbranch_data, $branch_data, $department_data, $employeetype_data, $jobgroup_data, $data, $employees){


              $sheet->row(1, array(
     'EMPLOYMENT NUMBER','FIRST NAME', 'SURNAME', 'OTHER NAMES', 'ID NUMBER', 'KRA PIN', 'NSSF NUMBER', 'NHIF NUMBER','EMAIL ADDRESS','BASIC PAY'
));

             
                $empdata = array();

                foreach($employees as $d){

                  $empdata[] = $d->personal_file_number.':'.$d->first_name.' '.$d->last_name.' '.$d->middle_name;
                }

                $emplist = implode(", ", $empdata);

                

                $listdata = array();

                foreach($data as $d){

                  $listdata[] = $d->allowance_name;
                }

                $list = implode(", ", $listdata);
   

    

                

                
        

    });

  })->export('xls');
});


/*
*allowance template
*
*/

Route::get('template/allowances', function(){

  $data = Allowance::where('organization_id',Auth::user()->organization_id)->get();
  $employees = Employee::where('organization_id',Auth::user()->organization_id)->get();

  Audit::logaudit('Allowance', 'download', 'downloaded allowance template');

  Excel::create('Allowances', function($excel) use($data, $employees) {

    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

    

    $excel->sheet('allowances', function($sheet) use($data, $employees){


              $sheet->row(1, array(
              'EMPLOYEE', 'ALLOWANCE TYPE', 'FORMULAR', 'INSTALMENTS','AMOUNT','ALLOWANCE DATE',
              ));

              $sheet->setWidth(array(
                    'A'     =>  30,
                    'B'     =>  30,
                    'C'     =>  30,
                    'D'     =>  30,
                    'E'     =>  30,
                    'F'     =>  30,
              ));

             $sheet->getStyle('F2:F1000')
            ->getNumberFormat()
            ->setFormatCode('yyyy-mm-dd');



                $row = 2;
                $r = 2;
            
            for($i = 0; $i<count($employees); $i++){
            
             $sheet->SetCellValue("YY".$row, $employees[$i]->personal_file_number." : ".$employees[$i]->first_name.' '.$employees[$i]->last_name);
             $row++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'names', $sheet, 'YY2:YY'.(count($employees)+1)
                        )
                );

                

               for($i = 0; $i<count($data); $i++){
            
             $sheet->SetCellValue("YZ".$r, $data[$i]->allowance_name);
             $r++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'allowances', $sheet, 'YZ2:YZ'.(count($data)+1)
                        )
                );
   

    for($i=2; $i <= 1000; $i++){

                $objValidation = $sheet->getCell('B'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('allowances'); //note this!

                $objValidation = $sheet->getCell('A'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('names'); //note this!

                $objValidation = $sheet->getCell('C'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('"One Time, Recurring, Instalments"'); //note this!
                }

    });

  })->export('xlsx');



});

/*
*earning template
*
*/


Route::get('template/earnings', function(){
   $data = Employee::where('organization_id',Auth::user()->organization_id)->get();
   $earnings = Earningsetting::all();

   Audit::logaudit('Earning', 'download', 'downloaded earning template');

 Excel::create('Earnings', function($excel) use($data, $earnings) {
            require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
            require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

              

              $excel->sheet('Earnings', function($sheet) use($data, $earnings) {

              $sheet->row(1, array(
             'EMPLOYEE', 'EARNING TYPE','NARRATIVE', 'FORMULAR', 'INSTALMENTS','AMOUNT','EARNING DATE',
              ));

              $sheet->setWidth(array(
                    'A'     =>  30,
                    'B'     =>  30,
                    'C'     =>  30,
                    'D'     =>  30,
                    'E'     =>  30,
                    'F'     =>  30,
                    'G'     =>  30,
              ));

             $sheet->getStyle('G2:G1000')
            ->getNumberFormat()
            ->setFormatCode('yyyy-mm-dd');

            $row = 2;
            $r = 2;
            
            for($i = 0; $i<count($data); $i++){
            
             $sheet->SetCellValue("ZZ".$row, $data[$i]->personal_file_number." : ".$data[$i]->first_name.' '.$data[$i]->last_name);
             $row++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'names', $sheet, 'ZZ2:ZZ'.(count($data)+1)
                        )
                );

                 for($i = 0; $i<count($earnings); $i++){
            
             $sheet->SetCellValue("YZ".$r, $earnings[$i]->earning_name);
             $r++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'earnings', $sheet, 'YZ2:YZ'.(count($data)+1)
                        )
                );

                $objPHPExcel = new \PHPExcel;
                $objSheet = $objPHPExcel->getActiveSheet();

               $objSheet->protectCells('ZZ2:ZZ'.(count($data)+1), 'PHP');

                $objSheet->getStyle('G2:G1000')->getNumberFormat()->setFormatCode('yyyy-mm-dd');


                for($i=2; $i <= 1000; $i++){

                $objValidation = $sheet->getCell('A'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('names'); //note this!

                $objValidation = $sheet->getCell('B'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('earnings'); //note this!

                $objValidation = $sheet->getCell('D'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('"One Time, Recurring, Instalments"'); //note this!
                }
            });

            

        })->download("xlsx");

});
/*
*Relief template
*
*/

Route::get('template/reliefs', function(){

  $employees = Employee::where('organization_id',Auth::user()->organization_id)->get();
  
  $data = Relief::where('organization_id',Auth::user()->organization_id)->get();

  Audit::logaudit('Relief', 'download', 'downloaded relief template');

  Excel::create('Reliefs', function($excel) use($employees, $data) {

    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

    

    $excel->sheet('reliefs', function($sheet) use($employees, $data){


              $sheet->row(1, array(
     'EMPLOYEE', 'RELIEF TYPE', 'AMOUNT'
));

             
                $sheet->setWidth(array(
                    'A'     =>  30,
                    'B'     =>  30,
                    'C'     =>  30,
              ));



                $row = 2;
                $r = 2;
            
            for($i = 0; $i<count($employees); $i++){
            
             $sheet->SetCellValue("YY".$row, $employees[$i]->personal_file_number." : ".$employees[$i]->first_name.' '.$employees[$i]->last_name);
             $row++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'names', $sheet, 'YY2:YY'.(count($employees)+1)
                        )
                );

                

               for($i = 0; $i<count($data); $i++){
            
             $sheet->SetCellValue("YZ".$r, $data[$i]->relief_name);
             $r++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'reliefs', $sheet, 'YZ2:YZ'.(count($data)+1)
                        )
                );
   

    for($i=2; $i <= 1000; $i++){

                $objValidation = $sheet->getCell('B'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('reliefs'); //note this!



                $objValidation = $sheet->getCell('A'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('names'); //note this!

    }

                

                
        

    });

  })->export('xlsx');



});



/*
*deduction template
*
*/

Route::get('template/deductions', function(){

  $data = Deduction::where('organization_id',Auth::user()->organization_id)->get();
  $employees = Employee::where('organization_id',Auth::user()->organization_id)->get();

  Audit::logaudit('Deduction', 'download', 'downloaded deduction template');

  Excel::create('Deductions', function($excel) use($data, $employees) {

    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/NamedRange.php");
    require_once(base_path()."/vendor/phpoffice/phpexcel/Classes/PHPExcel/Cell/DataValidation.php");

    

    $excel->sheet('deductions', function($sheet) use($data, $employees){


              $sheet->row(1, array(
     'EMPLOYEE', 'DEDUCTION TYPE', 'FORMULAR','INSTALMENTS','AMOUNT','DATE'
));

             
               $sheet->setWidth(array(
                    'A'     =>  30,
                    'B'     =>  30,
                    'C'     =>  30,
                    'D'     =>  30,
                    'E'     =>  30,
                    'F'     =>  30,
              ));

             $sheet->getStyle('F2:F1000')
            ->getNumberFormat()
            ->setFormatCode('yyyy-mm-dd');

            $row = 2;
                $r = 2;
            
            for($i = 0; $i<count($employees); $i++){
            
             $sheet->SetCellValue("YY".$row, $employees[$i]->personal_file_number." : ".$employees[$i]->first_name.' '.$employees[$i]->last_name);
             $row++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'names', $sheet, 'YY2:YY'.(count($employees)+1)
                        )
                );

                

               for($i = 0; $i<count($data); $i++){
            
             $sheet->SetCellValue("YZ".$r, $data[$i]->deduction_name);
             $r++;
            }  

                $sheet->_parent->addNamedRange(
                        new \PHPExcel_NamedRange(
                        'deductions', $sheet, 'YZ2:YZ'.(count($data)+1)
                        )
                );
   

    for($i=2; $i <= 1000; $i++){

                $objValidation = $sheet->getCell('B'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('deductions'); //note this!



                $objValidation = $sheet->getCell('A'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('names'); //note this!

                $objValidation = $sheet->getCell('C'.$i)->getDataValidation();
                $objValidation->setType(\PHPExcel_Cell_DataValidation::TYPE_LIST);
                $objValidation->setErrorStyle(\PHPExcel_Cell_DataValidation::STYLE_INFORMATION);
                $objValidation->setAllowBlank(false);
                $objValidation->setShowInputMessage(true);
                $objValidation->setShowErrorMessage(true);
                $objValidation->setShowDropDown(true);
                $objValidation->setErrorTitle('Input error');
                $objValidation->setError('Value is not in list.');
                $objValidation->setPromptTitle('Pick from list');
                $objValidation->setPrompt('Please pick a value from the drop-down list.');
                $objValidation->setFormula1('"One Time, Recurring, Instalments"');

    }

                

                
        

    });

  })->export('xlsx');



});



/* #################### IMPORT EMPLOYEES ################################## */

Route::post('import/employees', function(){

  
  if(Input::hasFile('employees')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('employees')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('employees')->move($destination, $file);


  


    Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

          $results = $reader->get();
          $organization = Organization::find(Auth::user()->organization_id); 

          $cres = count($results); 
          $cemp = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->count();   
          $limit = $organization->payroll_licensed;


          if($limit<$cres){
           return Redirect::route('migrate')->withDeleteMessage('The imported employees exceed the licensed limit! Please upgrade your license');
          } else if($limit<($cres+$cemp)){
             return Redirect::route('migrate')->withDeleteMessage('The imported employees exceed the licensed limit! Please upgrade your license');
          }else{
  
    foreach ($results as $result) {

      $employee = new Employee;

      $employee->personal_file_number = $result->employment_number;
      
      $employee->first_name = $result->first_name;
      $employee->last_name = $result->surname;
      $employee->middle_name = $result->other_names;
      $employee->identity_number = $result->id_number;
      $employee->pin = $result->kra_pin;
      $employee->social_security_number = $result->nssf_number;
      $employee->hospital_insurance_number = $result->nhif_number;
      $employee->email_office = $result->email_address;
      $employee->basic_pay = str_replace( ',', '', $result->basic_pay);
      $employee->organization_id = Auth::user()->organization_id;
      $employee->save();
      
    }  
    }  

  });
   
  }

  Audit::logaudit('Employee', 'import', 'imported employees');

  return Redirect::back()->with('notice', 'Employees have been succeffully imported');



  

});




/* #################### IMPORT EARNINGS ################################## */

Route::post('import/earnings', function(){

  
  if(Input::hasFile('earnings')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('earnings')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;

     
      Input::file('earnings')->move($destination, $file);


    Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

          $results = $reader->get();   
        
  
    foreach ($results as $result) {

      if($result->employee != null){


         $name = explode(' : ', $result->employee);

          
    
    $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('id')[0];

    $earningid = DB::table('earningsettings')->where('earning_name', '=', $result->earning_type)->pluck('id')[0];

         
    $earning = new Earnings;

    $earning->employee_id = $employeeid;

    $earning->earning_id = $earningid;

    $earning->narrative = $result->narrative;

    $earning->formular = $result->formular;

     

     if($result->formular == 'Instalments'){
        $earning->instalments = $result->instalments;
        $insts = $result->instalments;

        $a = str_replace( ',', '',$result->amount);
        $earning->earnings_amount = $a;

        $earning->earning_date = $result->earning_date;

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime($result->earning_date)));

        $First  = date('Y-m-01', strtotime($result->earning_date));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

      }else{
      $earning->instalments = '1';
        $a = str_replace( ',', '', $result->amount );
        $earning->earnings_amount = $a;

        $earning->earning_date = $result->earning_date;

        $First  = date('Y-m-01', strtotime($result->earning_date));
        $Last   = date('Y-m-t', strtotime($result->earning_date));
        

        $earning->first_day_month = $First;

        $earning->last_day_month = $Last;

      }


    $earning->save();


      }

   

  
    }
    

  });



      
    }

Audit::logaudit('Earning', 'import', 'imported employee earnings');

 return Redirect::back()->with('notice', 'earnings have been successfully imported');





  

});


/* #################### IMPORT RELIEFS ################################## */

Route::post('import/reliefs', function(){

  
  if(Input::hasFile('reliefs')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('reliefs')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;

     
      Input::file('reliefs')->move($destination, $file);


    Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

          $results = $reader->get();    
  
    foreach ($results as $result) {
       if($result->employee != null){

    $name = explode(':', $result->employee);

    
    $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('id')[0];

    $reliefid = DB::table('relief')->where('relief_name', '=', $result->relief_type)->pluck('id')[0];

    $relief = new ERelief;

    $relief->employee_id = $employeeid;

    $relief->relief_id = $reliefid;

    $relief->relief_amount = $result->amount;

    $relief->save();
      
    }
    
   }
    

  });



      
    }


  Audit::logaudit('Relief', 'import', 'imported employee reliefs');
  return Redirect::back()->with('notice', 'reliefs have been succeffully imported');



  

});



/* #################### IMPORT ALLOWANCES ################################## */

Route::post('import/allowances', function(){

  
  if(Input::hasFile('allowances')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('allowances')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('allowances')->move($destination, $file);


  


  Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

    $results = $reader->get();    
  
    foreach ($results as $result) {

      if($result->employee != null){

    $name = explode(':', $result->employee);
    
    $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('id')[0];

    $allowanceid = DB::table('allowances')->where('allowance_name', '=', $result->allowance_type)->pluck('id')[0];

    $allowance = new EAllowances;

    $allowance->employee_id = $employeeid;

    $allowance->allowance_id = $allowanceid;

    $allowance->formular = $result->formular;

     

     if($result->formular == 'Instalments'){
        $allowance->instalments = $result->instalments;
        $insts = $result->instalments;

        $a = str_replace( ',', '',$result->amount);
        $allowance->allowance_amount = $a;

        $allowance->allowance_date = $result->allowance_date;

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime($result->allowance_date)));

        $First  = date('Y-m-01', strtotime($result->allowance_date));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

      }else{
      $allowance->instalments = '1';
        $a = str_replace( ',', '', $result->amount );
        $allowance->allowance_amount = $a;

        $allowance->allowance_date = $result->allowance_date;

        $First  = date('Y-m-01', strtotime($result->allowance_date));
        $Last   = date('Y-m-t', strtotime($result->allowance_date));
        

        $allowance->first_day_month = $First;

        $allowance->last_day_month = $Last;

      }

    $allowance->save();

    }
      
    }
    

    

  });



      
    }


Audit::logaudit('allowance', 'import', 'imported employee allowances');
  return Redirect::back()->with('notice', 'allowances have been succefully imported');



  

});


/* #################### IMPORT DEDUCTIONS ################################## */

Route::post('import/deductions', function(){

  
  if(Input::hasFile('deductions')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('deductions')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('deductions')->move($destination, $file);


  


  Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

    $results = $reader->get();    
  
    foreach ($results as $result) {

      if($result->employee != null){


    $name = explode(':', $result->employee);
    
    $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('id')[0];

    $deductionid = DB::table('deductions')->where('deduction_name', '=', $result->deduction_type)->pluck('id')[0];

    $deduction = new EDeduction;

    $deduction->employee_id = $employeeid;

    $deduction->deduction_id = $deductionid;

    $deduction->formular = $result->formular;

     $a = str_replace( ',', '', $result->amount );
        $deduction->deduction_amount = $a;

    $deduction->deduction_date = $result->date;

    if($result->formular == 'Instalments'){
    $deduction->instalments = $result->instalments;
        $insts = $result->instalments;

        $effectiveDate = date('Y-m-d', strtotime("+".($insts-1)." months", strtotime($result->date)));

        $First  = date('Y-m-01', strtotime($result->date));
        $Last   = date('Y-m-t', strtotime($effectiveDate));

        $deduction->first_day_month = $First;

        $deduction->last_day_month = $Last;

      }else{
      $deduction->instalments = '1';

        $First  = date('Y-m-01', strtotime($result->date));
        $Last   = date('Y-m-t', strtotime($result->date));
        

        $deduction->first_day_month = $First;

        $deduction->last_day_month = $Last;

      }

    $deduction->save();

    }
      
    }
    

  });
      
    }

    Audit::logaudit('Deduction', 'import', 'imported employee deductions');

  return Redirect::back()->with('notice', 'deductions have been succefully imported');
  

});

/* #################### IMPORT PENSIONS ################################## */

Route::post('import/pensions', function(){

  
  if(Input::hasFile('pensions')){


      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('pensions')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('pensions')->move($destination, $file);


  


  Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

    $results = $reader->get();    
  
    foreach ($results as $result) {

      if($result->employee != null){


    $name = explode(':', $result->employee);
    
    $employeeid = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('id')[0];
    $salary = DB::table('employee')->where('organization_id',Auth::user()->organization_id)->where('personal_file_number', '=', $name[0])->pluck('basic_pay')[0];

    $pension = new Pension;

    $pension->employee_id = $employeeid;

    $pension->type = $result->formular;

    if($result->formular == "Percentage"){
    $pension->employee_percentage = str_replace( '%', '', $result->employee_percentage);
    $pension->employee_contribution = str_replace( '%', '', $result->employee_percentage) * $salary/100;
    }else{
    $pension->employer_percentage = 0;
    $pension->employee_contribution = str_replace( ',', '', $result->employee_contribution);
    }
    if($result->formular == "Percentage"){
    $pension->employer_percentage = str_replace( '%', '', $result->employee_percentage);
    $pension->employer_contribution = str_replace( '%', '', $result->employer_percentage) * $salary/100;
    }else{
    $pension->employer_percentage = 0;
    $pension->employer_contribution = str_replace( ',', '', $result->employer_contribution);
    }
    $pension->interest = $result->interest;
    $pension->comments = $result->comment;
    $pension->year = $result->year;
    $pension->month = $result->month;
    $pension->save();

    }
      
    }
    

  });
      
    }

  Audit::logaudit('Pension', 'import', 'imported employee pension contributions');
  return Redirect::back()->with('notice', 'pension contributions have been succefully imported');
  

});


/* #################### IMPORT BANK BRANCHES ################################## */

Route::post('import/bankBranches', function(){

  
  if(Input::hasFile('bbranches')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('bbranches')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('bbranches')->move($destination, $file);


  


  Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

    $results = $reader->get();    
  
    foreach ($results as $result) {
  

    $bbranch = new BBranch;

    $bbranch->branch_code = $result->branch_code;

    $bbranch->bank_branch_name = $result->branch_name;

    $bbranch->bank_id = $result->bank_id;

    $bbranch->organization_id = $result->organization_id;

    $bbranch->save();
      
    }   

  });
      
    }
  Audit::logaudit('Bank Branch', 'import', 'imported bank branches');

  return Redirect::back()->with('notice', 'bank branches have been succefully imported');



  

});

/* #################### IMPORT BANKS ################################## */

Route::post('import/banks', function(){

  
  if(Input::hasFile('banks')){

      $destination = public_path().'/migrations/';

      $filename = str_random(12);

      $ext = Input::file('banks')->getClientOriginalExtension();
      $file = $filename.'.'.$ext;



      
      
     
      Input::file('banks')->move($destination, $file);


  


  Excel::selectSheetsByIndex(0)->load(public_path().'/migrations/'.$file, function($reader){

    $results = $reader->get();    
  
    foreach ($results as $result) {
    $bank = new Bank;

    $bank->bank_name = $result->bank_name;

    $bank->bank_code = $result->bank_code;

    $bank->organization_id = $result->organization_id;

    $bank->save();
      
    }   

  });
      
    }

  Audit::logaudit('Bank', 'import', 'imported banks');

  return Redirect::back()->with('notice', 'banks have been succefully imported');



  

});

});

Route::get('api/dropdown', function(){
    $id = Input::get('option');
    $bbranch = Bank::find($id)->bankbranch;
    return $bbranch->pluck('bank_branch_name', 'id');
});

Route::get('api/leavetypes', function(){
    $leavetypes = Leavetype::where('organization_id',Auth::user()->organization_id)->get();
    return $leavetypes->pluck('name', 'id');
});

Route::get('api/site', function(){
    $sid = Input::get('option');
    $site = array();


    $site = Site::select('id', 'name')
    ->where('organization_id',Auth::user()->organization_id)
    ->where('period',$sid)
    ->pluck('name', 'id');
    

    return $site;
});

Route::get('api/branchemployee', function(){
    $bid = Input::get('option');
    $did = Input::get('deptid');
    $employee = array();


    if(($bid == 'All' || $bid == '' || $bid == 0) && ($did == 'All' || $did == '' || $did == 0)){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('organization_id',Auth::user()->organization_id)
    ->pluck('full_name', 'id');
    }else if(($bid != 'All' || $bid != '' || $bid != 0) && ($did == 'All' || $did == '' || $did == 0)){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('branch_id',$bid)
    ->where('organization_id',Auth::user()->organization_id)
    ->pluck('full_name', 'id');
    }else if(($did != 'All' || $did != '' || $did != 0) && ($bid != 'All' || $bid != '' || $bid != 0) ){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('branch_id',$bid)
    ->where('organization_id',Auth::user()->organization_id)
    ->where('department_id',$did)
    ->pluck('full_name', 'id');
    }

    return $employee;
});

Route::get('api/deptemployee', function(){
    $did = Input::get('option');
    $bid = Input::get('bid');
    $employee = array();

    if(($did == 'All' || $did == '' || $did == 0) && ($bid == 'All' || $bid == '' || $bid == 0)){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('organization_id',Auth::user()->organization_id)
    ->pluck('full_name', 'id');
    }else if(($did != 'All' || $did != '' || $did != 0) && ($bid == 'All' || $bid == '' || $bid == 0)){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('department_id',$did)
    ->where('organization_id',Auth::user()->organization_id)
    ->pluck('full_name', 'id');
    }else if(($did != 'All' || $did != '' || $did != 0) && ($bid != 'All' || $bid != '' || $bid != 0) ){
    $employee = Employee::select('id', DB::raw('CONCAT(personal_file_number, " : ", first_name,IF(middle_name is null or middle_name="","",CONCAT(" ",middle_name))," ",last_name) AS full_name'))
    ->where('branch_id',$bid)
    ->where('organization_id',Auth::user()->organization_id)
    ->where('department_id',$did)
    ->pluck('full_name', 'id');
    }

    return $employee;
});


Route::get('api/getDays', function(){
    $id = Input::get('employee');
    $lid = Input::get('leave');
    $d = Input::get('option');
    $sdate = Input::get('sdate');
    $weekends = Input::get('weekends');
    $holidays = Input::get('holidays');
    
    Leaveapplication::checkBalance($id, $lid,$d);
    if(Leaveapplication::checkBalance($id, $lid,$d)<0){
     return Leaveapplication::checkBalance($id, $lid,$d);
    }else{

    $enddate = Leaveapplication::getEndDate($sdate,$d,$weekends,$holidays);

    return $enddate;
    //Leaveapplication::checkHoliday($sdate);
    }
    
    //return Leaveapplication::checkBalance($id, $lid,$d);
});

Route::get('api/getDaysDynamic', function(){
    $id = Input::get('employee');
    $lid = Input::get('leave');
    $d = Input::get('option');
    $sdate = Input::get('sdate');
    $weekends = Input::get('weekends');
    $holidays = Input::get('holidays');
    
    Leaveapplication::checkBalance($id, $lid,$d);
    if(Leaveapplication::checkBalance($id, $lid,$d)<0){
     return Leaveapplication::checkBalance($id, $lid,$d);
    }else{

    $enddate = Leaveapplication::getEndDate($sdate,$d,$weekends,$holidays);

    return $enddate;
    //Leaveapplication::checkHoliday($sdate);
    }
    
    //return Leaveapplication::checkBalance($id, $lid,$d);
});

Route::get('api/score', function(){
    $id = Input::get('option');
    $rate = Appraisalquestion::find($id);
    return $rate->rate;
});

Route::get('api/pay', function(){
    $id = Input::get('option');
    $employee = Employee::find($id);
    return number_format($employee->basic_pay,2);
});


});