<?php

namespace Dao\Seguridad;

use Dao\Table;

class Roles extends Table
{

    public static function getAllRoles(): array
    {
        $sqlstr = "SELECT * FROM roles;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getRolById($rolescod): array
    {
        $sqlstr = "SELECT * FROM roles WHERE rolescod = :rolescod;";
        return self::obtenerUnRegistro($sqlstr, ["rolescod"=>$rolescod]);
    }

    public static function crearRol($rolescod,$rolesdsc,$rolesest): int
    {
        $sqlstr = "INSERT INTO roles (rolescod,rolesdsc,rolesest)
                   VALUES (:rolescod,:rolesdsc,:rolesest);";

        return self::executeNonQuery($sqlstr,[
            "rolescod"=>$rolescod,
            "rolesdsc"=>$rolesdsc,
            "rolesest"=>$rolesest
        ]);
    }

    public static function actualizarRol($rolescod,$rolesdsc,$rolesest): int
    {
        $sqlstr = "UPDATE roles SET rolesdsc=:rolesdsc, rolesest=:rolesest
                   WHERE rolescod=:rolescod;";

        return self::executeNonQuery($sqlstr,[
            "rolescod"=>$rolescod,
            "rolesdsc"=>$rolesdsc,
            "rolesest"=>$rolesest
        ]);
    }

    public static function eliminarRol($rolescod): int
    {
        $sqlstr = "DELETE FROM roles WHERE rolescod=:rolescod;";
        return self::executeNonQuery($sqlstr,["rolescod"=>$rolescod]);
    }

}