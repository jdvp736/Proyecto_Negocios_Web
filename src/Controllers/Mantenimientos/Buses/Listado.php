<?php

namespace Controllers\Mantenimientos\Buses;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Buses\Buses as BusesDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/buses/listado";

class Listado extends PublicController
{
    private array $busesList = [];

    public function run(): void
    {
        $this->busesList = BusesDAO::getAllBuses();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "buses" => $this->busesList
        ];
    }
}