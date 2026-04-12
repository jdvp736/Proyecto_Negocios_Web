<?php

namespace Controllers\Seguridad\Usuarios;

use Dao\Seguridad\Usuarios as UsuariosDAO;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;

const USUARIO_FORM_URL = "index.php?page=Seguridad-Usuarios-Usuario";
const USUARIOS_LIST_URL = "index.php?page=Seguridad-Usuarios-Usuarios";
const XSRF_KEY = "Seguridad_Usuario_Formulario";

class Usuario extends PublicController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Usuario",
        "UPD" => "Actualizar %s %s",
        "DSP" => "Detalle de %s %s",
        "DEL" => "Eliminando %s %s"
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Está seguro de eliminar el usuario?"
    ];

    private $usercod;
    private $useremail;
    private $username;
    private $userpswd;
    private $usertipo;
    private $userest;

    private $mode;
    private $xsrfToken = '';

    public function run(): void
    {

        $this->LoadPage();

        if ($this->isPostBack()) {
            $this->CapturarDatos();

            if ($this->ValidarDatos()) {

                switch ($this->mode) {

                    case "INS":
                        UsuariosDAO::crearUsuario(
                            $this->useremail,
                            $this->username,
                            $this->userpswd,
                            $this->usertipo,
                            $this->userest
                        );
                        Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario creado");
                        break;

                    case "UPD":
                        UsuariosDAO::actualizarUsuario(
                            $this->usercod,
                            $this->useremail,
                            $this->username,
                            $this->userpswd,
                            $this->usertipo,
                            $this->userest
                        );
                        Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario actualizado");
                        break;

                    case "DEL":
                        UsuariosDAO::eliminarUsuario($this->usercod);
                        Site::redirectToWithMsg(USUARIOS_LIST_URL, "Usuario eliminado");
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("seguridad/usuarios/usuario", $this->viewData);
    }

    private function LoadPage()
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectTo(USUARIOS_LIST_URL);
        }

        $this->usercod = intval($_GET["id"] ?? 0);

        if ($this->mode !== "INS") {
            $this->CargarDatos();
        }
    }

    private function CargarDatos()
    {
        $usuario = UsuariosDAO::getUsuarioById($this->usercod);

        $this->useremail = $usuario["useremail"];
        $this->username = $usuario["username"];
        $this->userpswd = $usuario["userpswd"];
        $this->usertipo = $usuario["usertipo"];
        $this->userest = $usuario["userest"];
    }

    private function CapturarDatos()
    {
        $this->usercod = intval($_POST["usercod"] ?? 0);
        $this->useremail = $_POST["useremail"] ?? '';
        $this->username = $_POST["username"] ?? '';
        $this->userpswd = $_POST["userpswd"] ?? '';
        $this->usertipo = $_POST["usertipo"] ?? '';
        $this->userest = $_POST["userest"] ?? '';
        $this->xsrfToken = $_POST["uuid"] ?? '';
    }

    private function ValidarDatos()
    {
        return true;
    }

    private function GenerarViewData()
    {

        $this->viewData["mode"] = $this->mode;
        $this->viewData["modeDsc"] = sprintf($this->modes[$this->mode], $this->usercod, $this->username);

        $this->viewData["usercod"] = $this->usercod;
        $this->viewData["useremail"] = $this->useremail;
        $this->viewData["username"] = $this->username;
        $this->viewData["userpswd"] = $this->userpswd;
        $this->viewData["usertipo"] = $this->usertipo;
        $this->viewData["userest"] = $this->userest;

        $this->viewData["isReadonly"] = ($this->mode === "DSP" || $this->mode === "DEL") ? "readonly" : "";
        $this->viewData["hideConfirm"] = $this->mode === "DSP";
        $this->viewData["confirmToolTip"] = $this->confirmTooltips[$this->mode];
    }
}