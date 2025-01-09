<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;

class DevopsDummyController extends Controller
{
    public function consultarApiDevops()
    {
        try {
            $response = Http::get('http://backend-laravel:8008/mensaje/');
            return response()->json($response->json());
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Excepción al consultar API',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}





