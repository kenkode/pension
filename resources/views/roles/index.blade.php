@extends('layouts.app')
@section('content')




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


		<div class="panel panel-default">
			<div class="panel-heading">
    			<a class="btn btn-info btn-sm" href="{{ URL::to('roles/create')}}">new role</a>
  			</div>
  			<div class="panel-body">

				<table id="users" class="display compact table table-bordered table-striped" cellspacing="0" width="100%">
					<thead>
						
						<th>#</th>
						<th>Role</th>
						<th></th>
						
					</thead>
					<tbody><?php $i =1;?>
              			 @foreach($roles as $role)
              			 <tr>

                      <td>{{ $i }}</td>
               			
               			<td>{{ $role->name }}</td>
               			
               			<td>

               				<div class="btn-group">
  								<button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    								Action <span class="caret"></span>
  								</button>
  				
  								<ul class="dropdown-menu" role="menu">
                    <li><a href="{{URL::to('roles/show/'.$role->id)}}">Permissions</a></li>
    								<li><a href="{{URL::to('roles/edit/'.$role->id)}}">Edit</a></li>

    								
    								<!-- <li><a href="{{URL::to('roles/destroy/'.$role->id)}}">Delete</a></li> -->
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









@stop