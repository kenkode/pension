<p>
Hello {{$name}}, 
</p>

<p>Below is your self service login credentials: </p>
<p><strong>Email (Username)</strong> : {{$email}}</p>
<p><strong>Password</strong> :{{$password}}</p>
Click on the link below to access system
<br>
<a href="{{URL::to('/')}}">{{URL::to('/')}}</a>
<br><br>
<p>Regards,</p>
<p>Pension System</p>