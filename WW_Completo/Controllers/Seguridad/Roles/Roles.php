<?php

namespace Controllers\Seguridad\Roles;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Seguridad\Roles as RolesDAO;

const LIST_VIEW_TEMPLATE = "seguridad/roles/roles";

class Roles extends PublicController
{

    private array $rolesList = [];

    public function run(): void
    {
        $this->rolesList = RolesDAO::getAllRoles();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData()
    {
        return [
            "roles"=>$this->rolesList
        ];
    }
}