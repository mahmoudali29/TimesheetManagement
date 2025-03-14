<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attribute;
use Illuminate\Validation\Rule;

class AttributeController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:attributes,name',
            'type' => ['required', Rule::in(['text', 'date', 'number', 'select'])],
            'options' => 'nullable|array', // Only required for 'select' type
        ]);

        $attribute = Attribute::create($request->all());

        return response()->json(['message' => 'Attribute created successfully', 'data' => $attribute], 201);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $attribute = Attribute::findOrFail($id);

        $request->validate([
            'name' => ['sometimes', 'string', Rule::unique('attributes')->ignore($attribute->id)],
            'type' => ['sometimes', Rule::in(['text', 'date', 'number', 'select'])],
            'options' => 'nullable|array',
        ]);

        $attribute->update([
            'name' => $request->name ?? $attribute->name,
            'type' => $request->type ?? $attribute->type,
            'options' => $request->type === 'select' ? json_encode($request->options) : $attribute->options,
        ]);

        return response()->json(['message' => 'Attribute updated successfully', 'data' => $attribute]);
    }

}
