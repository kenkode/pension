@extends('layouts.app')
@section('content')

<?php
use Illuminate\Support\Facades\Input;
?>

<div class="row">

	<div class="col-lg-5">

        @if (Session::get('error'))
            <div class="alert alert-error alert-danger">
                @if (is_array(Session::get('error')))
                    {{ head(Session::get('error')) }}
                @endif
            </div>
        @endif
        <br>

        @if (Session::get('notice'))
            <div class="alert alert-error alert-danger">{{ Session::get('notice') }}</div>
        @endif

      <form method="POST" action="{{{ URL::to('users/updateuser/'.$user->id) }}}" accept-charset="UTF-8">
        <input class="form-control" type="hidden" name="user_type" id="user_type" value="admin">
         <input class="form-control" type="hidden" name="organization_id" id="user_type" value="1">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Username <small>*</small></label>
            <input class="form-control" placeholder="Username" type="text" name="username" id="username" value="{{$user->name}}" required="">
        </div>
        <div class="form-group">
            <label for="email">Email Address <small>*</small></label>
            <input class="form-control" placeholder="Email Address" type="email" name="email" id="email" value="{{$user->email}}" required="">
        </div>
        
        <div class="form-group">
                        <label for="username">User Type <span style="color:red">*</span></label>
                        <select name="type" required="" id="type" class="form-control select2">
                            <option></option>
                            <option value="Admin"<?= ($user->role=='Admin')?'selected="selected"':''; ?>>Admin</option>
                            <option value="Human Resource"<?= ($user->role=='Human Resource')?'selected="selected"':''; ?>>Human Resource</option>
                            <option value="Employee"<?= ($user->role=='Employee')?'selected="selected"':''; ?>>Employee</option>
                        </select>
                
                    </div>


        <div class="form-group">
            <label>Assign Roles</label>
            <table class="table table-condensed">

          <tr>
            @foreach($roles as $role)
       


         

            <td>

              <input type="radio" name="role[]" value="{{ $role->id }}"<?= ($r->id==$role->id)?'checked="checked"':''; ?>> {{$role->name}}


            </td>

         


       
        @endforeach


          </tr>

        </table>
        </div>

      
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create User</button>
        </div>

    </fieldset>
</form>
		

  </div>
</div>










@stop