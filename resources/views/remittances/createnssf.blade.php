@extends('layouts.app')
@section('content')
{{Html::script('media/jquery-1.8.0.min.js') }}
<?php
use Illuminate\Support\Facades\Input;
?>

<style>
.select2 {z-index:10 !important; }
</style>

<div class="row">
	<div class="col-lg-12">
  <h4>Remit Nssf</h4>

<hr>
</div>	
</div>


<div class="row">
	<div class="col-lg-5">

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
		
		@if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

		 <form method="POST" action="{{{ URL::to('remitnssf/store') }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
            <label for="username">Mode <span style="color:red">*</span></label>
            <select required="" class="form-control select2" name="mode">
                <option value="">select mode</option>
                <option>--------------------------</option>
                <option value="Bank Transfer">Bank Transfer</option>
                <option value="Cheque">Cheque</option>
                
            </select>
            
        </div>

        <div class="form-group">
            <label for="username">Transaction Number <span style="color:red">*</span> </label>
            <input class="form-control" placeholder="" type="text" name="transaction_no" id="transaction_no" required="" value="{{{ Input::old('transaction_no') }}}">
        </div>
        
        <div class="form-group">
                        <label for="username">Period <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input required class="form-control datepicker2" readonly="readonly" placeholder="" type="text" name="period" id="period" value="{{{ Input::old('period') }}}">
                    </div>
       </div>
      <div class="form-group">
            <label for="username">Select Employee(s) <span style="color:red">*</span> </label><br>
       <input type="checkbox" class="check_all" onclick="select_all()">Select All<br>

       @foreach($employees as $employee)
       <input type="checkbox" class="case" name="employee[]" value="{{$employee->id}}">
      {{$employee->personal_file_number." : ".$employee->first_name.' '.$employee->last_name}}<br>
       @endforeach
     </div>
        <br>
        <div class="form-actions form-group">
        
          <button id="submit" onclick="return (confirm('Please confirm details before submitting because details wont be updated...Are you sure you want to submit?'))" type="submit" class="btn btn-primary btn-sm">Submit</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>

<script type="text/javascript">
  $('#submit').click(function(){
   if($('.case:checked').length == 0){
    alert("Please select atleast one employee");
    return false;
   }
  });
  function select_all() {
  $('input[class=case]:checkbox').each(function(){ 
    if($('input[class=check_all]:checkbox:checked').length == 0){ 
      $(this).prop("checked", false); 
    } else {
      $(this).prop("checked", true); 
    } 
  });
}
</script>

@stop