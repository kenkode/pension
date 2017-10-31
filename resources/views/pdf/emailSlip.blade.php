<html >

<?php
use App\Payroll;
?>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>



</head>

<body>

  
        <style type="text/css">

table {
  max-width: 100%;
  background-color: transparent;
}
th {
  text-align: left;
}
.table {
  width: 100%;
  margin-bottom: 50px;
}
hr {
  margin-top: 1px;
  margin-bottom: 2px;
  border: 0;
  border-top: 2px dotted #eee;
}

body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 12px;
  line-height: 1.428571429;
  color: #333;
  background-color: #fff;
}



 @page { margin: 30px 30px; }
 .header { position: fixed; left: 0px; top: -150px; right: 0px; height: 150px;  text-align: center; }
 .header1 { position: top; left: 0px; top: -150px; right: 0px; height: 150px;  text-align: center; }
 .content {margin-top: -100px; margin-bottom: -150px; margin-left:auto; margin-right: auto;}
 .footer { position: fixed; left: 0px; bottom: -180px; right: 0px; height: 50px;  }
 .footer .page:after { content: counter(page, upper-roman); }


</style>
        <div class="header1" style="margin-top:-150px">
     <table >

      <tr>


       
        <td style="width:150px">

            <img src="{{public_path().'/uploads/logo/'.$organization->logo}}" alt="logo" width="80%">

    
        </td>

        <td>
        <strong>
          {{ strtoupper($organization->name)}}
          </strong><br>
          {{ $organization->phone}}<br>
          {{ $organization->email}} <br>
          {{ $organization->website}}<br>
          {{ $organization->address}}
       

        </td>
        

      </tr>


      <tr>

        <hr>
      </tr>



    </table>
   </div>

<br>

<div class="footer">
     <p class="page">Page <?php $PAGE_NUM ?></p>
   </div>


  <div  class="content" style='margin-top:-50px;'>
     <table class="table table-bordered" border='1' cellspacing='0' cellpadding='0' style='width:350px'>
        <tr><td colspan="2" align="center"><strong>PERIOD : {{$period}}</strong></td></tr>
        <tr><td colspan='2'><strong>PERSONAL DETAILS</strong></td></tr>
        <tr><td>Payroll Number:</td><td>{{$transact->personal_file_number}}</td></tr>
      
      <tr><td>Employee Name: </td><td> {{$name}}</td>
      
      </tr>
      <tr><td>Identity Number: </td><td>{{$transact->identity_number}}</td></tr>
      <tr><td>Kra Pin: </td>
        @if($transact->pin != null || $transact->pin != '')
        <td>{{$transact->pin}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td>Nssf Number:</td>
        @if($transact->social_security_number != null || $transact->social_security_number != '')
        <td>{{$transact->social_security_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td>Nhif Number:</td>
        @if($transact->hospital_insurance_number != null || $transact->hospital_insurance_number != '')
        <td>{{$transact->hospital_insurance_number}}</td>
        @else
        <td></td>
        @endif
        </tr>
        <tr><td><strong>EARNINGS</strong></td>
        <td><strong>Amount ({{$currency->shortname}})</strong></td>
        </tr>
        <tr><td>Basic Pay: </td><td align='right'>{{ Payroll::asMoney($transact->basic_pay) }}</td></tr>

        @foreach($earnings as $earning)
        @if($earning->earning_name != null || $earning->earning_name != '')
        <tr><td>{{ $earning->earning_name }}: </td><td align='right'>{{ Payroll::asMoney($earning->earning_amount) }}</td></tr>
        @else
        @endif
       @endforeach

       @foreach($overtimes as $overtime)
        @if($overtime->overtime_type != null || $overtime->overtime_type != '')
        <tr><td>{{ 'Overtime Earning - '.$overtime->overtime_type }}: </td><td align='right'>{{ Payroll::asMoney((double)$overtime->overtimes) }}</td></tr>
        @else
        @endif
       @endforeach
        
        <tr><td><strong>ALLOWANCES</strong><td></td></td>
        </tr>
        @foreach($allws as $allw)
        @if($allw->allowance_name != null || $allw->allowance_name != '')
        <tr><td>{{ $allw->allowance_name }}: </td><td align='right'>{{ Payroll::asMoney($allw->allowance_amount) }}</td></tr>
        @else
        @endif
       @endforeach

       <tr><td><strong>GROSS PAY: </strong></td><td align='right'><strong>{{ Payroll::asMoney($transact->taxable_income) }}</strong></td></tr>
    
        @foreach($nontaxables as $nontaxable)
        @if($nontaxable->nontaxable_name != null || $nontaxable->nontaxable_name != '')
        <tr><td>{{ $nontaxable->nontaxable_name }}: </td><td align='right'>{{ Payroll::asMoney($nontaxable->nontaxable_amount) }}</td></tr>
        @else
        @endif
        @endforeach

        @foreach($rels as $rel)
        @if($rel->relief_name != null || $rel->relief_name != '')
        <tr><td>{{ $rel->relief_name }}: </td><td align='right'>{{ Payroll::asMoney($rel->relief_amount) }}</td></tr>
        @else
        @endif
        @endforeach

       <tr><td><strong>DEDUCTIONS</strong><td></td></td>
       <tr><td>Paye: </td><td align='right'>{{ Payroll::asMoney($transact->paye) }}</td></tr>
        <tr><td>Nssf: </td><td align='right'>{{ Payroll::asMoney($transact->nssf_amount) }}</td></tr>
        <tr><td>Nhif: </td><td align='right'>{{ Payroll::asMoney($transact->nhif_amount) }}</td></tr>
   
       @foreach($deds as $ded)
        @if($ded->deduction_name != null || $ded->deduction_name != '')
        <tr><td>{{ $ded->deduction_name }}: </td><td align='right'>{{ Payroll::asMoney($ded->deduction_amount) }}</td></tr>
        @else
        @endif
       @endforeach

        <tr><td><strong>TOTAL DEDUCTIONS
            : </strong></td><td align='right'><strong>{{ Payroll::asMoney($transact->total_deductions) }}</strong></td></tr>

        <tr><td><strong>NET PAY: </strong></td><td align='right'><strong>{{ Payroll::asMoney($transact->net) }}</strong></td></tr>
       
    </table><br>
<div style='width:300px'>I certify that the above information is correct and I have  received the payment, in full and final settlement</div>
<br>

 <table >
    <tr><td width="100"><strong>Employee Sign</strong>......................................................</td></tr>
    <tr><td width="100"><strong>Employer Sign</strong>......................................................</td></tr>
    <tr><td width="100"><strong>Date</strong>........................................................................</td></tr>
    <tr><td width="100"><strong>Stamp</strong></td></tr>
  </table>
</div>
<br><br>

</body>

</html>


