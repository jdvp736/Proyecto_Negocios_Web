<?php

namespace Dao\Cart;

class Cart extends \Dao\Table
{
    public static function getProductosDisponibles()
    {
        $sqlAllProductosActivos = "SELECT * from products where productStatus in ('ACT');";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array());

        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select productId, sum(crrctd) as reserved
            from carretilla where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productId;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("delta" => $deltaAutorizada)
        );

        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select productId, sum(crrctd) as reserved
            from carretillaanom where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productId;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("delta" => $deltaNAutorizada)
        );

        $productosCurados = array();

        foreach ($productosDisponibles as $producto) {
            $productosCurados[$producto["productId"]] = $producto;
        }

        foreach ($prodsCarretillaAutorizada as $producto) {
            if (isset($productosCurados[$producto["productId"]])) {
                $productosCurados[$producto["productId"]]["productStock"] -= $producto["reserved"];
            }
        }

        foreach ($prodsCarretillaNAutorizada as $producto) {
            if (isset($productosCurados[$producto["productId"]])) {
                $productosCurados[$producto["productId"]]["productStock"] -= $producto["reserved"];
            }
        }

        return $productosCurados;
    }

    public static function getProductoDisponible($productId)
    {
        $sql = "SELECT * from products where productStatus in ('ACT') and productId=:productId;";
        $productosDisponibles = self::obtenerRegistros($sql, ["productId" => $productId]);

        return $productosDisponibles;
    }

    public static function getProducto($productId)
    {
        $sql = "SELECT * from products where productId=:productId;";
        return self::obtenerRegistros($sql, ["productId" => $productId]);
    }

    public static function getCarritoByUsuario($usuario_id)
    {
        $sql = "SELECT * FROM carrito WHERE usuario_id = :usuario_id;";
        return self::obtenerUnRegistro($sql, ["usuario_id" => $usuario_id]);
    }

    public static function crearCarrito($usuario_id)
    {
        $sql = "INSERT INTO carrito (usuario_id) VALUES (:usuario_id);";
        self::executeNonQuery($sql, ["usuario_id" => $usuario_id]);
        return self::getLastInsertId();
    }

    public static function agregarAlCarrito($usuario_id, $viaje_id)
    {
        $carrito = self::getCarritoByUsuario($usuario_id);

        if (!$carrito) {
            $carrito_id = self::crearCarrito($usuario_id);
        } else {
            $carrito_id = $carrito["id"];
        }

        $sqlCheck = "SELECT * FROM carrito_detalle 
                     WHERE carrito_id = :carrito_id AND viaje_id = :viaje_id;";

        $existe = self::obtenerUnRegistro($sqlCheck, [
            "carrito_id" => $carrito_id,
            "viaje_id" => $viaje_id
        ]);

        if ($existe) {
            $sqlUpdate = "UPDATE carrito_detalle 
                          SET cantidad = cantidad + 1 
                          WHERE carrito_id = :carrito_id AND viaje_id = :viaje_id;";

            return self::executeNonQuery($sqlUpdate, [
                "carrito_id" => $carrito_id,
                "viaje_id" => $viaje_id
            ]);
        } else {
            $sqlInsert = "INSERT INTO carrito_detalle 
                          (carrito_id, viaje_id, cantidad, precio)
                          SELECT :carrito_id, v.id, 1, v.precio
                          FROM viajes v
                          WHERE v.id = :viaje_id;";

            return self::executeNonQuery($sqlInsert, [
                "carrito_id" => $carrito_id,
                "viaje_id" => $viaje_id
            ]);
        }
    }

    public static function getCarritoUsuario($usuario_id)
{
    $sql = "SELECT cd.*, 
                   r.origen, 
                   r.destino, 
                   v.precio
            FROM carrito c
            INNER JOIN carrito_detalle cd ON c.id = cd.carrito_id
            INNER JOIN viajes v ON cd.viaje_id = v.id
            INNER JOIN rutas r ON v.ruta_id = r.id
            WHERE c.usuario_id = :usuario_id;";

    return self::obtenerRegistros($sql, ["usuario_id" => $usuario_id]);
}

public static function limpiarCarrito($usuario_id)
{
    $sql = "DELETE cd FROM carrito_detalle cd
            INNER JOIN carrito c ON cd.carrito_id = c.id
            WHERE c.usuario_id = :usuario_id;";

    return self::executeNonQuery($sql, ["usuario_id" => $usuario_id]);
}

public static function eliminarItem($usuario_id, $viaje_id)
{
    $sql = "DELETE cd FROM carrito_detalle cd
            INNER JOIN carrito c ON cd.carrito_id = c.id
            WHERE c.usuario_id = :usuario_id
            AND cd.viaje_id = :viaje_id;";

    return self::executeNonQuery($sql, [
        "usuario_id" => $usuario_id,
        "viaje_id" => $viaje_id
    ]);
}
public static function aumentarCantidad($usuario_id, $viaje_id)
{
    $sql = "UPDATE carrito_detalle cd
            INNER JOIN carrito c ON cd.carrito_id = c.id
            SET cd.cantidad = cd.cantidad + 1
            WHERE c.usuario_id = :usuario_id
            AND cd.viaje_id = :viaje_id;";

    return self::executeNonQuery($sql, [
        "usuario_id" => $usuario_id,
        "viaje_id" => $viaje_id
    ]);
}

public static function disminuirCantidad($usuario_id, $viaje_id)
{
    $sql = "UPDATE carrito_detalle cd
            INNER JOIN carrito c ON cd.carrito_id = c.id
            SET cd.cantidad = cd.cantidad - 1
            WHERE c.usuario_id = :usuario_id
            AND cd.viaje_id = :viaje_id
            AND cd.cantidad > 1;";

    return self::executeNonQuery($sql, [
        "usuario_id" => $usuario_id,
        "viaje_id" => $viaje_id
    ]);
}
}

