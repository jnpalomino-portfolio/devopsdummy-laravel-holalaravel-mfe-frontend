<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;

class RickAndMortyController extends Controller
{
    public function consultarApi()
    {
        try {
            $response = Http::get('https://rickandmortyapi.com/api/');
            return response()->json($response->json());
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Excepción al consultar API',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
