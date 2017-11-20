<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $primaryKey = 'product_id';

    protected $fillable = [
    				'name',
    				'category',
    				'quantity',
    				'price',
    				'description'
    				];
}
