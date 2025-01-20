<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;

class DevopsDummyController extends Controller
{
    public function consultarApiDevops()
    {
        try {
            $response = Http::get('http://devopsdummyholalaravelms.apps.preprodalcaldia.medellin.gov.co/mensaje/');
            return response()->json($response->json());
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Excepción al consultar API',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}





