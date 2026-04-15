<?php

namespace Controllers\Mantenimientos\Viajes;

use Dao\Mantenimientos\Viajes\Viajes as ViajesDAO;
use Dao\Mantenimientos\Rutas\Rutas as RutasDAO;
use Dao\Mantenimientos\Buses\Buses as BusesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const VIAJES_FORM_URL = "index.php?page=Mantenimientos-Viajes-Formulario";
const VIAJES_LIST_URL = "index.php?page=Mantenimientos-Viajes-Listado";
const XSRF_KEY = "Mantenimientos_Viajes_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Viaje",
        "UPD" => "Actualizar Viaje %s",
        "DSP" => "Detalle del Viaje %s",
        "DEL" => "Eliminando Viaje %s"
    ];

    private array $accessControl = [
        "INS" => "viajes_INS",
        "UPD" => "viajes_UPD",
        "DEL" => "viajes_DEL",
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Seguro que deseas eliminar este viaje?"
    ];

    private $id;
    private $ruta_id;
    private $bus_id;
    private $fecha_salida;
    private $precio;
    private $estado;

    private array $rutas = [];
    private array $buses = [];

    private $xsrfToken = '';
    private $mode;

    public function run(): void
    {
        $this->LoadPage();

        if ($this->isPostBack()) {
            $this->CapturarDatos();

            if ($this->ValidarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (ViajesDAO::crearViaje(
                            $this->ruta_id,
                            $this->bus_id,
                            $this->fecha_salida,
                            $this->precio,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(VIAJES_LIST_URL, "Viaje creado correctamente");
                        }
                        break;

                    case "UPD":
                        if (ViajesDAO::actualizarViaje(
                            $this->id,
                            $this->ruta_id,
                            $this->bus_id,
                            $this->fecha_salida,
                            $this->precio,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(VIAJES_LIST_URL, "Viaje actualizado correctamente");
                        }
                        break;

                    case "DEL":
                        if (ViajesDAO::eliminarViaje($this->id) !== 0) {
                            Site::redirectToWithMsg(VIAJES_LIST_URL, "Viaje eliminado correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/viajes/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(VIAJES_LIST_URL, "Modo inválido");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(VIAJES_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->rutas = RutasDAO::getAllRutas();
        $this->buses = BusesDAO::getAllBuses();
    }

    private function CargarDatos()
    {
        $tmp = ViajesDAO::getViajeById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(VIAJES_LIST_URL, "Viaje no encontrado");
        }

        $this->ruta_id      = $tmp["ruta_id"];
        $this->bus_id       = $tmp["bus_id"];
        $this->fecha_salida = $tmp["fecha_salida"];
        $this->precio       = $tmp["precio"];
        $this->estado       = $tmp["estado"];
    }

    private function CapturarDatos()
    {
        $this->id           = intval($_POST["id"] ?? 0);
        $this->ruta_id      = intval($_POST["ruta_id"] ?? 0);
        $this->bus_id       = intval($_POST["bus_id"] ?? 0);
        $this->fecha_salida = $_POST["fecha_salida"] ?? '';
        $this->precio       = $_POST["precio"] ?? '';
        $this->estado       = $_POST["estado"] ?? '';
        $this->xsrfToken    = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(VIAJES_LIST_URL, "Error de seguridad (XSRF)");
        }

        $validateId = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"]         = $this->mode;
        $this->viewData["modeDsc"]      = sprintf($this->modes[$this->mode], $this->id);
        $this->viewData["id"]           = $this->id;
        $this->viewData["ruta_id"]      = $this->ruta_id;
        $this->viewData["bus_id"]       = $this->bus_id;
        $this->viewData["fecha_salida"] = $this->fecha_salida;
        $this->viewData["precio"]       = $this->precio;
        $this->viewData["estado"]       = $this->estado;
        $this->viewData["rutas"]        = $this->rutas;
        $this->viewData["buses"]        = $this->buses;

        $this->viewData["isReadonly"]     = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"]    = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"]     = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "viajes_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}