<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Artist;

class ArtistController extends Controller
{
    public function index()
    {
        return Artist::without(['songs','albums'])->get();
    }
    public function show($artist)
    {
        return Artist::find($artist);
    }
    public function store(ArtistStoreRequest $request)
    {
        return Artist::create($request->all());
    }
}
