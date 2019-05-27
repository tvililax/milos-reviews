<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Artist extends Model
{
    protected $with = ['songs', 'albums'];

    public function Albums()
    {
        return $this->hasMany('App\Album');
    }

    public function Songs()
    {
        return $this->hasMany('App\Song');
    }
}
