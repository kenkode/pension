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

  {{Html::script('js/price_format.js') }}

    <?php 

    use App\Deductions;
    use App\Employee;

    $max=0;

    if(Auth::user()->role=="Employee"){
        $employeeid = Employee::where("personal_file_number",Auth::user()->name)->pluck("id")[0];
        $deductions=DB::table("transact_pensions")->groupBy('month','year')
                   ->selectRaw('sum(employee_amount+employer_amount) as sum, month,year,employee_id,financial_month_year')
                   ->where('employee_id','=',$employeeid)
                   ->where('year',date('Y'))
                   ->get();
        $m=DB::table("transact_pensions")->groupBy('month','year')
                   ->selectRaw('sum(employee_amount+employer_amount) as sum, month,year')
                   ->where('employee_id','=',$employeeid)
                   ->orderBy('sum')
                   ->where('year',date('Y'))
                   ->first();

        if(count($deductions) > 0){
        $intr = 0;
        foreach($deductions as $deduction){
           $intr = $intr + App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year);
        }
        $max = $m->sum+$intr;
        }else{
        $max = 0;  
        }

    }else{

        $deductions=DB::table("transact_pensions")->groupBy('month','year')
                   ->selectRaw('sum(employee_amount+employer_amount) as sum, month,year,employee_id,financial_month_year')
                   ->where('year',date('Y'))
                   ->get();


        $m=DB::table("transact_pensions")->groupBy('month','year')
                   ->selectRaw('sum(employee_amount+employer_amount) as sum, month,year')
                   ->orderBy('sum')
                   ->where('year',date('Y'))
                   ->first();

        if(count($deductions) > 0){
        $intr = 0;
        foreach($deductions as $deduction){
           $intr = $intr + App\Pensioninterest::getTransactTotalInterest($deduction->financial_month_year);
        }
        $max = $m->sum+$intr;
        }else{
        $max = 0;  
        }


    }

       
            

   
        $data4="";    
        $interest = 0;
        foreach($deductions as $deduction){
           $interest = $interest + App\Pensioninterest::getTransactTotalInterest($deduction->financial_month_year);
           $data4.="[gd(".$deduction->year.", ".$deduction->month.", 1), ".($deduction->sum+$interest)."],";

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
                pageLength: 10,
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
       // $(".select2").select2();

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
  <script src="{{ asset('select2/select2.full.min.js') }}"></script>
  <script>

    $(document).ready(function() {
        $.fn.modal.Constructor.prototype.enforceFocus = $.noop;
        $(".select2").select2({
        width: '100%'
        });
        
    });
</script>
    

<script type="text/javascript">

    $(document).ready(function() {
        /* Animations */
        //$("#side-menu li").velocity("transition.slideDownIn", {stagger: 100}, 2000);
        //$('.panel').velocity("transition.slideDownBigIn", 2000);
        //$('.row').velocity("transition.slideLeftIn", 2000)
        //$("table").velocity("transition.slideDownIn", 2000);
        //$("form").velocity("transition.slideDownIn", 2000);

        $('#users tfoot th').each(function () {
        var title1 = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title1+'" />' );
    });
 
    // DataTable
    var table1 = $('#users').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
 
    // Apply the search
    table1.columns().every(function () {
        var that1 = this;
 
        $(this.footer()).find('input').on( 'keyup change', function () {
                that1.search( this.value ).draw();
            
        });
    });
        $('table.users').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'}) ;
        $('#mobile').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#rejected').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#app').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#disbursed').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#amended').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#doc').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#appr').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#prop').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        $('#occ').DataTable({"sDom": '<"H"lfrp>t<"F"ip>'});
        var table = $('#example').DataTable( {
        "sDom": '<"H"lfrp>t<"F"ip>',
        "lengthMenu": [ 10, 25, 50, 75, 100 ],
        buttons: true,
        buttons: [
             {
                extend: 'excelHtml5',
                title: 'Payroll Preview for financial period {{Session::get("transperiod")}}'
            },
            {
                extend: 'pdfHtml5',
                title: 'Payroll Preview for financial period {{Session::get("transperiod")}}',
                orientation: 'landscape',
                pageSize: 'A1'
            },
            {
                extend: 'print',
                title: 'Payroll Preview for financial period {{Session::get("transperiod")}}'
            }
        ]
    } );
 
    table.buttons().container()
        .insertBefore( '#example_filter' );

    } );

</script>

<script type="text/javascript">

$(function(){
$('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-60y',
    endDate: '+0d',
    autoclose: true,
    orientation: 'bottom'
});
});

</script>

<script type="text/javascript">

$(function(){
$('.datepicker3').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-60y',
    autoclose: true
});
});

</script>

<script type="text/javascript">

$(function(){
$('.datepicker31').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
});
});

</script>


<script type="text/javascript">
$(function(){
$('.datepicker1').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-60y',
    endDate: '-18y',
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker2').datepicker({
    format: "m-yyyy",
    startView: "months", 
    minViewMode: "months",
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker60').datepicker({
    format: "M-yyyy",
    startView: "months", 
    minViewMode: "months",
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker22').datepicker({
    format: "m-yyyy",
    startView: "months", 
    minViewMode: "months",
    Default: true,
    autoclose: true
});
});
</script>



<script type="text/javascript">
$(function(){
$('.datepicker21').datepicker({
    format: "yyyy-mm-dd",
   
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker4').datepicker({
    format: "yyyy-mm-dd",
    startDate: '0y',
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker42').datepicker({
    format: " yyyy",
    startView: "years", 
    minViewMode: "years",
    autoclose: true
});
});
</script>

<script type="text/javascript">
$(function(){
$('.datepicker43').datepicker({
    format: "yyyy-mm-dd",
    startDate: '-60y',
    endDate: '0y',
    autoclose: true
});
});
</script>

<script type="text/javascript">

$(function(){
$('.datepicker40').datepicker({
    format: 'd/m/yyyy',
    startDate: '-60y',
    endDate: '+0d',
    autoclose: true
});
});

</script>

<script type="text/javascript">
$(function(){ 

$('.expiry').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-60y',
    autoclose: true
});
});

</script>

<script type="text/javascript">
$(function(){ 

$('.year').datepicker({
    format: " yyyy", // Notice the Extra space at the beginning
    viewMode: "years", 
    minViewMode: "years",
    endDate: '+0d',
    autoclose: true
});
});

</script>
