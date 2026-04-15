<?php
namespace Dao\Mantenimientos\Buses;

use Dao\Table;

class Buses extends Table
{
    public static function getAllBuses()
    {
        $sql = "SELECT b.id, b.placa, b.estado, t.nombre AS tipo
                FROM buses b
                LEFT JOIN tipos_bus t ON b.tipo_id = t.id;";
        return self::obtenerRegistros($sql, []);
    }
}