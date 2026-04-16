<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;

class Detalle extends PrivateController
{
    public function run(): void
    {
        $viewData = array();

        $orden_id = $_GET["orden"] ?? 0;

        $detalle = \Dao\Ordenes\Ordenes::getDetalle($orden_id);

        $viewData["detalle"] = $detalle;

        \Views\Renderer::render("paypal/detalle", $viewData);
    }
}