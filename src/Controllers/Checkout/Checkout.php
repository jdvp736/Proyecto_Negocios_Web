<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController
{
    public function run(): void
{
    $viewData = array();

    if (isset($_GET["viaje"])) {
        $usuario_id = \Utilities\Security::getUserId();
        \Dao\Cart\Cart::agregarAlCarrito($usuario_id, $_GET["viaje"]);

        \Utilities\Site::redirectTo("index.php?page=Checkout_Checkout");
    }

    if (isset($_GET["remove"])) {
        $usuario_id = \Utilities\Security::getUserId();
        \Dao\Cart\Cart::eliminarItem($usuario_id, $_GET["remove"]);

        \Utilities\Site::redirectTo("index.php?page=Checkout_Checkout");
    }

if (isset($_GET["add"])) {
    $usuario_id = \Utilities\Security::getUserId();
    \Dao\Cart\Cart::aumentarCantidad($usuario_id, $_GET["add"]);

    \Utilities\Site::redirectTo("index.php?page=Checkout_Checkout");
}

if (isset($_GET["less"])) {
    $usuario_id = \Utilities\Security::getUserId();
    \Dao\Cart\Cart::disminuirCantidad($usuario_id, $_GET["less"]);

    \Utilities\Site::redirectTo("index.php?page=Checkout_Checkout");
}

    $usuario_id = \Utilities\Security::getUserId();
    $carrito = \Dao\Cart\Cart::getCarritoUsuario($usuario_id);

    $total = 0;

    foreach ($carrito as &$item) {
        $item["subtotal"] = $item["precio"] * $item["cantidad"];
        $total += $item["subtotal"];
    }

    $viewData["carrito"] = $carrito;
    $viewData["total"] = $total;

    if ($this->isPostBack()) {

        $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
            "ORD" . time(),
            "http://localhost:8080/ProyectoNW/index.php?page=Checkout_Error",
            "http://localhost:8080/ProyectoNW/index.php?page=Checkout_Accept"
        );

        foreach ($carrito as $item) {
            $PayPalOrder->addItem(
                $item["origen"] . " - " . $item["destino"],
                "Viaje",
                "VIAJE_" . $item["viaje_id"],
                $item["precio"],
                0,
                $item["cantidad"],
                "DIGITAL_GOODS"
            );
        }

        $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
            \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
            \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
        );

        $PayPalRestApi->getAccessToken();
        $response = $PayPalRestApi->createOrder($PayPalOrder);

        $_SESSION["orderid"] = $response->id;

        foreach ($response->links as $link) {
            if ($link->rel == "approve") {
                \Utilities\Site::redirectTo($link->href);
            }
        }
        die();
    }

    \Views\Renderer::render("paypal/checkout", $viewData);
}
}