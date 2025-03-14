<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AttributeValue;
use App\Models\Attribute;
use App\Models\Project;
class ProjectAttributeController extends Controller
{
    public function assignAttributes(Request $request, $projectId)
    {
        $project = Project::findOrFail($projectId);
    
        // Validate the request input properly
        $request->validate([
            'attributes' => 'required|array',
            'attributes.*.id' => 'required|exists:attributes,id',
            'attributes.*.value' => 'required',
        ]);
    
        // Get attributes from the request using input()
        $attributes = $request->input('attributes');
    
        foreach ($attributes as $attributeData) {
            $attribute = Attribute::find($attributeData['id']);
    
            if (!$attribute) {
                return response()->json(['message' => 'Attribute not found'], 404);
            }
    
            AttributeValue::updateOrCreate(
                ['attribute_id' => $attribute->id, 'project_id' => $project->id],
                ['value' => $attributeData['value']]
            );
        }
    
        return response()->json(['message' => 'Attributes assigned successfully']);
    }
    
}
