<?php

namespace Dao\Mantenimientos\Viajes;

use Dao\Table;

class Viajes extends Table
{
    public static function getAllViajes(): array
    {
        $sqlstr = "SELECT 
                        v.id,
                        v.ruta_id,
                        CONCAT(IFNULL(r.origen, '?'), ' → ', IFNULL(r.destino, '?')) as ruta,
                        v.bus_id,
                        IFNULL(b.placa, 'Sin bus asignado') as bus,
                        v.fecha_salida,
                        v.precio,
                        v.estado
                   FROM viajes v
                   LEFT JOIN rutas r ON v.ruta_id = r.id
                   LEFT JOIN buses b ON v.bus_id  = b.id
                   ORDER BY v.fecha_salida DESC;";

        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getViajeById(int $id): array
    {
        $sqlstr = "SELECT 
                        v.id,
                        v.ruta_id,
                        CONCAT(IFNULL(r.origen, '?'), ' → ', IFNULL(r.destino, '?')) as ruta,
                        v.bus_id,
                        IFNULL(b.placa, 'Sin bus asignado') as bus,
                        v.fecha_salida,
                        v.precio,
                        v.estado
                   FROM viajes v
                   LEFT JOIN rutas r ON v.ruta_id = r.id
                   LEFT JOIN buses b ON v.bus_id  = b.id
                   WHERE v.id = :id;";

        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function crearViaje(
        $ruta_id,
        $bus_id,
        $fecha_salida,
        $precio,
        $estado
    ): int {
        $sqlstr = "INSERT INTO viajes (ruta_id, bus_id, fecha_salida, precio, estado)
                   VALUES (:ruta_id, :bus_id, :fecha_salida, :precio, :estado);";

        return self::executeNonQuery($sqlstr, [
            "ruta_id"      => $ruta_id,
            "bus_id"       => $bus_id,
            "fecha_salida" => $fecha_salida,
            "precio"       => $precio,
            "estado"       => $estado
        ]);
    }

    public static function actualizarViaje(
        $id,
        $ruta_id,
        $bus_id,
        $fecha_salida,
        $precio,
        $estado
    ): int {
        $sqlstr = "UPDATE viajes
                   SET ruta_id      = :ruta_id,
                       bus_id       = :bus_id,
                       fecha_salida = :fecha_salida,
                       precio       = :precio,
                       estado       = :estado
                   WHERE id = :id;";

        return self::executeNonQuery($sqlstr, [
            "id"           => $id,
            "ruta_id"      => $ruta_id,
            "bus_id"       => $bus_id,
            "fecha_salida" => $fecha_salida,
            "precio"       => $precio,
            "estado"       => $estado
        ]);
    }

    public static function eliminarViaje($id): int
    {
        $sqlstr = "DELETE FROM viajes WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}