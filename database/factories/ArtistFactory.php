<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Artist;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

$factory->define(Artist::class, function (Faker $faker) {
    return [
        'first_name' => $faker->firstName,
        'last_name'  => $faker->lastName,
        'nickname'   => $faker->name,
        'birthdate'  => $faker->date($format = 'Y-m-d', $max = 'now'),
        'place'      => $faker->city,
        'bio'        => $faker->realText($faker->numberBetween(50,350))
    ];
});

