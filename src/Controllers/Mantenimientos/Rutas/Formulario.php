<?php

namespace Controllers\Mantenimientos\Rutas;

use Dao\Mantenimientos\Rutas\Rutas as RutasDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const RUTAS_FORM_URL = "index.php?page=Mantenimientos-Rutas-Formulario";
const RUTAS_LIST_URL = "index.php?page=Mantenimientos-Rutas-Listado";
const XSRF_KEY = "Mantenimientos_Rutas_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nueva Ruta",
        "UPD" => "Actualizar Ruta %s",
        "DSP" => "Detalle de la Ruta %s",
        "DEL" => "Eliminando Ruta %s"
    ];

    private array $accessControl = [
        "INS" => "rutas_INS",
        "UPD" => "rutas_UPD",
        "DEL" => "rutas_DEL",
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Seguro que deseas eliminar esta ruta?"
    ];

    private $id;
    private $origen;
    private $destino;
    private $distancia_km;

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
                        if (RutasDAO::crearRuta(
                            $this->origen,
                            $this->destino,
                            $this->distancia_km
                        ) !== 0) {
                            Site::redirectToWithMsg(RUTAS_LIST_URL, "Ruta creada correctamente");
                        }
                        break;

                    case "UPD":
                        if (RutasDAO::actualizarRuta(
                            $this->id,
                            $this->origen,
                            $this->destino,
                            $this->distancia_km
                        ) !== 0) {
                            Site::redirectToWithMsg(RUTAS_LIST_URL, "Ruta actualizada correctamente");
                        }
                        break;

                    case "DEL":
                        if (RutasDAO::eliminarRuta($this->id) !== 0) {
                            Site::redirectToWithMsg(RUTAS_LIST_URL, "Ruta eliminada correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/rutas/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(RUTAS_LIST_URL, "Modo inválido");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(RUTAS_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }
    }

    private function CargarDatos()
    {
        $tmp = RutasDAO::getRutaById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(RUTAS_LIST_URL, "Ruta no encontrada");
        }

        $this->origen       = $tmp["origen"];
        $this->destino      = $tmp["destino"];
        $this->distancia_km = $tmp["distancia_km"];
    }

    private function CapturarDatos()
    {
        $this->id           = intval($_POST["id"] ?? 0);
        $this->origen       = $_POST["origen"] ?? '';
        $this->destino      = $_POST["destino"] ?? '';
        $this->distancia_km = $_POST["distancia_km"] ?? '';
        $this->xsrfToken    = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(RUTAS_LIST_URL, "Error de seguridad (XSRF)");
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
        $this->viewData["origen"]       = $this->origen;
        $this->viewData["destino"]      = $this->destino;
        $this->viewData["distancia_km"] = $this->distancia_km;

        $this->viewData["isReadonly"]     = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"]    = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"]     = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "rutas_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}