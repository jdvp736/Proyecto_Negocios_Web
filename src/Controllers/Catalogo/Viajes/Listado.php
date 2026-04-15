<?php

namespace Controllers\Catalogo\Viajes;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Catalogo\ViajesCatalogo;

const VIEW_TEMPLATE = "catalogo/viajes/listado";

class Listado extends PublicController
{
    public function run(): void
    {
        $data = [
            "viajes" => ViajesCatalogo::getCatalogo()
        ];

        Renderer::render(VIEW_TEMPLATE, $data);
    }
}