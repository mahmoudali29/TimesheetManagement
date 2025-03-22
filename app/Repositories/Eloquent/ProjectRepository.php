<?php 
namespace App\Repositories\Eloquent;

use App\Models\Project;
use App\Repositories\BaseRepository;
use App\Repositories\Contracts\ProjectRepositoryInterface;

class ProjectRepository extends BaseRepository implements ProjectRepositoryInterface
{
    public function __construct(Project $model)
    {
        parent::__construct($model);
    }

    // You can override or extend specific project logic here
}
