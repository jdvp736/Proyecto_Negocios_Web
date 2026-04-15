<?php

namespace Controllers\Mantenimientos\Pagos;

use Dao\Mantenimientos\Pagos\Pagos as PagosDAO;
use Dao\Mantenimientos\Ordenes\Ordenes as OrdenesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const PAGOS_FORM_URL = "index.php?page=Mantenimientos-Pagos-Formulario";
const PAGOS_LIST_URL = "index.php?page=Mantenimientos-Pagos-Listado";
const XSRF_KEY = "Mantenimientos_Pagos_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Pago",
        "UPD" => "Actualizar Pago %s",
        "DSP" => "Detalle del Pago %s",
        "DEL" => "Eliminando Pago %s"
    ];

    private array $accessControl = [
        "INS" => "pagos_INS",
        "UPD" => "pagos_UPD",
        "DEL" => "pagos_DEL",
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Seguro que deseas eliminar este pago?"
    ];

    private $id;
    private $orden_id;
    private $metodo;
    private $estado;
    private $transaction_id;

    private array $ordenes = [];

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
                        if (PagosDAO::crearPago(
                            $this->orden_id,
                            $this->metodo,
                            $this->estado,
                            $this->transaction_id
                        ) !== 0) {
                            Site::redirectToWithMsg(PAGOS_LIST_URL, "Pago creado correctamente");
                        }
                        break;

                    case "UPD":
                        if (PagosDAO::actualizarPago(
                            $this->id,
                            $this->orden_id,
                            $this->metodo,
                            $this->estado,
                            $this->transaction_id
                        ) !== 0) {
                            Site::redirectToWithMsg(PAGOS_LIST_URL, "Pago actualizado correctamente");
                        }
                        break;

                    case "DEL":
                        if (PagosDAO::eliminarPago($this->id) !== 0) {
                            Site::redirectToWithMsg(PAGOS_LIST_URL, "Pago eliminado correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/pagos/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(PAGOS_LIST_URL, "Modo inválido");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(PAGOS_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->ordenes = OrdenesDAO::getAllOrdenes();
    }

    private function CargarDatos()
    {
        $tmp = PagosDAO::getPagoById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(PAGOS_LIST_URL, "Pago no encontrado");
        }

        $this->orden_id       = $tmp["orden_id"];
        $this->metodo         = $tmp["metodo"];
        $this->estado         = $tmp["estado"];
        $this->transaction_id = $tmp["transaction_id"];
    }

    private function CapturarDatos()
    {
        $this->id             = intval($_POST["id"] ?? 0);
        $this->orden_id       = intval($_POST["orden_id"] ?? 0);
        $this->metodo         = $_POST["metodo"] ?? '';
        $this->estado         = $_POST["estado"] ?? '';
        $this->transaction_id = $_POST["transaction_id"] ?? '';
        $this->xsrfToken      = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(PAGOS_LIST_URL, "Error de seguridad (XSRF)");
        }

        $validateId = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        $this->viewData["mode"]           = $this->mode;
        $this->viewData["modeDsc"]        = sprintf($this->modes[$this->mode], $this->id);
        $this->viewData["id"]             = $this->id;
        $this->viewData["orden_id"]       = $this->orden_id;
        $this->viewData["metodo"]         = $this->metodo;
        $this->viewData["estado"]         = $this->estado;
        $this->viewData["transaction_id"] = $this->transaction_id;
        $this->viewData["ordenes"]        = $this->ordenes;

        $this->viewData["isReadonly"]     = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"]    = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"]     = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "pagos_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}