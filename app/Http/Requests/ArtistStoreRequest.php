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
            'first_name' => 'required_without:nickname|string',
            'last_name'  => 'required_without:nickname|string',
            'nickname'   => 'required_without_all:last_name,first_name',
            'birthdate'  => 'date',
            'bio'        => 'required|longText',
            'place'      => 'required'
        ];
    }
}
