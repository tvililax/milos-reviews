<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    protected $fillable = ['name'];
    protected $hidden = ['pivot'];

    public function albums()
    {
        return $this->belongsToMany('App\Album');
    }
}
