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

        if ($token !== "" && $session_token !== "" && $token == $session_token) {
            try {
                $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                    \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                    \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
                );

                $result = $PayPalRestApi->captureOrder($session_token);

                $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
                $dataview["paymentStatus"] = "Aprobado";
                $dataview["paymentMessage"] = "La compra de boletos fue procesada correctamente.";
            } catch (\Exception $ex) {
                $dataview["orderjson"] = $ex->getMessage();
                $dataview["paymentStatus"] = "Error";
                $dataview["paymentMessage"] = "No se pudo procesar la respuesta de PayPal.";
            }
        } else {
            $dataview["orderjson"] = "No hay una orden disponible para procesar.";
            $dataview["paymentStatus"] = "Sin orden";
            $dataview["paymentMessage"] = "No se encontró una transacción activa. Esto puede ocurrir si se accede directamente a esta pantalla.";
        }

        \Views\Renderer::render("paypal/accept", $dataview);
    }
}