
@extends('layouts.app')

{{Html::script('media/jquery-1.8.0.min.js') }}

<?php
use Illuminate\Support\Facades\Input;
?>

<script type="text/javascript">
document.getElementById("edate").value = '';
 function totalBalance() {
      var employeecont = document.getElementById("employeecont").value.replace(/,/g,'');
      var employercont = document.getElementById("employercont").value.replace(/,/g,'');
      var total = (parseFloat(employeecont) + parseFloat(employercont));
      total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
      document.getElementById("balance").value = total;

}

function totalB() {
      var employeecont = document.getElementById("employeecont").value.replace(/,/g,'');
      var employercont = document.getElementById("employercont").value.replace(/,/g,'');
      var total = parseFloat(employeecont) + parseFloat(employercont);
      total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
      document.getElementById("balance").value = total;

}

function pet() {
  var salary = document.getElementById("emp").value.replace(/,/g,'');
  var pemployeecont = document.getElementById("pemployeecont").value.replace(/,/g,'');
      
   var total = parseFloat(salary) * parseFloat(pemployeecont)/100;
   total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
   document.getElementById("employeecont").value = total;
}
function pert() {
  var salary = document.getElementById("emp").value.replace(/,/g,'');
  var pemployercont = document.getElementById("pemployercont").value.replace(/,/g,'');
      
   var total = parseFloat(salary) * parseFloat(pemployercont)/100;
   total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
   document.getElementById("employercont").value = total;

}


</script>

<script type="text/javascript">
$(document).ready(function(){
$('#formular option#fid').each(function() {
    if (this.selected){
    $('.econt').show();
    $('.ercont').show();
    $('.pecont').hide();
    $('.percont').hide();
    $('#bal').show();
    $("#employeecont").removeAttr('readonly');
    $("#employercont").removeAttr('readonly');
    $('#employeecont').val({{$pension->employee_contribution}});
    $('#employercont').val({{$pension->employer_contribution}});
    $('#pemployeecont').val("");
    $('#pemployercont').val("");
    $('#balance').val({{$pension->employee_contribution+$pension->employer_contribution}});
    $('#interest').val({{$pension->interest}});
    $('.int').show();
    $("#employeecont").prop('required',true);
    $("#pemployeecont").prop('required',false);
    }else{
    $('.econt').hide();
    $('.ercont').hide();
    $('.pecont').hide();
    $('.percont').hide();
    $('#bal').hide();
    $('#employeecont').val("");
    $('#employercont').val("");
    $('#pemployeecont').val("");
    $('#pemployercont').val("");
    $('#balance').val("");
    $('.int').hide();
    $('#interest').val("");
    }
});

$('#formular option#pid').each(function() {
    if (this.selected){
    $('#employeecont').attr('readonly', 'readonly');
    $('#employercont').attr('readonly', 'readonly');
    $('#employeecont').val({{$pension->employee_contribution*100}});
    $('#employercont').val({{$pension->employer_contribution*100}});
    $('#pemployeecont').val({{$pension->employee_percentage}});
    $('#pemployercont').val({{$pension->employer_percentage}});
    $('#balance').val({{$pension->employee_contribution+$pension->employer_contribution}});
    $('#interest').val({{$pension->interest}});
    $('.econt').show();
    $('.ercont').show();
    $('.pecont').show();
    $('.percont').show();
    $('#bal').show();
    $('.int').show();
    $("#employeecont").prop('required',false);
    $("#pemployeecont").prop('required',true);
    }else{
    $('.econt').show();
    $('.ercont').show();
    $('.pecont').hide();
    $('.percont').hide();
    $('#bal').show();
    $("#employeecont").removeAttr('readonly');
    $("#employercont").removeAttr('readonly');
    $('#employeecont').val({{$pension->employee_contribution}}*100);
    $('#employercont').val({{$pension->employer_contribution}}*100);
    $('#pemployeecont').val("");
    $('#pemployercont').val("");
    $('#balance').val({{$pension->employee_contribution+$pension->employer_contribution}});
    $('#interest').val({{$pension->interest}});
    $('.int').show();
    $("#employeecont").prop('required',true);
    $("#pemployeecont").prop('required',false);
    }
});

$('#formular').change(function(){
if($(this).val() == "Flat"){
    $('.econt').show();
    $('.ercont').show();
    $('.pecont').hide();
    $('.percont').hide();
    $('#bal').show();
    $("#employeecont").removeAttr('readonly');
    $("#employercont").removeAttr('readonly');
    $('#employeecont').val({{$pension->employee_contribution}});
    $('#employercont').val({{$pension->employer_contribution}});
    $('#pemployeecont').val("");
    $('#pemployercont').val("");
    $('#balance').val({{$pension->employee_contribution+$pension->employer_contribution}});
    $('#interest').val({{$pension->interest}});
    $('.int').show();
    $("#employeecont").prop('required',true);
    $("#pemployeecont").prop('required',false);
}else if($(this).val() == "Percentage"){
    $('#employeecont').attr('readonly', 'readonly');
    $('#employercont').attr('readonly', 'readonly');
    $('#employeecont').val({{$pension->employee_contribution}});
    $('#employercont').val({{$pension->employer_contribution}});
    $('#pemployeecont').val({{$pension->employee_percentage}});
    $('#pemployercont').val({{$pension->employer_percentage}});
    $('#balance').val({{$pension->employee_contribution+$pension->employer_contribution}});
    $('#interest').val({{$pension->interest}});
    $('.econt').show();
    $('.ercont').show();
    $('.pecont').show();
    $('.percont').show();
    $('#bal').show();
    $('.int').show();
    $("#employeecont").prop('required',false);
    $("#pemployeecont").prop('required',true);
}else{
    $('.econt').hide();
    $('.ercont').hide();
    $('.pecont').hide();
    $('.percont').hide();
    $('#bal').hide();
    $('#employeecont').val("");
    $('#employercont').val("");
    $('#pemployeecont').val("");
    $('#pemployercont').val("");
    $('#balance').val("");
    $('.int').hide();
    $('#interest').val("");
}
});

$('#employee').change(function(){
        $.get("{{ url('api/pay')}}", 
        { option: $(this).val() }, 
        function(data) {
          console.log(data.replace(/,/g, ''));
           $('#emp').val(data.replace(/,/g, ''));
});
});

});
</script>

@section('content')

<div class="row">
    <div class="col-lg-12">
  <h3>New Pension</h3>

<hr>
</div>  
</div>


<div class="row">
    <div class="col-lg-5">

    
        
        @if ( count( $errors ) > 0 )
        <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}<br>        
            @endforeach
        </div>
        @endif

  {{ Html::style('jquery-ui-1.11.4.custom/jquery-ui.css') }}
  {{ Html::script('jquery-ui-1.11.4.custom/jquery-ui.js') }}

  <style>
    .select2 {z-index:10 !important; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    .ui-dialog 
    {
    position: fixed;
    margin-bottom: 950px;
    }


    .ui-dialog-titlebar-close {
  background: url("{{ URL::asset('jquery-ui-1.11.4.custom/images/ui-icons_888888_256x240.png') }}") repeat scroll -93px -128px rgba(0, 0, 0, 0);
  border: medium none;
}
.ui-dialog-titlebar-close:hover {
  background: url("{{ URL::asset('jquery-ui-1.11.4.custom/images/ui-icons_222222_256x240.png') }}") repeat scroll -93px -128px rgba(0, 0, 0, 0);
}
    
  </style>

  <script>
  $(function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.Html#e-mail-state-%28type=email%29
      name = $( "#name" ),
      
      allFields = $( [] ).add( name ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o) {
      if ( o.val().length == 0 ) {
        o.addClass( "ui-state-error" );
        updateTips( "Please insert deduction type!" );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function addUser() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name );
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Please insert a valid name for deduction type." );
 
      if ( valid ) {

      /* displaydata(); 

      function displaydata(){
       $.ajax({
                      url     : "{{URL::to('reloaddata')}}",
                      type    : "POST",
                      async   : false,
                      data    : { },
                      success : function(s){
                        var data = JSON.parse(s)
                        //alert(data.id);
                      }        
       });
       }*/

        $.ajax({
            url     : "{{URL::to('createDeduction')}}",
                      type    : "POST",
                      async   : false,
                      data    : {
                              'name'  : name.val(),
                              '_token' : $("#form input[name=_token]").val()
                      },
                      success : function(s){
                         $('#deduction').append($('<option>', {
                         value: s,
                         text: name.val(),
                         selected:true
                        })).trigger('change');
                      }        
        });
        
        dialog.dialog( "close" );
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 250,
      width: 350,
      modal: true,
      buttons: {
        "Create": addUser,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
 
    $('#deduction').change(function(){
    if($(this).val() == "cnew"){
    dialog.dialog( "open" );
    }
      
    });
  });
  </script>
 
   {{ Html::script('datepicker/js/bootstrap-datepicker.min.js') }}

<div id="dialog-form" title="Create new deduction type">
  <p class="validateTips">Please insert Deduction Type.</p>
 
  <form id="form">
    {{ csrf_field() }}
    <fieldset>
      <label for="name">Name <span style="color:red">*</span></label>
      <input type="text" name="name" id="name" value="" class="text ui-widget-content ui-corner-all">
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>

         <form method="POST" action="{{{ URL::to('pensions/update/'.$pension->id) }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>

       <div class="form-group">
         <div class="form-group">
            <label for="username">Employee</label>
            <input class="form-control" placeholder="" type="text" readonly name="employee" id="employee" value="{{ $pension->employee->first_name.' '.$pension->employee->last_name }}">
        </div>  
                
                    </div>                  


        <div class="form-group">
                        <label for="username">Formular <span style="color:red">*</span></label>
                        <select name="formular" id="formular" required="" class="form-control forml select2">
                            <option></option>
                            <option id="fid" value="Flat"<?= ($pension->type=='Flat')?'selected="selected"':''; ?>>Flat Value</option>
                            <option id="pid" value="Percentage"<?= ($pension->type=='Percentage')?'selected="selected"':''; ?>>Percentage</option>
                        </select>
                
                    </div>

        <input class="form-control" placeholder="" type="hidden" name="emp" id="emp" value="{{$pension->employee->basic_pay}}">

        <div class="form-group pecont">
            <label for="username">Percentage Employee (%) </label>
            
            <input class="form-control" placeholder="" type="text" onkeyup="pet()" onkeypress="pet()" name="pemployeecont" id="pemployeecont" value="0">
          
        </div>

        <div class="form-group econt">
            <label for="username">Employee Contribution <span style="color:red">*</span> </label>
            
            <input class="form-control" placeholder="" type="text" onblur="totalBalance()" onfocus="totalBalance()" name="employeecont" id="employeecont" value="0">
           
           <script type="text/javascript">
           $(document).ready(function() {
           $('#employeecont').priceFormat();
           });
          </script> 
        </div>

        <div class="form-group percont">
            <label for="username">Percentage Employer (%) </label>
            
            <input class="form-control" placeholder="" type="text" onkeyup="pert()" onkeypress="pert()" name="pemployercont" id="pemployercont" value="0">
           
           
        </div>

        <div class="form-group ercont">
            <label for="username">Employer Contribution </label>
            
            <input class="form-control" placeholder="" type="text" onblur="totalBalance()" onfocus="totalBalance()" name="employercont" id="employercont" value="0">
           
           <script type="text/javascript">
           $(document).ready(function() {
           $('#employercont').priceFormat();
           });
          </script> 
        </div>

        <div class="form-group int">
            <label for="username">Interest </label>
            
            <input class="form-control" placeholder="" type="text" name="interest" id="interest" value="{{$pension->interest}}">
           
           <script type="text/javascript">
           $(document).ready(function() {
           $('#interest').priceFormat();
           });
          </script> 
        </div>

        <div class="form-group bal_amt" id="bal">
            <label for="username">Total (Click on input field to display total) </label>
            
            <input class="form-control" placeholder="" readonly="readonly" type="text" name="balance" id="balance" value="{{{ Input::old('balance') }}}" onblur="totalBalance()" onfocus="totalBalance()">
            
        </div>

        <div class="form-group">
            <label for="username">Comment</label>
            <textarea class="form-control" placeholder="" name="comment" id="comment">{{$pension->comments}}</textarea>
        </div>

        
        <div class="form-group">
                        <label for="username">Month <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input class="form-control pensionmonth" readonly="readonly" placeholder="" type="text" name="month" id="month" value="{{$pension->month}}">
                        </div>
        </div>

        <script type="text/javascript">
$(function(){ 

$('.pensionmonth').datepicker({
    format: 'M',
    viewMode: "months", 
    minViewMode: "months",
    autoclose: true
});
});

</script>


<div class="form-group">
                        <label for="username">Year <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input class="form-control pensionyear" readonly="readonly" placeholder="" type="text" name="year" id="year" value="{{$pension->year}}">
                        </div>
        </div>

        <script type="text/javascript">
$(function(){ 

$('.pensionyear').datepicker({
    format: " yyyy", // Notice the Extra space at the beginning
    viewMode: "years", 
    minViewMode: "years",
    autoclose: true
});
});

</script>

        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Create Pension</button>
        </div>
       <br><br>
    </fieldset>
</form>
        

  </div>

</div>

@stop