<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    protected $fillable = ['name'];
    protected $hidden = ['pivot', 'created_at', 'updated_at'];

    public function albums()
    {
        return $this->belongsToMany('App\Album');
    }
}
