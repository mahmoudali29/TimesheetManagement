<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'project_id', 'task_name', 'date', 'hours'];

    // Relationships

    // Each timesheet belongs to a user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Each timesheet belongs to a project
    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
