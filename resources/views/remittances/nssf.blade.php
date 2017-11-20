@extends('layouts.app')
@section('content')
<?php use App\Http\Controllers\UserController;
?>

     <div class="row">
      <div class="col-lg-12">
       <h3>NSSF</h3>

       <hr>
      </div>  
     </div>
            
            <div class="row">
                <div class="col-lg-12">
                  @if (Session::has('flash_message'))

      <div class="alert alert-success">
      {{ Session::get('flash_message') }}
     </div>
    @endif

     @if (Session::has('delete_message'))

      <div class="alert alert-danger">
      {{ Session::get('delete_message') }}
     </div>
    @endif
                <!-- <div class="ibox float-e-margins">
                    <div class="ibox-title"> -->

                      @if ($message = Session::get('success'))
                       <div class="alert alert-success">
                         <p>{{ $import_msg }}</p>
                         </div>
                        @endif

                        <!-- <h5>Deductions summary</h5>     -->                  

                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <a class="btn btn-info btn-sm" href="{{ URL::to('remitnssf/create')}}">remit nssf</a>
                          </div>
                        <div class="panel-body">


                  <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover deductions_tbl" >
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Mode</th>
                        <th>Transaction No.</th>
                        <th>Period</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $i=1; ?>
                    @foreach ($remittances as $remittance)

                      <tr>
                          <td>{{ $i }}</td>
                          <td>{{ $remittance->mode }}</td>
                          <td>{{ $remittance->transaction_number }}</td>
                          <td>{{ $remittance->period }}</td>
                          <td>

                  <div class="btn-group">
                  <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Action <span class="caret"></span>
                  </button>
          
                  <ul class="dropdown-menu" role="menu">
                     <li><a href="{{URL::to('remitnssf/view/'.$remittance->id)}}">View Remitted Employees</a></li> 
                     @if(App\Remittedemployee::getCount($remittance->period,'nssf') < $employees)
                    <li><a href="{{URL::to('remitnssf/finalize/'.$remittance->id)}}">Finalize Remittance</a></li>
                    @endif
                  </ul>
              </div>

                    </td>

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
