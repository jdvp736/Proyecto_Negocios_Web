<?php

namespace Controllers\Mantenimientos\Ordenes;

use Dao\Mantenimientos\Ordenes\Ordenes as OrdenesDAO;
use Dao\Mantenimientos\Usuarios\Usuarios as UsuariosDAO;
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

    private $id = 0;
    private $usuario_id = 0;
    private $total = '';
    private $estado = '';
    private $fecha = '';

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
                        OrdenesDAO::crearOrden(
                            $this->usuario_id,
                            $this->total,
                            $this->estado
                        );
                        break;

                    case "UPD":
                        OrdenesDAO::actualizarOrden(
                            $this->id,
                            $this->usuario_id,
                            $this->total,
                            $this->estado
                        );
                        break;

                    case "DEL":
                        OrdenesDAO::eliminarOrden($this->id);
                        break;
                }

                Site::redirectToWithMsg(ORDENES_LIST_URL, "Operación realizada correctamente");
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

        if (isset($this->accessControl[$this->mode]) &&
            !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->usuarios = UsuariosDAO::getAllUsuarios();
    }

    private function CargarDatos()
    {
        $tmp = OrdenesDAO::getOrdenById($this->id);

        $this->usuario_id = $tmp["usuario_id"];
        $this->total      = $tmp["total"];
        $this->estado     = $tmp["estado"];
        $this->fecha      = $tmp["fecha"];
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
        return true;
    }

    private function GenerarViewData()
    {
        // 🔥 MARCAR USUARIO SELECCIONADO
        foreach ($this->usuarios as &$usuario) {
            $usuario["selected"] = ($usuario["id"] == $this->usuario_id) ? "selected" : "";
        }

        $this->viewData = [
            "mode" => $this->mode,
            "modeDsc" => sprintf($this->modes[$this->mode], $this->id),
            "id" => $this->id,
            "usuario_id" => $this->usuario_id,
            "total" => $this->total,
            "estado" => $this->estado,
            "fecha" => $this->fecha,
            "usuarios" => $this->usuarios,
            "isReadonly" => ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '',
            "hideConfirm" => $this->mode === 'DSP',
            "confirmToolTip" => $this->confirmTooltips[$this->mode],
            "xsrf_token" => $this->GenerateXSRFToken()
        ];
    }

    private function GenerateXSRFToken()
    {
        $tmp = md5(time());
        $_SESSION[XSRF_KEY] = $tmp;
        return $tmp;
    }
}