<?php

namespace Dao\Ordenes;

class Ordenes extends \Dao\Table
{
    public static function crearOrden($usuario_id, $total, $estado)
    {
        $sql = "INSERT INTO ordenes (usuario_id, total, estado)
                VALUES (:usuario_id, :total, :estado)";

        self::executeNonQuery($sql, [
            "usuario_id" => $usuario_id,
            "total" => $total,
            "estado" => $estado
        ]);

        $row = self::obtenerUnRegistro("SELECT LAST_INSERT_ID() as id;", []);

        return $row["id"];
    }

    public static function agregarDetalle($orden_id, $viaje_id, $cantidad, $precio)
    {
        $sql = "INSERT INTO orden_detalle 
                (orden_id, viaje_id, cantidad, precio)
                VALUES (:orden_id, :viaje_id, :cantidad, :precio)";

        return self::executeNonQuery($sql, [
            "orden_id" => $orden_id,
            "viaje_id" => $viaje_id,
            "cantidad" => $cantidad,
            "precio" => $precio
        ]);
    }

    public static function getHistorial($usuario_id)
    {
        $sql = "SELECT * FROM ordenes 
                WHERE usuario_id = :usuario_id 
                ORDER BY fecha DESC";

        return self::obtenerRegistros($sql, [
            "usuario_id" => $usuario_id
        ]);
    }

    public static function getDetalle($orden_id)
    {
        $sql = "SELECT od.*, v.origen, v.destino
                FROM orden_detalle od
                INNER JOIN viajes v ON od.viaje_id = v.id
                WHERE od.orden_id = :orden_id";

        return self::obtenerRegistros($sql, [
            "orden_id" => $orden_id
        ]);
    }
}