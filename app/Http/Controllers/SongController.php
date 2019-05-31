<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\SongStoreRequest;
use App\Song;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class SongController extends Controller
{
    public function index()
    {
        $songs = Song::with(['artist', 'album']);
        if ( !empty(request()->input('page')) ) {
            return $songs->paginate(15);
        }
        return $songs->get();
    }

    public function show($id)
    {
        $song = Song::with(['artist', 'album'])->find($id);

        if ( !is_null($song))
        {
            $client = new Client();
            $result = $client->request('GET', 'http://api.musixmatch.com/ws/1.1/track.lyrics.get', [
                'query' => [
                    'track_id' => $song->lyrics_id,
                    'apikey'   => env('MUSIXMATCH_KEY')
                ]
            ]);

            $result = json_decode($result->getBody()->getContents());
            $body = $result->message->body;

            if ( !empty($body) )
            {
                $lyrics = $body->lyrics->lyrics_body;
                $song->lyrics = $lyrics;
            }
        }

        return $song;
    }

    public function store(SongStoreRequest $request)
    {
        $song = Song::create($request->all());

        return response()->json($song, 201);
    }

    public function update(SongStoreRequest $request, Song $song)
    {
        $song->update($request->all());

        return response()->json($song, 200);
    }

    public function destroy(Song $song)
    {
        $song->delete();

        return response()->json('Deleted', 204);
    }
}