<?php

namespace Dao\Mantenimientos\Buses;

use Dao\Table;

class Buses extends Table
{
    public static function getAllBuses(): array
    {
        $buses = [];
        $sqlstr = "SELECT 
                        b.id,
                        b.placa,
                        b.tipo_id,
                        IFNULL(t.nombre, 'Sin tipo') as tipo,
                        b.estado
                   FROM buses b
                   LEFT JOIN tipos_bus t ON b.tipo_id = t.id;";

        $buses = self::obtenerRegistros($sqlstr, []);
        return $buses;
    }

    public static function getBusById(int $id): array
    {
        $sqlstr = "SELECT * FROM buses WHERE id = :id;";
        $params = ["id" => $id];

        return self::obtenerUnRegistro($sqlstr, $params);
    }

    public static function crearBus(
        $placa,
        $tipo_id,
        $estado
    ): int {
        $sqlstr = "INSERT INTO buses (placa, tipo_id, estado)
                   VALUES (:placa, :tipo_id, :estado);";

        $affectedRows = self::executeNonQuery($sqlstr, [
            "placa" => $placa,
            "tipo_id" => $tipo_id,
            "estado" => $estado
        ]);

        return $affectedRows;
    }

    public static function actualizarBus(
        $id,
        $placa,
        $tipo_id,
        $estado
    ): int {
        $sqlstr = "UPDATE buses 
                   SET placa = :placa,
                       tipo_id = :tipo_id,
                       estado = :estado
                   WHERE id = :id;";

        $affectedRows = self::executeNonQuery($sqlstr, [
            "id" => $id,
            "placa" => $placa,
            "tipo_id" => $tipo_id,
            "estado" => $estado
        ]);

        return $affectedRows;
    }

    public static function eliminarBus($id): int
    {
        $sqlstr = "DELETE FROM buses WHERE id = :id;";
        $affectedRows = self::executeNonQuery($sqlstr, [
            "id" => $id
        ]);

        return $affectedRows;
    }

    public static function getTiposBus(): array
    {
        $tipos = [];
        $sqlstr = "SELECT id, nombre FROM tipos_bus ORDER BY nombre;";

        $tipos = self::obtenerRegistros($sqlstr, []);
        return $tipos;
    }
}