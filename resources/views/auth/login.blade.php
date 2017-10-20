@extends('layouts.login')

@section('content')

 <form class="m-t" role="form" method="POST" action="{{ url('/login') }}">
        {{ csrf_field() }}

        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
            
                <input id="email" type="email" class="form-control"  placeholder="E-Mail Address" name="email" value="{{ old('email') }}">

                @if ($errors->has('email'))
                    <span class="help-block">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
            
        </div>

        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
           
                <input id="password" type="password" placeholder="Password" class="form-control" name="password">

                @if ($errors->has('password'))
                    <span class="help-block">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
            
        </div>

        <div class="form-group">
            <div class="col-md-6 col-md-offset-4">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember"> Remember Me
                    </label>
                </div>
            </div>
        </div>

        
          
                 <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

                
                <a href="{{ url('/password/reset') }}"><small>Forgot password?</small></a>
          
        
    </form>
@endsection