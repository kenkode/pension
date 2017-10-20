<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Education extends Model
{
	protected $fillable = [
        'document_name', 'description','path','uploaded_by','type'
    ];


    

     public function  create_document($name,$description,$path,$uploaded_by,$ext){
        
        $this->document_name = $name;
        $this->description=$description;
        $this->path=$path;
        $this->uploaded_by =$uploaded_by;
        $this->type= $ext;
        $this->save();
    }
}
