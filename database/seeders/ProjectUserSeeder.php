<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Project;

class ProjectUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::all();
        $projects = Project::all();

        foreach ($users as $user) {
            $user->projects()->syncWithoutDetaching(
                $projects->random(2)->pluck('id')->toArray()
            );
        }
    }
}
