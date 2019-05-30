<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cover extends Model
{
    protected $fillable = ['src', 'album_id'];

    public function album()
    {
        return $this->belongsTo('App\Album');
    }
}
