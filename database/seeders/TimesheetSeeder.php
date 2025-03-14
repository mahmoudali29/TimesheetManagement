<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Timesheet;
use App\Models\User;
use App\Models\Project;
use Faker\Factory as Faker;

class TimesheetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $users = User::all();
        $projects = Project::all();

        foreach ($users as $user) {
            foreach ($projects->random(2) as $project) { // Each user logs timesheets for 2 random projects
                Timesheet::create([
                    'user_id' => $user->id,
                    'project_id' => $project->id,
                    'task_name' => $faker->sentence(3),
                    'date' => $faker->date(),
                    'hours' => $faker->numberBetween(1, 8),
                ]);
            }
        }
    }
}
