<?php

namespace App\Http\Controllers;

use App\Models\Server;
use App\Models\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

use Illuminate\Http\Request as HttpRequest;

class ServerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try{
            $servers = Server::all();
            return response()->json(['data' => $servers], 200);
        } catch(\Exception $e){
            return response()->json(['message' => 'Failed to fetch data!'], 500);
        }
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(HttpRequest $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'url' => 'required|url',
            'protocol' => 'required|in:HTTP,HTTPS,FTP,SSH',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }
        
        
        try{
            $newServer = Server::create($request->only(['name', 'url', 'protocol']));
            return response()->json(['message'=>'New server created', 'data' => $newServer], 201);
        }catch(\Exception $e){
            return response()->json(['message' => $e->getMessage()], 500);
        }
    
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try{
            $server = Server::findOrFail($id);
            $recentRequests = $server->requests()->latest()->take(10)->get();

            return response()->json([
                'status'=>'success', 
                'server' => $server,
                'recent_requests' => $recentRequests
            ], 200);
        } catch (\Exception $e){
            return response()->json(['message' => 'Record not found!'], 404);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(HttpRequest $request, string $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'url' => 'sometimes|required|url',
            'protocol' => 'sometimes|required|in:HTTP,HTTPS,FTP,SSH',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => 'asfdafdasfaf'], 400);
        }
        
        try {
            $server = Server::findOrFail($id);
            $server->update($request->only(['name', 'url', 'protocol']));
            return response()->json(['message' => 'Server updated successfully', 'data' => $server], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update server', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $server = Server::findOrFail($id);
            $server->delete();
            return response()->json(['message' => 'Server deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete server', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Get request history for a specific server
     */
    public function requestHistory($id)
    {
        try {
            $server = Server::findOrFail($id);
            $history = $server->requests()->latest()->get();

            return response()->json(['data' => $history], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch request history', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Check if a server was healthy at a specific timestamp
     */
    public function healthAt($id, $timestamp)
    {
        try {
            $server = Server::findOrFail($id);

            $timestamp = Carbon::parse($timestamp);

            $recentRequests = $server->requests()
                ->where('created_at', '<=', $timestamp)
                ->orderBy('created_at', 'desc')
                ->take(5)
                ->get();
            
            $healthyCount = $recentRequests->where('status', 'Success')->count();
    
            if ($healthyCount >= 5) {
                $status = 'Healthy';
            } elseif ($recentRequests->count() - $healthyCount >= 3) {
                $status = 'Unhealthy';
            } else {
                $status = 'Unknown';
            }

            return response()->json(['message' => "Server was {$status} at the given timestamp"], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch health status', 'details' => $e->getMessage()], 500);
        }
    }
}
