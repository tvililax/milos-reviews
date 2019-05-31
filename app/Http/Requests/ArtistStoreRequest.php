<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ArtistStoreRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'nickname'    => 'required_without_all:last_name,first_name',
            'birthdate'   => 'date',
            'bio'         => 'required|min:3|max:2500',
            'image'       => 'required|mimes:jpeg,png',
            'place'       => 'required'
        ];
    }
}
