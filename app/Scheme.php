<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Scheme extends Model
{   

	protected $table = 'schemes';
    protected $primaryKey = 'id';

    protected $fillable = [
        'document_name', 'year','quarter','path','uploaded_by','type'
    ];


}
