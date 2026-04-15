<?php
namespace Dao\Mantenimientos\Usuarios;

use Dao\Table;

class Usuarios extends Table
{
    public static function getAllUsuarios()
    {
        $sql = "SELECT 
                    id,
                    nombre,
                    email,
                    rol_id,
                    estado,
                    creado_en
                FROM usuarios
                ORDER BY id DESC;";

        return self::obtenerRegistros($sql, []);
    }
}