<?php
namespace Dao\Mantenimientos\Pagos;

use Dao\Table;

class Pagos extends Table
{
    public static function getAllPagos()
    {
        $sql = "SELECT 
                    p.id,
                    p.orden_id,
                    u.nombre AS usuario,
                    p.metodo,
                    p.estado,
                    p.transaction_id,
                    p.fecha
                FROM pagos p
                INNER JOIN ordenes o ON p.orden_id = o.id
                INNER JOIN usuarios u ON o.usuario_id = u.id
                ORDER BY p.fecha DESC;";

        return self::obtenerRegistros($sql, []);
    }
}