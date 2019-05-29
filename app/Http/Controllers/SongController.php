<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Song;

class SongController extends Controller
{
    public function index()
    {
        return Song::with(['artist', 'album'])->paginate(15);
    }

    public function store(Request $request)
    {
        return Song::create($request->all());
    }

    public function show($id)
    {
        return Song::with(['artist', 'album'])->find($id);
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