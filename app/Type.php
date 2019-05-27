<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    protected $with = ['albums'];

    public function albums()
    {
        return $this->belongsToMany('App\Album');
    }
}
