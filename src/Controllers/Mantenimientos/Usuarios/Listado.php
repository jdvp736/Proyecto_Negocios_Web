<?php

namespace Controllers\Mantenimientos\Usuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\Usuarios\Usuarios as UsuariosDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/usuarios/listado";

class Listado extends PrivateController
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