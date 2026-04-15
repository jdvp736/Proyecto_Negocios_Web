<?php

namespace Controllers\Mantenimientos\Ordenes;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Ordenes\Ordenes as OrdenesDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/ordenes/listado";

class Listado extends PublicController
{
    private array $ordenesList = [];

    public function run(): void
    {
        $this->ordenesList = OrdenesDAO::getAllOrdenes();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "ordenes" => $this->ordenesList
        ];
    }
}