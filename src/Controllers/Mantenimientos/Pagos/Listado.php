<?php

namespace Controllers\Mantenimientos\Pagos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\Pagos\Pagos as PagosDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/pagos/listado";

class Listado extends PrivateController
{
    private array $pagosList = [];

    public function run(): void
    {
        $this->pagosList = PagosDAO::getAllPagos();

        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "pagos" => $this->pagosList
        ];
    }
}