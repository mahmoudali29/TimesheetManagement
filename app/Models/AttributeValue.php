<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    use HasFactory;

    protected $fillable = ['attribute_id', 'project_id', 'value'];

    // Each attribute value belongs to one attribute
    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }

    // Each attribute value belongs to one project
    public function project()
    {
        return $this->belongsTo(Project::class);
    }


}
