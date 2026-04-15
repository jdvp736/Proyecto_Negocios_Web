<?php

namespace Dao\Mantenimientos\Usuarios;

use Dao\Table;

class Usuarios extends Table
{
    public static function getAllUsuarios(): array
    {
        $sqlstr = "SELECT 
                        u.id,
                        u.nombre,
                        u.email,
                        u.rol_id,
                        IFNULL(r.nombre, 'Sin rol') as rol,
                        u.estado,
                        u.creado_en
                   FROM usuarios u
                   LEFT JOIN roles r ON u.rol_id = r.id
                   ORDER BY u.nombre;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getUsuarioById(int $id): array
    {
        $sqlstr = "SELECT 
                        u.id,
                        u.nombre,
                        u.email,
                        u.rol_id,
                        u.estado
                   FROM usuarios u
                   WHERE u.id = :id;";
        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function crearUsuario(
        $nombre,
        $email,
        $password,
        $rol_id,
        $estado
    ): int {
        $sqlstr = "INSERT INTO usuarios (nombre, email, password, rol_id, estado)
                   VALUES (:nombre, :email, :password, :rol_id, :estado);";
        return self::executeNonQuery($sqlstr, [
            "nombre"   => $nombre,
            "email"    => $email,
            "password" => $password,
            "rol_id"   => $rol_id,
            "estado"   => $estado
        ]);
    }

    public static function actualizarUsuario(
        $id,
        $nombre,
        $email,
        $rol_id,
        $estado
    ): int {
        $sqlstr = "UPDATE usuarios
                   SET nombre  = :nombre,
                       email   = :email,
                       rol_id  = :rol_id,
                       estado  = :estado
                   WHERE id = :id;";
        return self::executeNonQuery($sqlstr, [
            "id"     => $id,
            "nombre" => $nombre,
            "email"  => $email,
            "rol_id" => $rol_id,
            "estado" => $estado
        ]);
    }

    public static function eliminarUsuario($id): int
    {
        $sqlstr = "DELETE FROM usuarios WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}