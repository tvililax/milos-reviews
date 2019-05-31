<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Artist extends Model
{
    protected $fillable = ['nickname', 'first_name', 'last_name', 'bio', 'place'];

    public function albums()
    {
        return $this->hasMany('App\Album');
    }

    public function songs()
    {
        return $this->hasMany('App\Song');
    }
}
