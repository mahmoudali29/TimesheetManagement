<?php 
namespace App\Services;

use App\Repositories\Contracts\ProjectRepositoryInterface;
use Illuminate\Support\Facades\Log;

class ProjectService
{
    protected $projectRepo;

    public function __construct(ProjectRepositoryInterface $projectRepo)
    {
        $this->projectRepo = $projectRepo;
    }

    /**
     * Create a new project with optional logging or business rules.
     */
    public function create(array $data)
    {
        $project = $this->projectRepo->create($data);

        Log::info("Project created: {$project->name}");

        // Optional: send notifications, assign users, etc.

        return $project;
    }

    public function update(array $data, $id)
    {
        return $this->projectRepo->update($data, $id);
    }

    public function delete($id)
    {
        return $this->projectRepo->delete($id);
    }

    public function all()
    {
        return $this->projectRepo->all();
    }

    public function find($id)
    {
        return $this->projectRepo->find($id);
    }
}
