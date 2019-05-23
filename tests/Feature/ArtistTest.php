<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ArtistTest extends TestCase
{
    use RefreshDatabase;
    public function testArtistShow()
    {
        $artist = factory(Artist::class)->create();
        $response = $this->json('GET', route('artists.show', ['artist' => $artist->id]));
        $response->assertStatus(200);
        $response->assertJsonStructure([
            'id',
            'first_name',
            'last_name',
            'nickname',
            'bio',
            'place',
            'birthdate'
        ]);
    }
}
