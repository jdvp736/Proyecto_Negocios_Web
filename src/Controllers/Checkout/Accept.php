<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Accept extends PublicController
{
    public function run(): void
    {
        $dataview = array();

        $token = $_GET["token"] ?? "";
        $session_token = $_SESSION["orderid"] ?? "";

        if ($token !== "" && $token == $session_token) {

            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );

            $result = $PayPalRestApi->captureOrder($session_token);

            $usuario_id = \Utilities\Security::getUserId();

            $carrito = \Dao\Cart\Cart::getCarritoUsuario($usuario_id);

            $total = 0;
            foreach ($carrito as $item) {
                $total += $item["precio"] * $item["cantidad"];
            }

            $orden_id = \Dao\Ordenes\Ordenes::crearOrden(
                $usuario_id,
                $total,
                "COMPLETED"
            );

            foreach ($carrito as $item) {
                \Dao\Ordenes\Ordenes::agregarDetalle(
                    $orden_id,
                    $item["viaje_id"],
                    $item["cantidad"],
                    $item["precio"]
                );
            }

            $dataview["id"] = $result->id ?? "Sin ID";
            $dataview["status"] = $result->status ?? "COMPLETED";

            $dataview["nombre"] =
                ($result->payer->name->given_name ?? "Cliente") . " " .
                ($result->payer->name->surname ?? "");

            $dataview["email"] = $result->payer->email_address ?? "correo@ejemplo.com";

            $capture = $result->purchase_units[0]->payments->captures[0] ?? null;

            $dataview["monto"] = $capture->amount->value ?? "0.00";
            $dataview["moneda"] = $capture->amount->currency_code ?? "USD";

            \Dao\Cart\Cart::limpiarCarrito($usuario_id);

            unset($_SESSION["orderid"]);

        } else {

            $dataview["id"] = "N/A";
            $dataview["status"] = "COMPLETED";
            $dataview["nombre"] = "Cliente";
            $dataview["email"] = "correo@ejemplo.com";
            $dataview["monto"] = "0.00";
            $dataview["moneda"] = "USD";
        }

        \Views\Renderer::render("paypal/accept", $dataview);
    }
}