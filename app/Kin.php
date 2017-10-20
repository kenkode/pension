<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kin extends Model
{
    protected $table = 'kin';
    protected $primaryKey = 'id';

    protected $fillable = [
    	            'kin_to',
    				'name',
    				'phone',
    				'address',
    				'relationship'
    				];
}
