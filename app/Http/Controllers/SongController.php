<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\SongStoreRequest;
use App\Song;

class SongController extends Controller
{
    public function index()
    {
        return Song::with(['artist', 'album'])->paginate(15);
    }

    public function show($id)
    {
        return Song::with(['artist', 'album'])->find($id);
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