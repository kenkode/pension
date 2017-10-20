<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Pension</title>

    <link href="{{ asset('theme/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/font-awesome/css/font-awesome.css') }}" rel="stylesheet">

    <!-- Morris -->
    <link href="{{ asset('theme/css/plugins/morris/morris-0.4.3.min.css') }}" rel="stylesheet">

    <link href="{{ asset('theme/css/animate.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/style.css') }}" rel="stylesheet">



    <link href="{{ asset('theme/css/plugins/iCheck/custom.css') }}" rel="stylesheet">

    <link href="{{ asset('theme/css/plugins/fullcalendar/fullcalendar.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/plugins/fullcalendar/fullcalendar.print.css') }}" rel='stylesheet' media='print'>


    <link href="{{ asset('theme/css/plugins/dropzone/basic.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/plugins/dropzone/dropzone.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/plugins/jasny/jasny-bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/plugins/codemirror/codemirror.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/css/plugins/steps/jquery.steps.css') }}" rel="stylesheet">

    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>

