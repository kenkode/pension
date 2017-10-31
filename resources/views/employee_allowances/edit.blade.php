<?php

function asMoney($value) {
  return number_format($value, 2);
}

?>

<?php
use Illuminate\Support\Facades\Input;
?>

@extends('layouts.app')

{{Html::script('media/jquery-1.8.0.min.js') }}

<script type="text/javascript">
 function totalBalance() {
      var instals = document.getElementById("instalments").value;
      var amt = document.getElementById("amount").value.replace(/,/g,'');
      var total = instals * amt * 10;
      total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
      document.getElementById("balance").value = total;

}

function totalB() {
      var instals = document.getElementById("instalments").value;
      var amt = document.getElementById("amount").value.replace(/,/g,'');
      var total = instals * amt;
      total=total.toLocaleString('en-US',{minimumFractionDigits: 2});
      document.getElementById("balance").value = total;

}

</script>

<script type="text/javascript">
$(document).ready(function(){

$('#formular option#instals').each(function() {
    if (this.selected){
       $('#insts').show();
       $('#bal').show();
     }else{
       $('#insts').hide();
       $('#bal').hide();
     }
});

$('#formular').change(function(){
if($(this).val() == "Instalments"){
    $('#insts').show();
    $('#bal').show();
}else{
    $('#insts').hide();
    $('#bal').hide();
}

});

});
</script>
@section('content')

<div class="row">
    <div class="col-lg-12">
  <h3>Update Employee Allowance</h3>

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
        updateTips( "Please insert allowance type!" );
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
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Please insert a valid name for allowance type." );
 
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
            url     : "{{URL::to('createAllowance')}}",
                      type    : "POST",
                      async   : false,
                      data    : {
                              'name'  : name.val(),
                              '_token' : $("#form input[name=_token]").val()
                      },
                      success : function(s){
                         $('#allowance').append($('<option>', {
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
 
    $('#allowance').change(function(){
    if($(this).val() == "cnew"){
    dialog.dialog( "open" );
    }
      
    });
  });
  </script>
 
   {{ Html::script('datepicker/js/bootstrap-datepicker.min.js') }}

<div id="dialog-form" title="Create new allowance type">
  <p class="validateTips">Please insert Allowance Type.</p>
 
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

         <form method="POST" action="{{{ URL::to('employee_allowances/update/'.$eallw->id) }}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
        <div class="form-group">
         <div class="form-group">
            <label for="username">Employee</label>
            <input class="form-control" placeholder="" type="text" readonly name="employee" id="employee" value="{{ $eallw->employee->first_name.' '.$eallw->employee->last_name }}">
        </div>  
                
                    </div>


                     <div class="form-group">
                        <label for="username">Allowance Type <span style="color:red">*</span></label>
                        <select name="allowance" id="allowance" class="form-control select2">
                            <option></option>
                            <option value="cnew">Create New</option>
                            @foreach($allowances as $allowance)
                            <option value="{{$allowance->id }}"<?= ($eallw->allowance_id==$allowance->id)?'selected="selected"':''; ?>> {{ $allowance->allowance_name }}</option>
                            @endforeach

                        </select>
                
                    </div>

                    <div class="form-group">
                        <label for="username">Formular <span style="color:red">*</span></label>
                        <select name="formular" id="formular" class="form-control forml select2">
                            <option></option>
                            <option value="One Time"<?= ($eallw->formular=='One Time')?'selected="selected"':''; ?>>One Time</option>
                            <option value="Recurring"<?= ($eallw->formular=='Recurring')?'selected="selected"':''; ?>>Recurring</option>
                            <option id="instals" value="Instalments"<?= ($eallw->formular=='Instalments')?'selected="selected"':''; ?>>Instalments</option>
                        </select>
                
                    </div>

        <div class="form-group" id="insts">
            <label for="username">Instalments </label>
            <input class="form-control" placeholder="" onkeypress="totalB(),getdate()" onkeyup="totalB(),getdate()" type="text" name="instalments" id="instalments" value="{{ $eallw->instalments}}">
        </div>


        <div class="form-group">
            <label for="username">Amount <span style="color:red">*</span></label>
            <div class="input-group">
            <span class="input-group-addon">{{$currency->shortname}}</span>
            <input class="form-control" placeholder="" type="text" onkeypress="totalBalance()" onkeyup="totalBalance()" name="amount" id="amount" value="{{ $eallw->allowance_amount}}">
           </div>
           <script type="text/javascript">
           $(document).ready(function() {
           $('#amount').priceFormat();
           });
          </script>
        </div>

        <div class="form-group bal_amt" id="bal">
            <label for="username">Total </label>
            <div class="input-group">
            <span class="input-group-addon">{{$currency->shortname}}</span>
            <input class="form-control" placeholder="" readonly="readonly" type="text" name="balance" id="balance" value="{{ asMoney((double)$eallw->allowance_amount * (double)$eallw->instalments)}}">
           </div>
        </div>
        
        <?php
       $d=strtotime($eallw->allowance_date);

       $d1=strtotime($eallw->end_date);
       ?>

        <div class="form-group">
                        <label for="username">Allowance Date <span style="color:red">*</span></label>
                        <div class="right-inner-addon ">
                        <i class="glyphicon glyphicon-calendar"></i>
                        <input class="form-control allowancedate" readonly="readonly" placeholder="" type="text" name="adate" id="adate" value="{{ $eallw->allowance_date }}">
                        </div>
        </div>

        <script type="text/javascript">
$(function(){ 

$('.allowancedate').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-60y',
    autoclose: true
});
});

</script>
        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Update Employee Allowance</button>
        </div>
       <br><br>
    </fieldset>
</form>
        

  </div>

</div>
























@stop