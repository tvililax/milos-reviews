<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Album extends Model
{

    protected $with = ['cover', 'songs', 'types'];

    public function cover()
    {
        return $this->hasOne('App\Cover');
    }

    public function songs()
    {
        return $this->hasMany('App\Song');
    }

    public function artist()
    {
        return $this->belongsTo('App\Artist');
    }

    public function types()
    {
        return $this->belongsToMany('App\Type');
    }
}
