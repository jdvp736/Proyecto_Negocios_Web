<?php
namespace Dao\Mantenimientos\Ordenes;

use Dao\Table;

class Ordenes extends Table
{
    public static function getAllOrdenes()
    {
        $sql = "SELECT 
                    o.id,
                    u.nombre AS usuario,
                    u.email,
                    o.total,
                    o.estado,
                    o.fecha
                FROM ordenes o
                INNER JOIN usuarios u ON o.usuario_id = u.id
                ORDER BY o.fecha DESC;";

        return self::obtenerRegistros($sql, []);
    }
}