<?php

namespace Controllers\Seguridad\Usuarios;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Seguridad\Usuarios as UsuariosDAO;

const LIST_VIEW_TEMPLATE = "seguridad/usuarios/usuarios";

class Usuarios extends PublicController
{

    private array $usuariosList = [];

    public function run(): void
    {
        $this->usuariosList = UsuariosDAO::getAllUsuarios();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "usuarios" => $this->usuariosList
        ];
    }
}