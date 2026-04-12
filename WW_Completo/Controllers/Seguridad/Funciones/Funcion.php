<?php

namespace Controllers\Seguridad\Funciones;

use Dao\Seguridad\Funciones as FuncionesDAO;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;

const FUNCIONES_FORM_URL="index.php?page=Seguridad-Funciones-Funcion";
const FUNCIONES_LIST_URL="index.php?page=Seguridad-Funciones-Funciones";

class Funcion extends PublicController
{

    private $fncod;
    private $fndsc;
    private $fnest;
    private $fntyp;

    private $mode;

    public function run():void
    {

        $this->mode=$_GET["mode"]??"";

        $this->fncod=$_GET["id"]??"";

        if($this->mode!="INS"){
            $this->loadData();
        }

        if($this->isPostBack()){

            $this->fncod=$_POST["fncod"];
            $this->fndsc=$_POST["fndsc"];
            $this->fnest=$_POST["fnest"];
            $this->fntyp=$_POST["fntyp"];

            switch($this->mode){

                case "INS":
                    FuncionesDAO::crearFuncion(
                        $this->fncod,
                        $this->fndsc,
                        $this->fnest,
                        $this->fntyp
                    );
                break;

                case "UPD":
                    FuncionesDAO::actualizarFuncion(
                        $this->fncod,
                        $this->fndsc,
                        $this->fnest,
                        $this->fntyp
                    );
                break;

                case "DEL":
                    FuncionesDAO::eliminarFuncion($this->fncod);
                break;

            }

            Site::redirectTo(FUNCIONES_LIST_URL);
        }

        Renderer::render("seguridad/funciones/funcion",[
            "fncod"=>$this->fncod,
            "fndsc"=>$this->fndsc,
            "fnest"=>$this->fnest,
            "fntyp"=>$this->fntyp,
            "mode"=>$this->mode,

                "isReadonly" => ($this->mode === "DSP" || $this->mode === "DEL") ? "readonly" : "",
                "hideConfirm" => ($this->mode === "DSP"),
                "confirmToolTip" => ""
        ]);

    }

    private function loadData()
    {
        $tmp=FuncionesDAO::getFuncionById($this->fncod);

        $this->fndsc=$tmp["fndsc"];
        $this->fnest=$tmp["fnest"];
        $this->fntyp=$tmp["fntyp"];
    }

}