@extends('layouts.app')
@section('content')

<div class="row">
	<div class="col-lg-12">
  <h3>Select Employee</h3>

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

		 <form target="_blank" method="POST" action="{{URL::to('reports/employeelist')}}" accept-charset="UTF-8">
   {{ csrf_field() }}
    <fieldset>
            <div class="form-group">
                        <label for="username">Select: <span style="color:red">*</span></label>
                        <select required name="status" class="form-control select2">
                            <option></option>
                            <option value="Active"> Active</option>
                            <option value="Deactive"> Deactive</option>
                            <option value="All">All</option>   
                        </select>
                
        </div>


         <div class="form-group">
                        <label for="username">Download as: <span style="color:red">*</span></label>
                        <select required name="format" class="form-control select2">
                            <option></option>
                            <option value="excel"> Excel</option>
                            <option value="pdf"> PDF</option>
                        </select>
                
            </div>


        
        <div class="form-actions form-group">
        
          <button type="submit" class="btn btn-primary btn-sm">Select Employee</button>
        </div>

    </fieldset>
</form>
		

  </div>

</div>
























@stop