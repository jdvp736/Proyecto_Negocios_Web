<?php

namespace Controllers\Mantenimientos\Ordenes;

use Dao\Mantenimientos\Ordenes\Ordenes;

class BuscarPorUsuario
{
    public function run(): void
    {
        $usuario_id = $_GET["usuario_id"] ?? 0;

        $orden = Ordenes::getOrdenByUsuario($usuario_id);

        header('Content-Type: application/json');

        echo json_encode($orden ?: []);
    }
}