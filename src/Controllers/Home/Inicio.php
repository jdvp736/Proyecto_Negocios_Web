<?php

namespace Controllers\Home;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Viajes\Viajes;
use Dao\Mantenimientos\Buses\Buses;
use Dao\Mantenimientos\Rutas\Rutas;

const VIEW_TEMPLATE = "home/inicio";

class Inicio extends PublicController
{
    public function run(): void
    {
        $data = [
            "viajes" => array_slice(Viajes::getAllViajes(), 0, 5),
            "buses" => array_slice(Buses::getAllBuses(), 0, 5),
            "rutas" => array_slice(Rutas::getAllRutas(), 0, 5)
        ];

        Renderer::render(VIEW_TEMPLATE, $data);
    }
}