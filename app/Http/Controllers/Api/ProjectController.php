<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\AttributeValue;

class ProjectController extends Controller
{
    /**
     * Fetch a project with its attributes.
     */
    public function showWithAttributes($id)
    {
        $project = Project::with('attributeValues.attribute')->findOrFail($id);

        $attributes = [];
        foreach ($project->attributeValues as $attrValue) {
            $attributes[$attrValue->attribute->name] = $attrValue->value;
        }

        return response()->json([
            'id' => $project->id,
            'name' => $project->name,
            'status' => $project->status,
            'attributes' => $attributes,
        ]);
    }

    /**
     * Filter projects by attributes.
     */
    public function filterByAttributes(Request $request)
    {
        $query = Project::query();

        foreach ($request->query() as $attributeName => $value) {
            $query->whereHas('attributeValues.attribute', function ($q) use ($attributeName, $value) {
                $q->where('name', $attributeName)
                  ->whereHas('attributeValues', function ($subQ) use ($value) {
                      $subQ->where('value', $value);
                  });
            });
        }

        return response()->json($query->get());
    }
}

