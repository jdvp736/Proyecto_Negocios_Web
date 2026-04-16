<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;

class Historial extends PrivateController
{
    public function run(): void
    {
        $viewData = array();

        $usuario_id = \Utilities\Security::getUserId();

        $historial = \Dao\Ordenes\Ordenes::getHistorial($usuario_id);

        $viewData["historial"] = $historial;

        \Views\Renderer::render("paypal/historial", $viewData);
    }
}