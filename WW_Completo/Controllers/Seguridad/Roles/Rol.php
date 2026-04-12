<?php

namespace Controllers\Seguridad\Roles;

use Dao\Seguridad\Roles as RolesDAO;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;

const ROLES_FORM_URL="index.php?page=Seguridad-Roles-Rol";
const ROLES_LIST_URL="index.php?page=Seguridad-Roles-Roles";

class Rol extends PublicController
{

    private array $viewData=[];

    private $rolescod;
    private $rolesdsc;
    private $rolesest;

    private $mode;

    public function run():void
    {

        $this->mode=$_GET["mode"]??"";

        $this->rolescod=$_GET["id"]??"";

        if($this->mode!="INS"){
            $this->loadData();
        }

        if($this->isPostBack()){
            $this->rolescod=$_POST["rolescod"];
            $this->rolesdsc=$_POST["rolesdsc"];
            $this->rolesest=$_POST["rolesest"];

            switch($this->mode){

                case "INS":
                    RolesDAO::crearRol(
                        $this->rolescod,
                        $this->rolesdsc,
                        $this->rolesest
                    );
                break;

                case "UPD":
                    RolesDAO::actualizarRol(
                        $this->rolescod,
                        $this->rolesdsc,
                        $this->rolesest
                    );
                break;

                case "DEL":
                    RolesDAO::eliminarRol($this->rolescod);
                break;

            }

            Site::redirectTo(ROLES_LIST_URL);
        }

        $this->viewData=[
            "mode"=>$this->mode,
            "rolescod"=>$this->rolescod,
            "rolesdsc"=>$this->rolesdsc,
            "rolesest"=>$this->rolesest
        ];

        Renderer::render("seguridad/roles/rol",$this->viewData);

    }

    private function loadData()
    {
        $tmp=RolesDAO::getRolById($this->rolescod);

        $this->rolesdsc=$tmp["rolesdsc"];
        $this->rolesest=$tmp["rolesest"];
    }

}