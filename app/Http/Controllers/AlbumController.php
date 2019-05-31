<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Album;
use App\Http\Requests\AlbumStoreRequest;

class AlbumController extends Controller
{
    public function index()
    {
        $albums = Album::with(['artist', 'cover']);

        if ( !empty(request()->input('page')) ) {
            return $albums->paginate(15);
        }
        return $albums->get();
    }

    public function store(AlbumStoreRequest $request)
    {
        $album = Album::create($request->all());

        $path  = $request->file('cover')->store('covers', ['disk' => 'public']);
        $cover = $album->cover()->create([
            'src'      => asset('/storage/'.$path),
            'album_id' => $album->id
        ]);

        $album->cover_id = $cover->id;
        $album->save();

        return response()->json($album, 201);
    }

    public function show($id)
    {
        return Album::with(['songs', 'artist'])->find($id);
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        Artist::delete($id);
    }
}
