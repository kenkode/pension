@extends('layouts.app')
@section('content')

<div class="row">

	<div class="col-lg-5">

        <h3>User Profile</h3>

        @if (Session::has('flash_message'))

      <div class="alert alert-success">
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger">
      {{ Session::get('delete_message') }}
     </div>
    @endif

    @if (Session::has('success'))
            <div class="alert alert-error alert-success">
                
                    {{ Session::get('success') }}
               
            </div>
        @endif

		<table class="table table-condensed table-bordered">

            <tr>
                <td>username</td><td>{{ $user->name}}</td>
            </tr>
            <tr>
                <td>email</td><td>{{ $user->email}}</td>
            </tr>
            <tr>
                <td>password</td><td><a class="btn btn-info btn-xs" href="{{URL::to('users/password/'.$user->id)}}">change</a></td>

            </tr>
            <tr>
                <td><a class="btn btn-info btn-xs" href="{{URL::to('users/edit/'.$user->id)}}">update</a></td>

            </tr>

        </table>
		

  </div>
</div>










@stop