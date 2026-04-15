<?php
namespace Dao\Mantenimientos\Viajes;

use Dao\Table;

class Viajes extends Table
{
    public static function getAllViajes()
    {
        $sql = "SELECT 
            v.id,
            CONCAT(r.origen, ' - ', r.destino) AS ruta,
            b.placa,
            t.nombre AS tipo_bus,
            v.fecha_salida,
            v.precio,
            v.estado
        FROM viajes v
        INNER JOIN rutas r ON v.ruta_id = r.id
        INNER JOIN buses b ON v.bus_id = b.id
        INNER JOIN tipos_bus t ON b.tipo_id = t.id
        ORDER BY v.fecha_salida DESC;";

        return self::obtenerRegistros($sql, []);
    }
}