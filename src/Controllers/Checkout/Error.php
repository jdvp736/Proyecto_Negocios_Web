<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Error extends PublicController
{
    public function run(): void
    {
        $viewData = array();

        $viewData["mensaje"] = "Hubo un problema al procesar el pago.";

        if (isset($_GET["msg"]) && $_GET["msg"] !== "") {
            $viewData["mensaje"] = $_GET["msg"];
        }

        unset($_SESSION["orderid"]);

        \Views\Renderer::render("paypal/error", $viewData);
    }
}