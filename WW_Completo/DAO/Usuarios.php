<?php

namespace Dao\Seguridad;

use Dao\Table;

class Usuarios extends Table
{
    /*
    usuario

    usercod bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    useremail varchar(80),
    username varchar(80),
    userpswd varchar(128),
    userfching datetime,
    userpswdest char(3),
    userpswdexp datetime,
    userest char(3),
    useractcod varchar(128),
    userpswdchg varchar(128),
    usertipo char(3)
    */

    public static function getAllUsuarios(): array
    {
        $usuarios = [];
        $sqlstr = "SELECT * from usuario;";
        $usuarios = self::obtenerRegistros($sqlstr, []);
        return $usuarios;
    }

    public static function getUsuarioById(int $usercod): array
    {
        $sqlstr = "SELECT * from usuario where usercod= :usercod;";
        $param = ["usercod" => $usercod];
        return self::obtenerUnRegistro($sqlstr, $param);
    }

    public static function crearUsuario(
        $useremail,
        $username,
        $userpswd,
        $usertipo,
        $userest
    ): int {
        $sqlstr = "insert into usuario (useremail, username, userpswd, usertipo, userest)
                   values (:useremail, :username, :userpswd, :usertipo, :userest);";

        $affectedRow = self::executeNonQuery($sqlstr, [
            "useremail" => $useremail,
            "username" => $username,
            "userpswd" => $userpswd,
            "usertipo" => $usertipo,
            "userest" => $userest
        ]);
        return $affectedRow;
    }

    public static function actualizarUsuario(
        $usercod,
        $useremail,
        $username,
        $userpswd,
        $usertipo,
        $userest
    ): int {
        $sqlstr = "update usuario set useremail = :useremail, username = :username,
                    userpswd = :userpswd, usertipo = :usertipo, userest = :userest
                    where usercod = :usercod;";

        $affectedRow = self::executeNonQuery($sqlstr, [
            "usercod" => $usercod,
            "useremail" => $useremail,
            "username" => $username,
            "userpswd" => $userpswd,
            "usertipo" => $usertipo,
            "userest" => $userest
        ]);
        return $affectedRow;
    }

    public static function eliminarUsuario(
        $usercod
    ): int {
        $sqlstr = "delete from usuario where usercod = :usercod;";

        $affectedRow = self::executeNonQuery($sqlstr, ["usercod" => $usercod]);
        return $affectedRow;
    }
}