<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <title>{{ config('app.name', 'Pension System') }}</title>

    <link href="theme/css/bootstrap.min.css" rel="stylesheet">
    <link href="theme/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="theme/css/animate.css" rel="stylesheet">
    <link href="theme/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="loginColumns animated fadeInDown">
        <div class="row">

           
            <div class="col-md-6 col-md-offset-3">
                <div class="ibox-content">


                      @yield('content')

                    
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-6">
                Copyright &copy; prioritymobile.co.ke <?PHP echo date("Y",time()) ;?>All Rights Reserved
            </div>
            <div class="col-md-6 text-right">
               <small>© <?PHP echo date("Y",time()) ;?></small>
            </div>
        </div>
    </div>

</body>

</html>                   
    