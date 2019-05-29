<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SongStoreRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'title'     => 'required|string',
            'artist_id' => 'required|integer',
            'album_id'  => 'integer',
        ];
    }
}
