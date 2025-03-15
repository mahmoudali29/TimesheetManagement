<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        // Static Test User
        User::create([
            'first_name' => 'Mahmoud',
            'last_name'  => 'Ali',
            'email'      => 'admin@admin.com',
            'password'   => Hash::make('password123'),
        ]);

        $faker = Faker::create();

        for ($i = 1; $i <= 10; $i++) {
            User::create([
                'first_name' => $faker->unique()->firstName,
                'last_name' => $faker->lastName,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('password123'),
            ]);
        }
    }
}
