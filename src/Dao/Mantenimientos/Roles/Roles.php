<?php

namespace Dao\Mantenimientos\Roles;

use Dao\Table;

class Roles extends Table
{
    public static function getAllRoles(): array
    {
        $sqlstr = "SELECT id, nombre FROM roles ORDER BY nombre;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getRolById(int $id): array
    {
        $sqlstr = "SELECT * FROM roles WHERE id = :id;";
        $params = ["id" => $id];
        return self::obtenerUnRegistro($sqlstr, $params);
    }

    public static function crearRol($nombre): int
    {
        $sqlstr = "INSERT INTO roles (nombre) VALUES (:nombre);";
        return self::executeNonQuery($sqlstr, ["nombre" => $nombre]);
    }

    public static function actualizarRol($id, $nombre): int
    {
        $sqlstr = "UPDATE roles SET nombre = :nombre WHERE id = :id;";
        return self::executeNonQuery($sqlstr, [
            "id"     => $id,
            "nombre" => $nombre
        ]);
    }

    public static function eliminarRol($id): int
    {
        $sqlstr = "DELETE FROM roles WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}