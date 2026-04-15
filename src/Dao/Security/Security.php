<?php
namespace Dao\Security;

use Exception;

class Security extends \Dao\Table
{


    static public function getAllUsuarios()
    {
        return self::obtenerRegistros("SELECT * FROM usuarios;", []);
    }

    static public function newUsuario($email, $password)
    {
        if (!\Utilities\Validators::IsValidEmail($email)) {
            throw new Exception("Correo no es válido");
        }

        if (!\Utilities\Validators::IsValidPassword($password)) {
            throw new Exception("Contraseña inválida");
        }

        $hashedPassword = self::_hashPassword($password);

        $sql = "INSERT INTO usuarios 
                (nombre, email, password, rol_id, estado, creado_en)
                VALUES (:nombre, :email, :password, 2, 1, NOW());";

        $result = self::executeNonQuery($sql, [
            "nombre" => explode("@", $email)[0],
            "email" => $email,
            "password" => $hashedPassword
        ]);

        $usuario = self::getUsuarioByEmail($email);

        if ($usuario) {
            self::executeNonQuery(
                "INSERT INTO roles_usuarios (usercod, rolescod, roleuserest)
                 VALUES (:usercod, 'usuario', 'ACT');",
                ["usercod" => $usuario["id"]]
            );
        }

        return $result;
    }

    static public function getUsuarioByEmail($email)
    {
        return self::obtenerUnRegistro(
            "SELECT * FROM usuarios WHERE email=:email;",
            ["email"=>$email]
        );
    }

    static public function addNewFeature($fncod, $fndsc = "", $fntyp = "CTR")
{
    return self::executeNonQuery(
        "INSERT INTO funciones (fncod, fndsc, fnest, fntyp)
         VALUES (:fncod, :fndsc, 'ACT', :fntyp)
         ON DUPLICATE KEY UPDATE fndsc = :fndsc;",
        [
            "fncod" => $fncod,
            "fndsc" => $fndsc,
            "fntyp" => $fntyp
        ]
    );
}



    static private function _saltPassword($password)
    {
        return hash_hmac(
            "sha256",
            $password,
            \Utilities\Context::getContextByKey("PWD_HASH")
        );
    }

    static private function _hashPassword($password)
    {
        return password_hash(self::_saltPassword($password), PASSWORD_BCRYPT);
    }

    static public function verifyPassword($raw, $hash)
    {
        return password_verify(self::_saltPassword($raw), $hash);
    }


    static public function getAllRoles()
    {
        return self::obtenerRegistros("SELECT * FROM roles;", []);
    }

    static public function addRolToUser($userId, $rolescod)
    {
        return self::executeNonQuery(
            "INSERT INTO roles_usuarios (usercod, rolescod, roleuserest)
             VALUES (:usercod, :rolescod, 'ACT');",
            [
                "usercod"=>$userId,
                "rolescod"=>$rolescod
            ]
        );
    }

    static public function removeRolFromUser($userId, $rolescod)
    {
        return self::executeNonQuery(
            "UPDATE roles_usuarios 
             SET roleuserest='INA'
             WHERE usercod=:usercod AND rolescod=:rolescod;",
            [
                "usercod"=>$userId,
                "rolescod"=>$rolescod
            ]
        );
    }

    static public function getRolesByUsuario($userId)
    {
        return self::obtenerRegistros(
            "SELECT * FROM roles_usuarios 
             WHERE usercod=:usercod AND roleuserest='ACT';",
            ["usercod"=>$userId]
        );
    }

    static public function isUsuarioInRol($userId, $rolescod)
    {
        $data = self::obtenerRegistros(
            "SELECT * FROM roles_usuarios 
             WHERE usercod=:usercod 
             AND rolescod=:rolescod 
             AND roleuserest='ACT'
             LIMIT 1;",
            [
                "usercod"=>$userId,
                "rolescod"=>$rolescod
            ]
        );

        return count($data) > 0;
    }

    static public function isAdmin($userId)
    {
        return self::isUsuarioInRol($userId, "admin");
    }



    static public function getAllFunciones()
    {
        return self::obtenerRegistros("SELECT * FROM funciones;", []);
    }

    static public function getFeature($fncod)
    {
        $data = self::obtenerRegistros(
            "SELECT * FROM funciones WHERE fncod=:fncod;",
            ["fncod"=>$fncod]
        );

        return count($data) > 0;
    }

    static public function getFeatureByUsuario($userId, $fncod)
    {
        $data = self::obtenerRegistros(
            "SELECT * FROM funciones_roles fr
             INNER JOIN roles_usuarios ru 
             ON fr.rolescod = ru.rolescod
             WHERE ru.usercod = :usercod
             AND fr.fncod = :fncod
             AND fr.fnrolest = 'ACT'
             AND ru.roleuserest = 'ACT'
             LIMIT 1;",
            [
                "usercod"=>$userId,
                "fncod"=>$fncod
            ]
        );

        return count($data) > 0;
    }

    static public function addFeatureToRol($fncod, $rolescod)
    {
        return self::executeNonQuery(
            "INSERT INTO funciones_roles (fncod, rolescod, fnrolest)
             VALUES (:fncod, :rolescod, 'ACT');",
            [
                "fncod"=>$fncod,
                "rolescod"=>$rolescod
            ]
        );
    }

    static public function removeFeatureFromRol($fncod, $rolescod)
    {
        return self::executeNonQuery(
            "UPDATE funciones_roles 
             SET fnrolest='INA'
             WHERE fncod=:fncod AND rolescod=:rolescod;",
            [
                "fncod"=>$fncod,
                "rolescod"=>$rolescod
            ]
        );
    }



    static public function updateUserRolId($userId, $rolId)
    {
        return self::executeNonQuery(
            "UPDATE usuarios SET rol_id = :rol_id WHERE id = :id",
            [
                "rol_id" => $rolId,
                "id" => $userId
            ]
        );
    }

    static public function deleteUsuario($userId)
    {
        return self::executeNonQuery(
            "DELETE FROM usuarios WHERE id = :id",
            ["id" => $userId]
        );
    }

    static public function updateUsuario($userId, $email, $estado)
    {
        return self::executeNonQuery(
            "UPDATE usuarios 
             SET email = :email, estado = :estado 
             WHERE id = :id",
            [
                "id" => $userId,
                "email" => $email,
                "estado" => $estado
            ]
        );
    }

    private function __construct(){}
    private function __clone(){}
}