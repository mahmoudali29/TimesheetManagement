<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Attribute;
use App\Models\Project;
use App\Models\AttributeValue;
use Faker\Factory as Faker;

class AttributeValueSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $projects = Project::all();
        $attributes = Attribute::all();

        foreach ($projects as $project) {
            foreach ($attributes as $attribute) {
                $value = null;

                switch ($attribute->type) {
                    case 'text':
                        $value = $faker->word;
                        break;
                    case 'date':
                        $value = $faker->date();
                        break;
                    case 'number':
                        $value = $faker->randomNumber(5);
                        break;
                    case 'select':
                        $options = json_decode($attribute->options, true);
                        $value = $options ? $faker->randomElement($options) : null;
                        break;
                }

                if ($value !== null) {
                    AttributeValue::create([
                        'attribute_id' => $attribute->id,
                        'project_id' => $project->id,
                        'value' => $value,
                    ]);
                }
            }
        }
    }
}

