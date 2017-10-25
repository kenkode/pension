@extends('layouts.app')
@section('content')


<div class="row">

	<div class="col-lg-5">

        @if (Session::has('error'))
            <div class="alert alert-error alert-danger">
                
                    {{ Session::get('error') }}
               
            </div>
        @endif

        <h3>Change Password</h3>

		<form method="post" action="{{URL::to('users/password/'.$user->id)}}">
        {{ csrf_field() }}

        <div class="form-group">
            <label for="password">Old Password</label>
            <input class="form-control" placeholder="Old Password" type="password" name="oldpassword" id="oldpassword" required="">
        </div>

        <div class="form-group">
            <label for="password">New Password</label>
            <input class="form-control" placeholder="New Password" type="password" name="password" id="password" required="">
        </div>


        <div class="form-group">
            <label for="password_confirmation">Password Confirmation</label>
            <input class="form-control" placeholder="Password Confirmation" type="password" name="password_confirmation" id="password_confirmation" required="">
        </div>

         <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-info btn-sm">Update Password</button>
        </div>

        </form>

        
		

  </div>
</div>










@stop