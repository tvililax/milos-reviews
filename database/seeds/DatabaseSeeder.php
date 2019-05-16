<?php

use Illuminate\Database\Seeder;
use App\Artist;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        factory(Artist::class, 50)->create();
    }
}
