<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Audit;
use App\Role;
use App\User;
use Illuminate\Http\Request;
use Redirect;
use Entrust;
use Mail;
use App\Mail\UserMail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use DB;

/**
 * UsersController Class
 *
 * Implements actions regarding user management
 */
class UsersController extends Controller
{


    /**
    * display a list of system users
    */
    public function index(){

        $users = User::all();
        if ( !Entrust::can('view_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        Audit::logaudit('Users', 'view', 'viewed system users');
        return view('users.index')->with('users', $users);
    }
    }


    /**
    * display the edit page
    */
    public function edit($user){

        $user = User::find($user);

        return view('users.edit')->with('user', $user);
    }

    public function edituser($user){

        $user = User::find($user);
        $roles = Role::all();
        $r = DB::table("roles")
              ->join("assigned_roles","roles.id", '=',"assigned_roles.role_id")
              ->where("user_id",$user->id)
              ->select("roles.id")
              ->first();
        if ( !Entrust::can('update_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        return view('users.edituser',compact('user','roles','r'));
    }
    }


     /**
    * updates the user
    */
    public function update($user){

        $user = User::find($user);

        $user->name = Input::get('username');
        $user->email = Input::get('email');
        $user->update();

        Audit::logaudit('Users', 'update', 'updated user profile '.$user->name);

        return Redirect::to('users/profile/'.$user->id)->withFlashMessage("User successfully updated!");
    }

    public function updateuser($user){

        $user = User::find($user);

        $roles = Input::get('role');

        $user->name = Input::get('username');
        $user->email = Input::get('email');
        $user->role = Input::get('type');
        $user->update();

        foreach ($roles as $role) {

                $user->roles()->sync($role);
            }

        Audit::logaudit('Users', 'update', 'updated user '.$user->name);

        return Redirect::to('users')->withFlashMessage("User successfully updated!");
    }




    /**
     * Displays the form for account creation
     *
     * @return  Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::all();
        if ( !Entrust::can('create_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{
        return view('users.create', compact('roles'));
    }
    }

    /**
     * Stores new account
     *
     * @return  Illuminate\Http\Response
     */
    public function store()
    {

        $input = Input::all();



        
        
        $repo = App::make('UserRepository');
        $user = $repo->signup($input);



        if ($user->id) {
            if (Config::get('confide::signup_email')) {
                Mail::queueOn(
                    Config::get('confide::email_queue'),
                    Config::get('confide::email_account_confirmation'),
                    compact('user'),
                    function ($message) use ($user) {
                        $message
                            ->to($user->email, $user->username)
                            ->subject(Lang::get('confide::confide.email.account_confirmation.subject'));
                    }
                );
            }

           
            Audit::logaudit('Users', 'create', 'created a new user '.$user->name);
            return Redirect::to('/');
                
        } else {
            $error = $user->errors()->all(':message');

            return Redirect::back()
                ->withInput(Input::except('password'))
                ->with('error', $error);
        }

        
    }

    /**
     * Displays the login form
     *
     * @return  Illuminate\Http\Response
     */
    public function login()
    {
        if (Confide::user()) {
            return Redirect::to('/dashboard');

        } else {
            return view('login');
        }
    }

    /**
     * Attempt to do login
     *
     * @return  Illuminate\Http\Response
     */
    public function doLogin()
    {
        $repo = App::make('UserRepository');
        $input = Input::all();

        if ($repo->login($input)) {
            return Redirect::intended('/dashboard');

            Audit::logaudit('System', 'login', 'Logged in: '.Confide::user()->username);

        } else {
            if ($repo->isThrottled($input)) {
                $err_msg = Lang::get('confide::confide.alerts.too_many_attempts');

                Audit::logaudit('System', 'login', 'failed log in attempt');
            } elseif ($repo->existsButNotConfirmed($input)) {
                $err_msg = Lang::get('confide::confide.alerts.not_confirmed');
            } else {
                $err_msg = Lang::get('confide::confide.alerts.wrong_credentials');
            }

            return Redirect::action('UsersController@login')
                ->withInput(Input::except('password'))
                ->with('error', $err_msg);
        }
    }

    /**
     * Attempt to confirm account with code
     *
     * @param  string $code
     *
     * @return  Illuminate\Http\Response
     */
    public function confirm($code)
    {
        if (Confide::confirm($code)) {
            $notice_msg = Lang::get('confide::confide.alerts.confirmation');
            return Redirect::action('UsersController@login')
                ->with('notice', $notice_msg);
        } else {
            $error_msg = Lang::get('confide::confide.alerts.wrong_confirmation');
            return Redirect::action('UsersController@login')
                ->with('error', $error_msg);
        }
    }

    /**
     * Displays the forgot password form
     *
     * @return  Illuminate\Http\Response
     */
    public function forgotPassword()
    {
        return view(Config::get('confide::forgot_password_form'));
    }

    /**
     * Attempt to send change password link to the given email
     *
     * @return  Illuminate\Http\Response
     */
    public function doForgotPassword()
    {
        if (Confide::forgotPassword(Input::get('email'))) {
            $notice_msg = Lang::get('confide::confide.alerts.password_forgot');
            return Redirect::action('UsersController@login')
                ->with('notice', $notice_msg);
        } else {
            $error_msg = Lang::get('confide::confide.alerts.wrong_password_forgot');
            return Redirect::action('UsersController@doForgotPassword')
                ->withInput()
                ->with('error', $error_msg);
        }
    }

    /**
     * Shows the change password form with the given token
     *
     * @param  string $token
     *
     * @return  Illuminate\Http\Response
     */
    public function resetPassword($token)
    {
        return view(Config::get('confide::reset_password_form'))
                ->with('token', $token);
    }

    /**
     * Attempt change password of the user
     *
     * @return  Illuminate\Http\Response
     */
    public function doResetPassword()
    {
        $repo = App::make('UserRepository');
        $input = array(
            'token'                 =>Input::get('token'),
            'password'              =>Input::get('password'),
            'password_confirmation' =>Input::get('password_confirmation'),
        );

        // By passing an array with the token, password and confirmation
        if ($repo->resetPassword($input)) {
            $notice_msg = Lang::get('confide::confide.alerts.password_reset');
            return Redirect::action('UsersController@login')
                ->with('notice', $notice_msg);
        } else {
            $error_msg = Lang::get('confide::confide.alerts.wrong_password_reset');
            return Redirect::action('UsersController@resetPassword', array('token'=>$input['token']))
                ->withInput()
                ->with('error', $error_msg);
        }
    }

    /**
     * Log the user out of the application.
     *
     * @return  Illuminate\Http\Response
     */
    public function logout()
    {

        Audit::logaudit('System', 'logout', 'Logged out: '.Confide::user()->username);

        Confide::logout();



        return Redirect::to('/');
    }


    /**
    * Activate the user
    *
    */

    public function activate($user){

        $user = User::find($user);

        $user->confirmed = 1;
        $user->save();

        if ( !Entrust::can('activate_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

        Audit::logaudit('Users', 'activate', 'activated user '.$user->name);

        return Redirect::to('users')->withFlashMessage("User successfully activated!");
    }
    }


    /**
    * Deactivate the user
    *
    */

    public function deactivate($user){

        $user = User::find($user);

        $user->confirmed = 0;
        $user->save();

        if ( !Entrust::can('deactivate_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

        Audit::logaudit('Users', 'deactivate', 'deactivated user '.$user->name);

        return Redirect::to('users')->withDeleteMessage("User successfully deactivated!");
    }
    }


    /**
    * Delete the user
    *
    */

    public function destroy($user){

        $user = User::find($user);

        if ( !Entrust::can('delete_user') ) // Checks the current user
        {
        return Redirect::to('home')->with('notice', 'you do not have access to this resource. Contact your system admin');
        }else{

        DB::table("assigned_roles")->where("user_id",$user->id)->delete();  
        $user->delete();

        Audit::logaudit('Users', 'delete', 'deleted user '.$user->name);

        return Redirect::to('users')->withDeleteMessage("User successfully deleted!");
    }
    }


    /**
    * change user password
    */
    public function changePassword($user){

        $user = User::find($user);

        $password_confirmation = Input::get('password_confirmation');
        $password = Input::get('password');

        if($password != $password_confirmation){

            return Redirect::to('users/password/'.$user->id)->with('error', 'passwords do not match');
        } 
        else
        {

            $user->password = Hash::make($password);
            $user->update();

            return Redirect::to('users/profile/'.$user->id);
        }



    }


    public function password($user){

        $user = User::find($user);
        return view('users.password', compact('user'));

    }





    public function profile($user){

        $user = User::find($user);

        return view('users.profile', compact('user'));
    }


    public function add(){


         $user = new User;

    $user->username = 'admin';
    $user->email = 'admin@rental.com';

    $user->password = Hash::make('password123');
    $user->confirmation_code = 'eoioweq982jwe';
    $user->remember_token = 'jsadksjd928323';
    $user->confirmed = '1';
    $user->save();


    echo "user created";
    }







    public function changePassword2(){

        $user_id = Auth::user()->id;

        $oldpass = DB::table("users")->where("id",$user_id)->first();

        

        $password_confirmation = Input::get('password_confirmation');
        $password = Input::get('password');

        if (!password_verify(Input::get("oldpassword"), $oldpass->password)){

            return Redirect::back()->with('error', 'old password does not match your current password');
        }
        else if($password != $password_confirmation){

            return Redirect::back()->with('error', 'passwords do not match');
        }  
        else
        {
    
        $pass = bcrypt($password);

        DB::table('users')->where('id', $user_id)->update(array('password' => $pass));

        Audit::logaudit('System', 'changed password', 'changed their password');

        return Redirect::to('users/profile/'.$user_id)->with('success', 'password successfully updated');



            

            
        }



    }


    public function password2(){

        $user = Confide::user()->id;
        return view('css.password', compact('user'));

    }


    public function tellers(){

        $tellers = DB::table('users')->where('user_type', '=', 'teller')->get();

        return view('tellers.index', compact('tellers'));
    }

    public function createteller($id){

        $user = User::findorfail($id);

        $user->user_type = 'teller';
        $user->is_active = true;
        $user->update();

        return Redirect::to('tellers');
    }


    public function activateteller($id){

        $user = User::findorfail($id);

        
        $user->is_active = true;
        $user->update();

        return Redirect::to('tellers');
    }


    public function deactivateteller($id){

        $user = User::findorfail($id);

        
        $user->is_active = false;
        $user->update();

        return Redirect::to('tellers');
    }


    public function newuser(){

        if(Input::get("password") != Input::get("password_confirmation")){
        return Redirect::to('users/create')->with("notice","Passwords don`t match!");
        }else{
        $input = Input::all();

        $roles = Input::get('role');

        /*$repo = App::make('UserRepository');
        $user = $repo->register($input);*/

        $user = new User;

        $user->email    = array_get($input, 'email');
        $user->password = bcrypt(array_get($input, 'password'));
        $user->role = Input::get('type');
        $user->name = array_get($input, 'username');
        $user->organization_id = 1;

        // The password confirmation will be removed from model
        // before saving. This field will be used in Ardent's
        // auto validation.

        // Generate a random confirmation code
        $user->confirmation_code     = md5(uniqid(mt_rand(), true));

        // Save if valid. Password field will be hashed before save
        $user->save();
         

            foreach ($roles as $role) {

                $user->attachRole($role);
            }

        Mail::to($user->email)->send(new UserMail($user->email,$user->name,array_get($input, 'password')));

        if( count(Mail::failures()) == 0 ) {
          Audit::logaudit('System', 'created user', 'created user '.$user->name);

          return Redirect::to('users')->withFlashMessage("User successfully created and an email confirmation sent to their registered email!");
        }else{
           Audit::logaudit('System', 'created user', 'created user '.$user->name);

           return Redirect::to('users')->withDeleteMessage("User successfully created but an error was encountered in sending them a confirmation email .... Please notify them of their login credentials!");
        }
    }
}


    public function show($id){

        

         Confide::logout();

        return Redirect::to('/');
    }


}
