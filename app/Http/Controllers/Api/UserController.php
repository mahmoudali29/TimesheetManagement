<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Fetch all users.
     */
    public function index()
    {
        return response()->json(User::all());
    }

    /**
     * Fetch a single user.
     */
    public function show($id)
    {
        return response()->json(User::findOrFail($id));
    }

    /**
     * Create a new user.
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|string|email|unique:users,email',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        return response()->json($user, 201);
    }

    /**
     * Update a user.
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $user->update($request->all());

        return response()->json($user);
    }

    /**
     * Delete a user.
     */
    public function destroy($id)
    {
        User::destroy($id);

        return response()->json(['message' => 'User deleted successfully']);
    }
}
