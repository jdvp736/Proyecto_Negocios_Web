<?php

namespace Controllers\Mantenimientos\Viajes;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Viajes\Viajes as ViajesDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/viajes/listado";

class Listado extends PublicController
{
    private array $viajesList = [];

    public function run(): void
    {
        $this->viajesList = ViajesDAO::getAllViajes();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "viajes" => $this->viajesList
        ];
    }
}