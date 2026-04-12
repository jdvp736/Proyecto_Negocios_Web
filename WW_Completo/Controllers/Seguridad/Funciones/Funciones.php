<?php

namespace Controllers\Seguridad\Funciones;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Seguridad\Funciones as FuncionesDAO;

const LIST_VIEW_TEMPLATE="seguridad/funciones/funciones";

class Funciones extends PublicController
{

    private array $funcionesList=[];

    public function run():void
    {

        $this->funcionesList=FuncionesDAO::getAllFunciones();

        Renderer::render(LIST_VIEW_TEMPLATE,[
            "funciones"=>$this->funcionesList
        ]);

    }

}