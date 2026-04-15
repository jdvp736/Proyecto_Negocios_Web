<?php

namespace Controllers\Home;

use Controllers\PublicController;
use Views\Renderer;

const VIEW_TEMPLATE = "home/acerca";

class Acerca extends PublicController
{
    public function run(): void
    {
        Renderer::render(VIEW_TEMPLATE, []);
    }
}