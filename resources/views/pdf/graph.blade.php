@extends('layouts.app')

@section('content')

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

 
    use App\Http\Controllers\Controller;


    ?>
  
      <div class="wrapper wrapper-content">

        
      <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                
                                <h5>Employer Contribution</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">Ksh {{number_format($total->total_employer,2)}}</h1>
                              
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Employee Contributions</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">Ksh {{number_format($total->total_employee,2)}}</h1>
                               
                                
                            </div>
                        </div>
                    </div>

        <?php $intr = 0;
        if($employee == "All"){
        foreach($pensions as $p){
           $intr = $intr + App\Pensioninterest::getTransactTotalInterest($p->financial_month_year);

        }
        }else{ 
        foreach($pensions as $p){
           $intr = $intr + App\Pensioninterest::getTransactInterest($p->employee_id,$p->financial_month_year);

        }
        }
        ?>

                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Interests</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">Ksh {{number_format($intr,2)}}</h1>
                               
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5> Total Contributions </h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins"> ksh {{number_format(($total->total_employer+$total->total_employee+$intr),2)}}</h1>
                               
                               
                            </div>
                        </div>
                    </div>
                  
        </div>
        
        
    
        
        <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>
                                 @if($employee == "All")
                                 Pension Contributions for all employees
                                 @else
                                 Pension Contributions for employee {{$employee->personal_file_number.' : '.$employee->first_name.' '.$employee->last_name}} between {{$period}}
                                 @endif
                             </h5>
                             
                                
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                <div class="col-lg-12">

                                
                                    <div class="flot-chart">
                                        <div class="flot-chart-content" id="flot-employee-chart"></div>
                                    </div>
                                </div>


                                </div>
                                </div>

                            </div>
                        </div>
        </div>



</div>

<?php

$data4="";    
$interest = 0;
        foreach($pensions as $deduction){
           $interest = $interest + App\Pensioninterest::getTransactInterest($deduction->employee_id,$deduction->financial_month_year);
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

            $.plot($("#flot-employee-chart"), dataset, options);           

         
        });
    </script>
              

@endsection
