<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Artist;
use App\Http\Requests\ArtistStoreRequest;

class ArtistController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/artists",
     *     @OA\Response(response="200", description="Return list of artists")
     * )
     */
    public function index()
    {

        if (request()->input('nickname')) {
            $artist = Artist::where('nickname', 'like', '%'.request()->input('nickname').'%');
        }

        if ( !empty(request()->input('page')) ) {
            return isset($artist) ? $artist->paginate(15) : Artist::paginate(15);
        }
        return isset($artist) ? $artist->get() : Artist::all();
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
