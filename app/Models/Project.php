<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    // Relationships

    // A project can have multiple users (Many-to-Many)
    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    // A project can have multiple timesheets
    public function timesheets()
    {
        return $this->hasMany(Timesheet::class);
    }

    // A project can have multiple attribute values
    public function attributeValues()
    {
        return $this->hasMany(AttributeValue::class);
    }
}

