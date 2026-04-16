<?php

namespace Dao\Mantenimientos\Ordenes;

use Dao\Table;

class Ordenes extends Table
{
    // 🔥 LISTADO CON NOMBRE DE USUARIO
    public static function getAllOrdenes()
    {
        $sql = "SELECT 
                    o.id,
                    o.usuario_id,
                    u.nombre,
                    u.email,
                    o.total,
                    o.estado,
                    o.fecha
                FROM ordenes o
                INNER JOIN usuarios u 
                    ON o.usuario_id = u.id
                ORDER BY o.fecha DESC;";

        return self::obtenerRegistros($sql, []);
    }

    // 🔥 OBTENER ORDEN POR ID (CON USUARIO)
    public static function getOrdenById(int $id): array
    {
        $sqlstr = "SELECT 
                        o.id,
                        o.usuario_id,
                        u.nombre,
                        u.email,
                        o.total,
                        o.estado,
                        o.fecha
                   FROM ordenes o
                   INNER JOIN usuarios u 
                        ON o.usuario_id = u.id
                   WHERE o.id = :id;";

        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    // 🔥 OBTENER ÚLTIMA ORDEN POR USUARIO
    public static function getOrdenByUsuario($usuario_id)
    {
        $sql = "SELECT 
                    o.id,
                    o.usuario_id,
                    u.nombre,
                    u.email,
                    o.total,
                    o.estado,
                    o.fecha
                FROM ordenes o
                INNER JOIN usuarios u 
                    ON o.usuario_id = u.id
                WHERE o.usuario_id = :usuario_id
                ORDER BY o.fecha DESC 
                LIMIT 1;";

        return self::obtenerUnRegistro($sql, [
            "usuario_id" => $usuario_id
        ]);
    }

    // 🔥 CREAR ORDEN
    public static function crearOrden($usuario_id, $total, $estado): int
    {
        $sqlstr = "INSERT INTO ordenes (usuario_id, total, estado)
                   VALUES (:usuario_id, :total, :estado);";

        return self::executeNonQuery($sqlstr, [
            "usuario_id" => $usuario_id,
            "total"      => $total,
            "estado"     => $estado
        ]);
    }

    // 🔥 ACTUALIZAR ORDEN
    public static function actualizarOrden($id, $usuario_id, $total, $estado): int
    {
        $sqlstr = "UPDATE ordenes
                   SET usuario_id = :usuario_id,
                       total      = :total,
                       estado     = :estado
                   WHERE id = :id;";

        return self::executeNonQuery($sqlstr, [
            "id"         => $id,
            "usuario_id" => $usuario_id,
            "total"      => $total,
            "estado"     => $estado
        ]);
    }

    // 🔥 ELIMINAR ORDEN
    public static function eliminarOrden($id): int
    {
        $sqlstr = "DELETE FROM ordenes WHERE id = :id;";

        return self::executeNonQuery($sqlstr, [
            "id" => $id
        ]);
    }
}