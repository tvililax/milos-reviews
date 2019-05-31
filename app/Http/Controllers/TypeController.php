<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Type;
class TypeController extends Controller
{
    public function index()
    {
        if ( !empty(request()->input('page')) )  {
            return Type::paginate(15);
        }
        return Type::all();
    }

    public function show($id)
    {
        return Artist::with(['albums'])->find($id);
    }

    public function store(TypeStoreRequest $request)
    {
        $type = Type::create($request->all());

        return response()->json($type, 201);
    }

    public function update(TypeStoreRequest $request, Type $type)
    {
        $type->update($request->all());

        return response()->json($type, 200);
    }

    public function destroy(Type $type)
    {
        $type->delete();

        return response()->json('Deleted', 204);
    }
}
