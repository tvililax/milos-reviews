<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Album;

class AlbumController extends Controller
{
    public function index()
    {
        if ( request()->input('page') == 'all') {
            return Album::all();
        }
        return Album::with(['artist', 'cover'])->paginate(15);
    }

    public function store(Request $request)
    {
        return Album::create($request->all());
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
