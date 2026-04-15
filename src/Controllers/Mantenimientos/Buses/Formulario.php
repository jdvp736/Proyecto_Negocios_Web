<?php

namespace Controllers\Mantenimientos\Buses;

use Dao\Mantenimientos\Buses\Buses as BusesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const BUSES_FORM_URL = "index.php?page=Mantenimientos-Buses-Formulario";
const BUSES_LIST_URL = "index.php?page=Mantenimientos-Buses-Listado";
const XSRF_KEY = "Mantenimientos_Buses_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Bus",
        "UPD" => "Actualizar Bus %s",
        "DSP" => "Detalle del Bus %s",
        "DEL" => "Eliminando Bus %s"
    ];

    private array $accessControl = [
        "INS" => "buses_INS",
        "UPD" => "buses_UPD",
        "DEL" => "buses_DEL",
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Seguro que deseas eliminar este bus?"
    ];

    private $id;
    private $placa;
    private $tipo_id;
    private $estado;

    private array $tipos = [];

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
                        if (BusesDAO::crearBus(
                            $this->placa,
                            $this->tipo_id,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(BUSES_LIST_URL, "Bus creado correctamente");
                        }
                        break;

                    case "UPD":
                        if (BusesDAO::actualizarBus(
                            $this->id,
                            $this->placa,
                            $this->tipo_id,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(BUSES_LIST_URL, "Bus actualizado correctamente");
                        }
                        break;

                    case "DEL":
                        if (BusesDAO::eliminarBus($this->id) !== 0) {
                            Site::redirectToWithMsg(BUSES_LIST_URL, "Bus eliminado correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/buses/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(BUSES_LIST_URL, "Modo inválido");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(BUSES_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->tipos = BusesDAO::getTiposBus();
    }

    private function CargarDatos()
    {
        $tmp = BusesDAO::getBusById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(BUSES_LIST_URL, "Bus no encontrado");
        }

        $this->placa = $tmp["placa"];
        $this->tipo_id = $tmp["tipo_id"];
        $this->estado = $tmp["estado"];
    }

    private function CapturarDatos()
    {
        $this->id = intval($_POST["id"] ?? 0);
        $this->placa = $_POST["placa"] ?? '';
        $this->tipo_id = $_POST["tipo_id"] ?? '';
        $this->estado = $_POST["estado"] ?? '';
        $this->xsrfToken = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(BUSES_LIST_URL, "Error de seguridad (XSRF)");
        }

        $validateId = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->id);
        $this->viewData["id"] = $this->id;
        $this->viewData["placa"] = $this->placa;
        $this->viewData["tipo_id"] = $this->tipo_id;
        $this->viewData["estado"] = $this->estado;
        $this->viewData["tipos"] = $this->tipos;

        $this->viewData["isReadonly"] = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"] = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"] = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "buses_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}