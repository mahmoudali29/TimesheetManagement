<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Project;
use Faker\Factory as Faker;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        for ($i = 1; $i <= 5; $i++) {
            Project::create([
                'name' => $faker->unique()->company,
                'status' => $faker->randomElement(['active', 'inactive']),
            ]);
        }
    }
}
