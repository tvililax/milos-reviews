<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class Song extends Model
{
    protected $fillable = ['title', 'duration', 'artist_id', 'album_id'];

    public function album()
    {
        return $this->belongsTo('App\Album');
    }

    public function artist()
    {
        return $this->belongsTo('App\Artist');
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function($model){
            $client = new Client();
            $result = $client->request('GET', 'http://api.musixmatch.com/ws/1.1/track.search', [
                'query' => [
                    'q_track'  => $model->title,
                    'q_artist' => $model->artist->nickname,
                    'apikey'   => env('MUSIXMATCH_KEY')
                ]
            ]);

            $result = json_decode($result->getBody()->getContents());
            $tracklist = $result->message->body->track_list;

            if ( !empty($tracklist) )
            {
                $model->lyrics_id = $tracklist[0]->track->track_id;
            }
        });
    }
}
