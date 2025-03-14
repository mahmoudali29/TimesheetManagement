<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'type', 'options'];

    protected $casts = [
        'options' => 'array', // Automatically decode JSON into an array
    ];

    // Define possible attribute types
    public static function getTypes()
    {
        return ['text', 'date', 'number', 'select'];
    }

    
}
