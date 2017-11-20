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
  <h4>Finalize Pension</h4>

<hr>
</div>	
</div>


<div class="row">
	<div class="col-lg-5">

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
		
		@if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

		 <form method="POST" action="{{{ URL::to('remitpension/finalizeupdate/'.$id) }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
      <input class="form-control" placeholder="" type="hidden" name="remittance_id" id="remittance_id" required="" value="{{$id}}">
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
        
        <input required class="form-control" placeholder="" type="hidden" name="period" id="period" value="{{$period}}">
                   
       
      <div class="form-group">
            <label for="username">Select Employee(s) <span style="color:red">*</span> </label><br>
       <input type="checkbox" class="check_all" onclick="select_all()">Select All<br>

       @foreach($employees as $employee)
       @if(App\Pensioninterest::getEmployee($employee->id,$period) == $employee->id)
       <input type="checkbox" class="case" name="employee[]" value="{{$employee->id}}">
      {{$employee->personal_file_number." : ".$employee->first_name.' '.$employee->last_name}}<br>
      @endif
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