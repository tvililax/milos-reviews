<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cover extends Model
{
    protected $with = ['album'];

    public function album()
    {
        return $this->hasOne('App\Album');
    }
}
