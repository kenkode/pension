@extends('layouts.app')
@section('content')

     <div class="row">
      <div class="col-lg-12">
       <h3>Paye</h3>

       <hr>
      </div>  
     </div>
            
            <div class="row">
                <div class="col-lg-12">
                  @if (Session::has('flash_message'))

      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      {{ Session::get('delete_message') }}
     </div>
    @endif
                <!-- <div class="ibox float-e-margins">
                    <div class="ibox-title"> -->

                      @if ($message = Session::get('success'))
                       <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                         <p>{{ $import_msg }}</p>
                         </div>
                        @endif

                        <!-- <h5>Deductions summary</h5>     -->                  

                        <div class="panel panel-default">
                          <div class="panel-heading">
                            @if(App\Remittedemployee::getCount($period,'paye') < $emps)
                            <a class="btn btn-info btn-sm" href="{{ URL::to('remitpaye/finalize/'.$id)}}">Finalize Remittance</a>
                            @endif
                            <a class="btn btn-warning btn-sm" href="{{ URL::to('remitpaye')}}">Go Back</a>
                          </div>
                        <div class="panel-body">


                  <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover deductions_tbl" >
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Employee</th>
                        <th>Amount</th>
                        <th>Period</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $i=1; ?>
                    @foreach ($remittedemployees as $remittedemployee)

                      <tr>
                          <td>{{ $i }}</td>
                          <td>{{ $remittedemployee->employee->personal_file_number.' : '.$remittedemployee->employee->first_name.' '.$remittedemployee->employee->last_name }}</td>
                          <td>Ksh. {{ number_format(App\Transact::getPaye($remittedemployee->employee_id,$period),2) }}</td>
                          <td>{{ App\Pensioninterest::getPeriod($remittedemployee->employee_id) }}</td>

                        </tr>
                        <?php $i++;?>
                        @endforeach
                    
                    </tbody>
                    
                    </table>
                        </div>                      

                    </div>
                </div>
            </div>
            </div>
        

@endsection
