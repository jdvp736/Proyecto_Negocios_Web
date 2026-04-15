<?php

namespace Dao\Catalogo;

use Dao\Table;

class ViajesCatalogo extends Table
{
    public static function getCatalogo()
    {
        $sql = "SELECT 
                    v.id,
                    r.origen,
                    r.destino,
                    b.placa,
                    tb.nombre AS tipo_bus,
                    v.fecha_salida,
                    v.precio
                FROM viajes v
                INNER JOIN rutas r ON v.ruta_id = r.id
                INNER JOIN buses b ON v.bus_id = b.id
                INNER JOIN tipos_bus tb ON b.tipo_id = tb.id -- 👈 ESTA ES LA CLAVE
                ORDER BY v.fecha_salida ASC;";

        return self::obtenerRegistros($sql, []);
    }
}