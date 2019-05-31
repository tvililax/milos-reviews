<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AlbumStoreRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'title'      => 'required|string',
            'artist_id'  => 'required|integer',
            'cover'      => 'required|mimes:jpeg,png',
            'type_ids'   => 'array|nullable',
            'type_ids.*' => 'exists:types,id', // check each item in the array
        ];
    }
}
