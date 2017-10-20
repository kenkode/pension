<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Mail;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public static function role()
    {
        
      $data = User::select('*')
               ->where('id', '=', Auth::user()->id)  
               ->get();

    return $data[0]->role;
    
    
    }

    public static function showUploadFile($request){

         ini_set('memory_limit','256M');
         ini_set('upload_max_filesize', '10M');

	     if($file = $request->file('thefile')){
	   
	      //Display File Name
	      //echo 'File Name: '.$file->getClientOriginalName();
	      //echo '<br>';
	   
	      //Display File Extension
	     // echo 'File Extension: '.$file->getClientOriginalExtension();
	      //echo '<br>';
	   
	      //Display File Real Path
	     // echo 'File Real Path: '.$file->getRealPath();
	      //echo '<br>';
	   
	      //Display File Size
	      //echo 'File Size: '.$file->getSize();
	      //echo '<br>';
	   
	      //Display File Mime Type
	      //echo 'File Mime Type: '.$file->getMimeType();
	      //echo '<br>';
	      //Move Uploaded File
	      $destinationPath = 'uploads';

	      $thefile=$file->move($destinationPath,$file->getClientOriginalName());

	      return $thefile;
	     }else{

	     	return 1;
	     }

     }

    public function send_mail($from,$from_name,$to,$subject,$msg){

    	$data = array( 'to' =>$to, 'subject' => $subject, 'from' =>$from,'from_name' =>$from_name);

		   Mail::raw($msg, function($message)use ($data)
			      {
				    $message->from($data['from'],$data['from_name']);

				    $message->to($data['to'])->subject($data['subject']);
			      });
    }

}
