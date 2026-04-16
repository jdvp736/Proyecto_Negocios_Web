<?php

namespace Controllers\Mantenimientos\Usuarios;

use Dao\Mantenimientos\Usuarios\Usuarios as UsuariosDAO;
use Dao\Mantenimientos\Roles\Roles as RolesDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;

const USUARIOS_FORM_URL = "index.php?page=Mantenimientos-Usuarios-Formulario";
const USUARIOS_LIST_URL = "index.php?page=Mantenimientos-Usuarios-Listado";
const XSRF_KEY = "Mantenimientos_Usuarios_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Usuario",
        "UPD" => "Actualizar Usuario %s",
        "DSP" => "Detalle del Usuario %s",
        "DEL" => "Eliminando Usuario %s"
    ];

    private $id;
    private $nombre;
    private $email;
    private $password;
    private $rol_id;
    private $estado;

    private array $roles = [];

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
                        if (UsuariosDAO::crearUsuario(
                            $this->nombre,
                            $this->email,
                            password_hash($this->password, PASSWORD_DEFAULT),
                            $this->rol_id,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario creado correctamente");
                        }
                        break;

                    case "UPD":
                        if (UsuariosDAO::actualizarUsuario(
                            $this->id,
                            $this->nombre,
                            $this->email,
                            $this->rol_id,
                            $this->estado
                        ) !== 0) {
                            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario actualizado correctamente");
                        }
                        break;

                    case "DEL":
                        if (UsuariosDAO::eliminarUsuario($this->id) !== 0) {
                            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario eliminado correctamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/usuarios/formulario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Modo inválido");
        }


        $this->id = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $this->id <= 0) {
            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Se requiere ID");
        }

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }

        $this->roles = RolesDAO::getAllRoles();
    }

    private function CargarDatos()
    {
        $tmp = UsuariosDAO::getUsuarioById($this->id);

        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario no encontrado");
        }

        $this->nombre   = $tmp["nombre"];
        $this->email    = $tmp["email"];
        $this->password = '';
        $this->rol_id   = $tmp["rol_id"];
        $this->estado   = $tmp["estado"];
    }

    private function CapturarDatos()
    {
        $this->id       = intval($_POST["id"] ?? 0);
        $this->nombre   = $_POST["nombre"] ?? '';
        $this->email    = $_POST["email"] ?? '';
        $this->password = $_POST["password"] ?? '';
        $this->rol_id   = intval($_POST["rol_id"] ?? 0);
        $this->estado   = intval($_POST["estado"] ?? 1);
        $this->xsrfToken = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';

        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(USUARIOS_LIST_URL, "Error de seguridad (XSRF)");
        }

        $validateId = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS" && $validateId !== $this->id) {
            return false;
        }

        return true;
    }

    private function GenerarViewData()
    {
        foreach ($this->roles as &$rol) {
            $rol["selected"] = ($rol["id"] == $this->rol_id) ? "selected" : "";
        }
        unset($rol);

        $this->viewData["mode"]     = $this->mode;
        $this->viewData["modeDsc"]  = sprintf($this->modes[$this->mode], $this->id);
        $this->viewData["id"]       = $this->id;
        $this->viewData["nombre"]   = $this->nombre;
        $this->viewData["email"]    = $this->email;
        $this->viewData["rol_id"]   = $this->rol_id;
        $this->viewData["estado"]   = $this->estado;
        $this->viewData["roles"]    = $this->roles;

        $this->viewData["isReadonly"]     = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["hideConfirm"]    = $this->mode === 'DSP';
        $this->viewData["confirmToolTip"] = $this->mode === "DEL" ? "¿Seguro que deseas eliminar este usuario?" : "";
        $this->viewData["xsrf_token"]     = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken()
    {
        $tmp = "usuarios_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmp);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}
