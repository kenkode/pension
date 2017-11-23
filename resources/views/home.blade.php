@extends('layouts.app')

@section('content')

<?php 

 
    use App\Http\Controllers\Controller;


    ?>
  
      <div class="wrapper wrapper-content">

        @if (Session::get('notice'))
        <div class="alert alert-info alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>{{ Session::get('notice') }}</div>
        @endif

        @if(Controller::role()=='Human Resource')
        <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                
                                <h5>Kcpe Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$kcpe}}</h1>
                              
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Kcse Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$kcse}}</h1>
                               
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Certificate Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$cert}}</h1>
                               
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                               
                                <h5>Diploma Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$diploma}}</h1>
                              
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                               
                                <h5>Bachelors Degree Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$bachelors}}</h1>
                              
                            </div>
                        </div>
                    </div>
                     <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                               
                                <h5>Masters Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$masters}}</h1>
                              
                            </div>
                        </div>
                    </div>
                     <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                               
                                <h5>PHD Holders</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">{{$phd}}</h1>
                              
                            </div>
                        </div>
                    </div
        </div>
      @else

      <div class="row">
        <div class="col-lg-12" align="center" style="font-size: 18px"><strong>Year {{date('Y')}}</strong></div><br><br><br>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                
                                <h5>Employer Contribution</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">Ksh {{number_format($employer,2)}}</h1>
                              
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Employee Contributions</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">Ksh {{number_format($employee,2)}}</h1>
                               
                                
                            </div>
                        </div>
                    </div>

        <?php $intr = 0; 
        foreach($pensions as $p){
           $intr = $intr + App\Pensioninterest::getTransactInterest($p->employee_id,$p->financial_month_year);

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
                                <h1 class="no-margins"> ksh {{number_format(($employer+$employee+$intr),2)}}</h1>
                               
                               
                            </div>
                        </div>
                    </div>
        </div>
       @endif 
        
        
    
        
        <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Monthy Contributions</h5>
                             
                                
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                <div class="col-lg-12">

                                
                                    <div class="flot-chart">
                                        <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                                    </div>
                                </div>


                                </div>
                                </div>

                            </div>
                        </div>
        </div>



</div>
              

@endsection
