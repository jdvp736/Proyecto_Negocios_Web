<?php

namespace Controllers\Mantenimientos\Dashboard;

use Controllers\PrivateController;
use Views\Renderer;

const VIEW_TEMPLATE = "mantenimientos/dashboard/dashboard";

class Dashboard extends PrivateController
{
    public function run(): void
    {

        Renderer::render(VIEW_TEMPLATE, []);
    }
}