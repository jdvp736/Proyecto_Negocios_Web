<?php

namespace Controllers\Mantenimientos\Rutas;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\Rutas\Rutas as RutasDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/rutas/listado";

class Listado extends PrivateController
{
    private array $rutasList = [];

    public function run(): void
    {
        $this->rutasList = RutasDAO::getAllRutas();

        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "rutas" => $this->rutasList
        ];
    }
}