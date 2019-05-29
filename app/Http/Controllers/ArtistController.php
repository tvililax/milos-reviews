<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Artist;

class ArtistController extends Controller
{
    public function index()
    {
        return Artist::paginate(15);
    }

    public function store(ArtistStoreRequest $request)
    {
        return Artist::create($request->all());
    }

    public function show($id)
    {
        return Artist::with(['albums', 'songs'])->find($id);
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
