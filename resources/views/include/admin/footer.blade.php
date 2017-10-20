<script src="{{ asset('theme/js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('theme/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/metisMenu/jquery.metisMenu.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/slimscroll/jquery.slimscroll.min.js') }}"></script>

    <!-- Flot -->
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.tooltip.min.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.spline.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.resize.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.pie.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.symbol.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/flot/jquery.flot.time.js') }}"></script>

    <!-- Peity -->
    <script src="{{ asset('theme/js/plugins/peity/jquery.peity.min.js') }}"></script>
    <script src="{{ asset('theme/js/demo/peity-demo.js') }}"></script>

    <!-- Custom and plugin javascript -->
    <script src="{{ asset('theme/js/inspinia.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/pace/pace.min.js') }}"></script>

    <!-- jQuery UI -->
    <script src="{{ asset('theme/js/plugins/jquery-ui/jquery-ui.min.js') }}"></script>

    <!-- Jvectormap -->
    <script src="{{ asset('theme/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js') }}"></script>

    <!-- EayPIE -->
    <script src="{{ asset('theme/js/plugins/easypiechart/jquery.easypiechart.js') }}"></script>

    <!-- Sparkline -->
    <script src="{{ asset('theme/js/plugins/sparkline/jquery.sparkline.min.js') }}"></script>

    <!-- Sparkline demo data  -->
    <script src="{{ asset('theme/js/demo/sparkline-demo.js') }}"></script>



    <?php 

    use App\Deductions;

    if(Auth::user()->role=="Employee"){

        $deductions=Deductions::groupBy('month','year')
                   ->selectRaw('sum(monthly_deduction) as sum, month,year')
                   ->where('payroll_no','=',Auth::user()->payroll_no)
                   ->get();
        $max=10000;

    }else{

        $deductions=Deductions::groupBy('month','year')
                   ->selectRaw('sum(monthly_deduction) as sum, month,year')
                   ->get();

        $max=1000000;

    }

       
            

   
        $data4="";    

        foreach($deductions as $deduction){
       
           $data4.="[gd(".$deduction->year.", ".date('n',strtotime($deduction->month)).", 1), ".$deduction->sum."],";

        }


        
    ?>
    <script>
        $(document).ready(function() {
            $('.chart').easyPieChart({
                barColor: '#f8ac59',
//                scaleColor: false,
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            $('.chart2').easyPieChart({
                barColor: '#1c84c6',
//                scaleColor: false,
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            var data2 = [
                [gd(2017, 1, 1), 7], [gd(2017, 1, 2), 6], [gd(2017, 1, 3), 4], [gd(2017, 1, 4), 8],
                [gd(2017, 1, 5), 9], [gd(2017, 1, 6), 7], [gd(2017, 1, 7), 5], [gd(2017, 1, 8), 4],
                [gd(2017, 1, 9), 7], [gd(2017, 1, 10), 8], [gd(2017, 1, 11), 9], [gd(2017, 1, 12), 6],
                [gd(2017, 1, 13), 4], [gd(2017, 1, 14), 5], [gd(2017, 1, 15), 11], [gd(2017, 1, 16), 8],
                [gd(2017, 1, 17), 8], [gd(2017, 1, 18), 11], [gd(2017, 1, 19), 11], [gd(2017, 1, 20), 6],
                [gd(2017, 1, 21), 6], [gd(2017, 1, 22), 8], [gd(2017, 1, 23), 11], [gd(2017, 1, 24), 13],
                [gd(2017, 1, 25), 7], [gd(2017, 1, 26), 9], [gd(2017, 1, 27), 9], [gd(2017, 1, 28), 8],
                [gd(2017, 1, 29), 5], [gd(2017, 1, 30), 8], [gd(2017, 1, 31), 25]
            ];

            var data3 = [
                [gd(2017, 1, 1), 800], [gd(2017, 2, 2), 500], [gd(2017, 3, 3), 600], [gd(2017, 4, 4), 700],
                [gd(2017, 5, 5), 500], [gd(2017, 6, 6), 456], [gd(2017, 7, 7), 800], [gd(2017, 8, 8), 589],
                [gd(2017, 9, 9), 467], [gd(2017, 10, 10), 876], [gd(2017, 11, 11), 689], [gd(2017, 12, 12), 700]
            ];

            
             var data4 = [
                <?php echo $data4; ?>
            ];

            console.log(data4)

            var dataset = [
                {
                    label: "Monthly Contributions",
                    data: data4,
                    color: "#1ab394",
                    bars: {
                        show: true,
                        align: "center",
                        barWidth:2000000000,
                        lineWidth:0
                    }

                }
            ];

        
            var options = {
                xaxis: {
                    mode: "time",
                    tickSize: [1, "month"],
                    tickLength: 0,
                    axisLabel: "Date",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Arial',
                    axisLabelPadding: 10,
                    color: "#d5d5d5"
                },
                yaxes: [{
                    position: "left",
                    max: <?php echo $max; ?>,
                    color: "#d5d5d5",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Arial',
                    axisLabelPadding: 3
                }, {
                    position: "right",
                    clolor: "#d5d5d5",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: ' Arial',
                    axisLabelPadding: 67
                }
                ],
                legend: {
                    noColumns: 1,
                    labelBoxBorderColor: "#000000",
                    position: "nw"
                },
                grid: {
                    hoverable: true,
                    borderWidth: 0
                }
            };

            function gd(year, month, day) {
                return new Date(year, month - 1, day).getTime();
            }

            var previousPoint = null, previousLabel = null;

            $.plot($("#flot-dashboard-chart"), dataset, options);           

         
        });
    </script>
    <script src="{{ asset('theme/js/plugins/dataTables/datatables.min.js') }}"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                sort:false,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px'); 

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>


    <script>
        $(document).ready(function(){
            $('.deductions_tbl').DataTable({
                pageLength: 25,
                responsive: true,
                sort:false,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'deductions'},
                    {extend: 'pdf', title: 'deductions'},

                    {extend: 'print',
                    title: '',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px') 
                            .prepend('<div style="text-align:center;"><img src="http://www.mkunga.com/pension/public/img/aiu.png"><h1>PENSION SCHEME</h1><h3></h3><h6 style="align:center"><?php echo date("F ,Y",time());?></h6></div>'); 

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>

    <script>
        $(document).ready(function(){
            $('.statement_tbl').DataTable({
                pageLength: 25,
                responsive: true,
                sort:false,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'statement'},
                    {extend: 'pdf', title: 'statement'},

                    {extend: 'print',
                    title: '',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px') 
                            .prepend('<div style="text-align:center;"><img src="http://www.mkunga.com/pension/public/img/aiu.png"><h1>PENSION SCHEME</h1><h3>{{Auth::user()->name}}</h3><h6 style="align:center"><?php echo date("F ,d ,Y",time());?></h6></div>'); 

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>  

    
<!-- jQuery UI  -->
<script src="{{ asset('theme/js/plugins/jquery-ui/jquery-ui.min.js') }}"></script>



<script src="{{ asset('theme/js/plugins/fullcalendar/moment.min.js') }}"></script>

<script src="{{ asset('theme/js/plugins/metisMenu/jquery.metisMenu.js') }}"></script>

<!-- Custom and plugin javascript -->
<script src="{{ asset('theme/js/inspinia.js') }}"></script>
<script src="{{ asset('theme/js/plugins/pace/pace.min.js') }}"></script>

<script src="{{ asset('theme/js/plugins/iCheck/icheck.min.js') }}"></script>


<script src="{{ asset('theme/js/plugins/fullcalendar/fullcalendar.min.js') }}"></script>

<script>

    $(document).ready(function() {

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green'
            });

        /* initialize the external events
         -----------------------------------------------------------------*/


        $('#external-events div.external-event').each(function() {

            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1111999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });


        /* initialize the calendar
         -----------------------------------------------------------------*/
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            drop: function() {
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },
            events: [
                
                {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/'
                }
            ]
        });


    });

</script>

    <script src="{{ asset('theme/js/plugins/metisMenu/jquery.metisMenu.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/slimscroll/jquery.slimscroll.min.js') }}"></script>

    <!-- Custom and plugin javascript -->
    <script src="{{ asset('theme/js/inspinia.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/pace/pace.min.js') }}"></script>

    <!-- Jasny -->
    <script src="{{ asset('theme/js/plugins/jasny/jasny-bootstrap.min.js') }}"></script>

    <!-- DROPZONE -->
    <script src="{{ asset('theme/js/plugins/dropzone/dropzone.js') }}"></script>

    <!-- CodeMirror -->
    <script src="{{ asset('theme/js/plugins/codemirror/codemirror.js') }}"></script>
    <script src="{{ asset('theme/js/plugins/codemirror/mode/xml/xml.js') }}"></script>


    <script>
        Dropzone.options.dropzoneForm = {
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 2, // MB
            dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br> (This is just a demo dropzone. Selected files are not actually uploaded.)"
        };

        $(document).ready(function(){

            var editor_one = CodeMirror.fromTextArea(document.getElementById("code1"), {
                lineNumbers: true,
                matchBrackets: true
            });

            var editor_two = CodeMirror.fromTextArea(document.getElementById("code2"), {
                lineNumbers: true,
                matchBrackets: true
            });

            var editor_two = CodeMirror.fromTextArea(document.getElementById("code3"), {
                lineNumbers: true,
                matchBrackets: true
            });

       });
    </script>

     <!-- Data picker -->
   <script src="{{ asset('theme/js/plugins/datapicker/bootstrap-datepicker.js') }}"></script>

   <script>

 $(function () {$('.yearly').datepicker({    
        startView: "years", 
        minViewMode: "years",
        format: "yyyy"
    });});
    
    
 $(function (){$('.monthly').datepicker({    
        startView: "months",
        minViewMode: "months",
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "MM"

    });});

$(function (){$('.daily').datepicker({    
        startView: "days",
        minViewMode: "days",
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "yyyy-mm-dd"


    });});
    
</script>


    

