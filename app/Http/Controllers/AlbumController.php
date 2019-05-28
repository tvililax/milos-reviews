<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Album;

class AlbumController extends Controller
{
    public function index()
    {
        return Album::with('artist')->get();
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
        //
    }
}
