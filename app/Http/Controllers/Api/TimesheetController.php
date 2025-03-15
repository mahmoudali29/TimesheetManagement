<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Timesheet;

class TimesheetController extends Controller
{
    /**
     * Fetch all timesheets.
     */
    public function index()
    {
        return response()->json(Timesheet::all());
    }

    /**
     * Fetch a single timesheet.
     */
    public function show($id)
    {
        return response()->json(Timesheet::findOrFail($id));
    }

    /**
     * Create a new timesheet.
     */
    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'project_id' => 'required|exists:projects,id',
            'task_name' => 'required|string',
            'date' => 'required|date',
            'hours' => 'required|integer|min:1|max:24',
        ]);

        $timesheet = Timesheet::create($request->all());

        return response()->json($timesheet, 201);
    }

    /**
     * Update a timesheet.
     */
    public function update(Request $request, $id)
    {
        $timesheet = Timesheet::findOrFail($id);
        $timesheet->update($request->all());

        return response()->json($timesheet);
    }

    /**
     * Delete a timesheet.
     */
    public function destroy($id)
    {
        Timesheet::destroy($id);

        return response()->json(['message' => 'Timesheet deleted successfully']);
    }
}
