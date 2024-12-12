<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Server;
use App\Models\Request;
use App\Mail\ServerStatusChanged;
use Illuminate\Support\Facades\Mail;

class checkServers extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'check:servers';

    /**
     * The console command description.
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $servers = Server::all();
       
        foreach ($servers as $server) {
            $previousStatus = $server->status;
            $requestOfResponse = $this->requestToServer($server);

            // Log the request
            $this->logRequest($server, $requestOfResponse);

            // Update server health status
            $this->updateServerStatus($server, $previousStatus);

        }

        return Command::SUCCESS;
    }

     /**
     * Check the health status of a server.
     */
    private function requestToServer(Server $server)
    {
        $startTime = microtime(true);

        try {
            $protocol = strtolower($server->protocol);
            $status = false;

            if (in_array($protocol, ['http', 'https'])) {
                $headers = get_headers($server->url);
                $statusCode = intval(substr($headers[0], 9, 3));
                $status = $statusCode >= 200 && $statusCode < 300;
            } elseif ($protocol === 'ftp') {
                $conn = ftp_connect($server->url, 21, 10);
                $status = $conn && ftp_close($conn);
            } elseif ($protocol === 'ssh') {
                $conn = @fsockopen($server->url, 22, $errno, $errstr, 10);
                $status = $conn && fclose($conn);
            }
           
            $latency = microtime(true) - $startTime;

            if ($status && $latency < 45) {
                return 'Success';
            }
        } catch (\Exception $e) {
            \Log::error("Error checking server {$server->name}: " . $e->getMessage());
        }

        return 'Failure';
    }

    /**
     * Log the requests to the database.
     */
    private function logRequest(Server $server, $status)
    {
        Request::create([
            'server_id' => $server->id,
            'status' => $status,
        ]);
    }

    /**
     * Update the server's health status in the database.
     */
    private function updateServerStatus(Server $server, $previousStatus)
    {
        $recentRequests = $server->requests()->latest()->take(5)->get();
        $healthyCount = $recentRequests->where('status', 'Success')->count();

        if ($healthyCount >= 5) {
            $server->status = 'Healthy';
        } elseif ($recentRequests->count() - $healthyCount >= 3) {
            $server->status = 'Unhealthy';
        } else {
            $server->status = 'Unknown';
        }

        $server->save();

        // Send email if status has changed to Unhealthy
        if ($previousStatus === 'Healthy' AND $server->status === 'Unhealthy') {
            $this->sendStatusChangeEmail($server, 'Unhealthy');
         }
    }

    /**
     * Send an email notification when a server's status changes to Unhealthy
     */
    private function sendStatusChangeEmail(Server $server, $status)
    {
        try {
            Mail::to(env('SERVER_ADMIN', 'info@domain-admin.com'))->send(new ServerStatusChanged($server, $status));
        } catch (\Exception $e) {
            \Log::error("Failed to send status change email for server {$server->name}: " . $e->getMessage());
        }
    }
}
