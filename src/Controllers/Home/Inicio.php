<?php

namespace Controllers\Home;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Buses\Buses;
use Dao\Mantenimientos\Viajes\Viajes;
use Dao\Mantenimientos\Rutas\Rutas;

const VIEW_TEMPLATE = "home/inicio";

class Inicio extends PublicController
{
    public function run(): void
    {
        $viajes = Viajes::getAllViajes();

        Renderer::render(VIEW_TEMPLATE, [
            "viajes" => $viajes,
            "totalBuses" => count(Buses::getAllBuses()),
            "totalViajes" => count($viajes),
            "totalRutas" => count(Rutas::getAllRutas())
        ]);
    }
}