<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Attribute;

class AttributeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $attributes = [
            [
                'name' => 'department',
                'type' => 'select',
                'options' => json_encode(["IT", "HR", "Finance", "Marketing"]),
            ],
            [
                'name' => 'start_date',
                'type' => 'date',
                'options' => null, // No options needed for date type
            ],
            [
                'name' => 'end_date',
                'type' => 'date',
                'options' => null,
            ],
            [
                'name' => 'budget',
                'type' => 'number',
                'options' => null,
            ],
            [
                'name' => 'priority',
                'type' => 'select',
                'options' => json_encode(["Low", "Medium", "High"]),
            ],
        ];

        foreach ($attributes as $attribute) {
            Attribute::create($attribute);
        }
    }
}
