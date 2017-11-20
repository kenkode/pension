<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Remittedemployee extends Model
{
    //
    public function employee(){

        return $this->belongsTo('App\Employee');
    }

    public static function getCount($period){
       $count = Remittedemployee::join('remittances','remittedemployees.remittance_id','=','remittances.id')->where('period',$period)->count();
       return $count; 
    }
}
