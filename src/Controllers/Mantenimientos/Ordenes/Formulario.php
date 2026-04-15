<?php

namespace Controllers\Mantenimientos\Ordenes;

use Dao\Mantenimientos\Ordenes\Ordenes as OrdenesDAO;
use Dao\Mantenimientos\Usuarios\Usuarios as UsuariosDAO;
use Dao\Mantenimientos\Viajes\Viajes as ViajesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const ORDENES_FORM_URL = "index.php?page=Mantenimientos-Ordenes-Formulario";
const ORDENES_LIST_URL = "index.php?page=Mantenimientos-Ordenes-Listado";
const XSRF_KEY = "Mantenimientos_Ordenes_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nueva Orden",
        "UPD" => "Actualizar Orden %s",
        "DSP" => "Detalle de la Orden %s",
        "DEL" => "Eliminando Orden %s"
    ];

    private array $accessControl = [
        "INS" => "ordenes_INS",
        "UPD" => "ordenes_UPD",
        "DEL" => "ordenes_DEL",
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Seguro que deseas eliminar esta orden?"
    ];

    private $id;
    private $usuario_id;
    private $total;
    private $estado;

    private array $usuarios = [];

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
                        if (OrdenesDAO::crearOrden(
                            $this->usuario_id,
                            $this->total,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(ORDENES_LIST_URL, "Orden creada correctamente");
                        }
                        break;

                    case "UPD":
                        if (OrdenesDAO::actualizarOrden(
                            $this->id,
                            $this->usuario_id,
                            $this->total,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(ORDENES_LIST_URL, "Orden actualizada correctamente");
                        }
                        break;

                    case "DEL":
                        if (OrdenesDAO::eliminarOrden($this->id) !== 0) {
                            Site::redirectToWithMsg(ORDENES_LIST_URL, "Orden eliminada correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/ordenes/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(ORDENES_LIST_URL, "Modo inválido");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(ORDENES_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->usuarios = UsuariosDAO::getAllUsuarios();
    }

    private function CargarDatos()
    {
        $tmp = OrdenesDAO::getOrdenById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(ORDENES_LIST_URL, "Orden no encontrada");
        }

        $this->usuario_id = $tmp["usuario_id"];
        $this->total      = $tmp["total"];
        $this->estado     = $tmp["estado"];
    }

    private function CapturarDatos()
    {
        $this->id         = intval($_POST["id"] ?? 0);
        $this->usuario_id = intval($_POST["usuario_id"] ?? 0);
        $this->total      = $_POST["total"] ?? '';
        $this->estado     = $_POST["estado"] ?? '';
        $this->xsrfToken  = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(ORDENES_LIST_URL, "Error de seguridad (XSRF)");
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
        $this->viewData["usuario_id"]   = $this->usuario_id;
        $this->viewData["total"]        = $this->total;
        $this->viewData["estado"]       = $this->estado;
        $this->viewData["usuarios"]     = $this->usuarios;

        $this->viewData["isReadonly"]    = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"]   = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"]    = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "ordenes_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}