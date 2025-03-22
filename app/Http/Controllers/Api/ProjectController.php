<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\AttributeValue;
use Schema;
use App\Repositories\Contracts\ProjectRepositoryInterface;
class ProjectController extends Controller
{

    protected $projectRepo;

    public function __construct(ProjectRepositoryInterface $projectRepo)
    {
        $this->projectRepo = $projectRepo;
    }

    /**
     * Fetch all projects.
     */
    public function index()
    {
        return response()->json($this->projectRepo->all());
        //return response()->json(Project::all());
    }

    /**
     * Fetch a single project.
     */
    public function show($id)
    {
        return response()->json($this->projectRepo->find($id));
        //return response()->json(Project::findOrFail($id));
    }

    /**
     * Create a new project.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'status' => 'required|in:active,inactive',
        ]);

        $data = $request->validate([
            'name' => 'required',
            'status' => 'required|in:active,inactive'
        ]);
        return response()->json($this->projectRepo->create($data), 201);

        // $project = Project::create($request->all());

        // return response()->json($project, 201);
    }

    /**
     * Update a project.
     */
    public function update(Request $request, $id)
    {

        $data = $request->only(['name', 'status']);
        return response()->json($this->projectRepo->update($data, $id));

        // $project = Project::findOrFail($id);
        // $project->update($request->all());

        // return response()->json($project);
    }

    /**
     * Delete a project.
     */
    public function destroy($id)
    {

        $this->projectRepo->delete($id);
        return response()->json(['message' => 'Project deleted']);


        // Project::destroy($id);

        // return response()->json(['message' => 'Project deleted successfully']);
    }


    /**
     * Fetch a project with its attributes.
     */
    public function showWithAttributes($id)
    {
        $project = Project::with('attributeValues.attribute')->findOrFail($id);

        // Structure attributes as key-value pairs
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

        // Loop through each filter parameter in the request
        foreach ($request->query() as $attributeName => $value) {
            $query->whereHas('attributeValues', function ($q) use ($attributeName, $value) {
                $q->whereHas('attribute', function ($subQ) use ($attributeName) {
                    $subQ->where('name', $attributeName);
                })->where('value', $value);
            });
        }

        // Retrieve filtered projects with attributes
        $projects = $query->with('attributeValues.attribute')->get();

        // Format response
        $formattedProjects = $projects->map(function ($project) {
            $attributes = [];
            foreach ($project->attributeValues as $attrValue) {
                $attributes[$attrValue->attribute->name] = $attrValue->value;
            }

            return [
                'id' => $project->id,
                'name' => $project->name,
                'status' => $project->status,
                'attributes' => $attributes,
            ];
        });

        return response()->json($formattedProjects);
    }

 
 
    public function filterByDynamicAttributes(Request $request)
    {
        // Start with a base query
        $query = Project::query();
        
        // Get the filters from the request
        $filters = $request->input('filters', []);
        
        // Define allowed operators and their SQL equivalents
        $allowedOperators = [
            'eq' => '=',
            'gt' => '>',
            'lt' => '<',
            'like' => 'LIKE'
        ];
        
        // Process each filter
        foreach ($filters as $key => $values) {
            // Convert to array if it's not already
            $values = is_array($values) ? $values : [$values];
            
            // Check if this is an operator-based filter (e.g., name:like)
            if (str_contains($key, ':')) {
                [$field, $operatorKey] = explode(':', $key);
                
                // Validate operator
                if (!array_key_exists($operatorKey, $allowedOperators)) {
                    return response()->json(['error' => "Invalid operator: $operatorKey"], 400);
                }
                
                $operator = $allowedOperators[$operatorKey];
                
                // Apply filter as OR conditions within a group
                $query->where(function($q) use ($field, $operator, $values) {
                    foreach ($values as $value) {
                        // Format value for LIKE operator
                        $formattedValue = ($operator === 'LIKE') ? '%' . $value . '%' : $value;
                        
                        if (Schema::hasColumn('projects', $field)) {
                            $q->orWhere($field, $operator, $formattedValue);
                        } else {
                            $q->orWhereHas('attributeValues', function($subQ) use ($field, $operator, $formattedValue) {
                                $subQ->whereHas('attribute', function($attrQ) use ($field) {
                                    $attrQ->where('name', $field);
                                })->where('value', $operator, $formattedValue);
                            });
                        }
                    }
                });
            } else {
                // Simple equality filter without explicit operator
                $field = $key;
                
                // Apply filter as OR conditions within a group
                $query->where(function($q) use ($field, $values) {
                    foreach ($values as $value) {
                        if (Schema::hasColumn('projects', $field)) {
                            $q->orWhere($field, '=', $value);
                        } else {
                            $q->orWhereHas('attributeValues', function($subQ) use ($field, $value) {
                                $subQ->whereHas('attribute', function($attrQ) use ($field) {
                                    $attrQ->where('name', $field);
                                })->where('value', '=', $value);
                            });
                        }
                    }
                });
            }
        }
        
        // \Log::debug('SQL query: ' . $query->toSql());
        // \Log::debug('SQL bindings: ' . json_encode($query->getBindings()));
        
        // Include attribute values in the result
        $projects = $query->with('attributeValues.attribute')->get();
        
        // Format the response
        $formattedProjects = $projects->map(function ($project) {
            $attributes = [];
            foreach ($project->attributeValues as $attrValue) {
                $attributes[$attrValue->attribute->name] = $attrValue->value;
            }
            
            return [
                'id' => $project->id,
                'name' => $project->name,
                'status' => $project->status,
                'created_at' => $project->created_at,
                'updated_at' => $project->updated_at,
                'attributes' => $attributes,
            ];
        });
        
        return response()->json($formattedProjects);
    }



}

