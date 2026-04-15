<?php
namespace Dao\Mantenimientos\Rutas;

use Dao\Table;

class Rutas extends Table
{
    public static function getAllRutas()
    {
        $sql = "SELECT 
                    id,
                    origen,
                    destino,
                    distancia_km
                FROM rutas
                ORDER BY id DESC;";

        return self::obtenerRegistros($sql, []);
    }
}