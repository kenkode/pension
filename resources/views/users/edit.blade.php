@extends('layouts.app')
@section('content')



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
            <div class="alert">{{ Session::get('notice') }}</div>
        @endif

      <form method="POST" action="{{{ URL::to('users/update/'.$user->id) }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Username <small>*</small></label>
            <input class="form-control" placeholder="Username" type="text" name="username" id="username" value="{{ $user->name }}">
        </div>
        <div class="form-group">
            <label for="email">Email Address <small>*</small></label>
            <input class="form-control" placeholder="Email Address" type="text" name="email" id="email" value="{{ $user->email }}">
        </div>
        
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Update User</button>
        </div>

    </fieldset>
</form>
		

  </div>
</div>


@stop