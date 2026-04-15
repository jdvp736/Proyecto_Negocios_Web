<?php

namespace Dao\Mantenimientos\Rutas;

use Dao\Table;

class Rutas extends Table
{
    public static function getAllRutas(): array
    {
        $sqlstr = "SELECT id, origen, destino, distancia_km
                   FROM rutas
                   ORDER BY origen, destino;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getRutaById(int $id): array
    {
        $sqlstr = "SELECT * FROM rutas WHERE id = :id;";
        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function crearRuta($origen, $destino, $distancia_km): int
    {
        $sqlstr = "INSERT INTO rutas (origen, destino, distancia_km)
                   VALUES (:origen, :destino, :distancia_km);";
        return self::executeNonQuery($sqlstr, [
            "origen"       => $origen,
            "destino"      => $destino,
            "distancia_km" => $distancia_km
        ]);
    }

    public static function actualizarRuta($id, $origen, $destino, $distancia_km): int
    {
        $sqlstr = "UPDATE rutas
                   SET origen       = :origen,
                       destino      = :destino,
                       distancia_km = :distancia_km
                   WHERE id = :id;";
        return self::executeNonQuery($sqlstr, [
            "id"           => $id,
            "origen"       => $origen,
            "destino"      => $destino,
            "distancia_km" => $distancia_km
        ]);
    }

    public static function eliminarRuta($id): int
    {
        $sqlstr = "DELETE FROM rutas WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}