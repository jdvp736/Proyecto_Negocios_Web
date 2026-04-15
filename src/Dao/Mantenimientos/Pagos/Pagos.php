<?php

namespace Dao\Mantenimientos\Pagos;

use Dao\Table;

class Pagos extends Table
{
    public static function getAllPagos(): array
    {
        $sqlstr = "SELECT 
                        p.id,
                        p.orden_id,
                        p.metodo,
                        p.estado,
                        p.transaction_id,
                        p.fecha
                   FROM pagos p
                   LEFT JOIN ordenes o ON p.orden_id = o.id
                   ORDER BY p.fecha DESC;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getPagoById(int $id): array
    {
        $sqlstr = "SELECT * FROM pagos WHERE id = :id;";
        return self::obtenerUnRegistro($sqlstr, ["id" => $id]);
    }

    public static function crearPago(
        $orden_id,
        $metodo,
        $estado,
        $transaction_id
    ): int {
        $sqlstr = "INSERT INTO pagos (orden_id, metodo, estado, transaction_id)
                   VALUES (:orden_id, :metodo, :estado, :transaction_id);";
        return self::executeNonQuery($sqlstr, [
            "orden_id"       => $orden_id,
            "metodo"         => $metodo,
            "estado"         => $estado,
            "transaction_id" => $transaction_id
        ]);
    }

    public static function actualizarPago(
        $id,
        $orden_id,
        $metodo,
        $estado,
        $transaction_id
    ): int {
        $sqlstr = "UPDATE pagos
                   SET orden_id       = :orden_id,
                       metodo         = :metodo,
                       estado         = :estado,
                       transaction_id = :transaction_id
                   WHERE id = :id;";
        return self::executeNonQuery($sqlstr, [
            "id"             => $id,
            "orden_id"       => $orden_id,
            "metodo"         => $metodo,
            "estado"         => $estado,
            "transaction_id" => $transaction_id
        ]);
    }

    public static function eliminarPago($id): int
    {
        $sqlstr = "DELETE FROM pagos WHERE id = :id;";
        return self::executeNonQuery($sqlstr, ["id" => $id]);
    }
}