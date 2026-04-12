<?php

namespace Dao\Seguridad;

use Dao\Table;

class Funciones extends Table
{

    public static function getAllFunciones():array
    {
        $sqlstr="SELECT * FROM funciones;";
        return self::obtenerRegistros($sqlstr,[]);
    }

    public static function getFuncionById($fncod):array
    {
        $sqlstr="SELECT * FROM funciones WHERE fncod=:fncod;";
        return self::obtenerUnRegistro($sqlstr,["fncod"=>$fncod]);
    }

    public static function crearFuncion($fncod,$fndsc,$fnest,$fntyp):int
    {
        $sqlstr="INSERT INTO funciones (fncod,fndsc,fnest,fntyp)
                 VALUES (:fncod,:fndsc,:fnest,:fntyp);";

        return self::executeNonQuery($sqlstr,[
            "fncod"=>$fncod,
            "fndsc"=>$fndsc,
            "fnest"=>$fnest,
            "fntyp"=>$fntyp
        ]);
    }

    public static function actualizarFuncion($fncod,$fndsc,$fnest,$fntyp):int
    {
        $sqlstr="UPDATE funciones SET fndsc=:fndsc,fnest=:fnest,fntyp=:fntyp
                 WHERE fncod=:fncod;";

        return self::executeNonQuery($sqlstr,[
            "fncod"=>$fncod,
            "fndsc"=>$fndsc,
            "fnest"=>$fnest,
            "fntyp"=>$fntyp
        ]);
    }

    public static function eliminarFuncion($fncod):int
    {
        $sqlstr="DELETE FROM funciones WHERE fncod=:fncod;";
        return self::executeNonQuery($sqlstr,["fncod"=>$fncod]);
    }

}