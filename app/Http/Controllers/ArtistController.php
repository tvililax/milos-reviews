<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Artist;
use App\Http\Requests\ArtistStoreRequest;

class ArtistController extends Controller
{
    public function index()
    {
        if ( request()->input('page') == 'all') {
            return Artist::all();
        }
        return Artist::paginate(15);
    }

    public function show($id)
    {
        return Artist::with(['albums', 'songs'])->find($id);
    }

    public function store(ArtistStoreRequest $request)
    {
        $artist = Artist::create($request->all());

        $path  = $request->file('image')->store('images', ['disk' => 'public']);
        $artist->picture_src = asset('/storage/'.$path);
        $artist->save();

        return response()->json($artist, 201);
    }

    public function update(ArtistStoreRequest $request, Artist $artist)
    {
        $artist->update($request->all());

        return response()->json($artist, 200);
    }

    public function destroy(Artist $artist)
    {
        $artist->delete();

        return response()->json('Deleted', 204);
    }
}
