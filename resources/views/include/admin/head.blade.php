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
    <link rel="stylesheet" href="{{ asset('select2/select2.min.css') }}">

    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>

    {{ Html::style('jquery-ui-1.11.4.custom/jquery-ui.css') }}

   
   {{ Html::style('font-awesome/css/font-awesome.css') }}
  

    <!-- Page-Level Plugin CSS - Blank -->

    <!-- SB Admin CSS - Include with every page -->
   

    <!-- datatables css -->

    {{ Html::style('media/css/jquery.dataTables.min.css') }}

    {{ Html::style('datepicker/css/bootstrap-datepicker.css') }}

    {{ Html::style("https://fonts.googleapis.com/css?family=Roboto:300,400") }}

    <style type="text/css">

   .right-inner-addon {
    position: relative;
   }
   .right-inner-addon input {
    padding-right: 30px;    
   }
   .right-inner-addon i {
    position: absolute;
    right: 0px;
    padding: 10px 12px;
    pointer-events: none;
   }

   .ui-datepicker {
    padding: 0.2em 0.2em 0;
    width: 550px;
   }
   .select2-container{
    z-index: 2050;
   }
   </style>


    <!-- jquery scripts with datatable scripts -->



