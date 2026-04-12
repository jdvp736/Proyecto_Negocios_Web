<?php
namespace Controllers\Pf_Seguridad;

use Controllers\PublicController;

class control extends PublicController
{
    private $usuarios = [];
    private $roles = [];
    private $funciones = [];

    public function run(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $userId = $_SESSION["login"]["userId"] ?? 0;

        if (!\Dao\Security\Security::isUsuarioInRol($userId, "admin")) {
            echo "<h2 style='color:red;text-align:center;'>🚫 Acceso Denegado</h2>";
            return;
        }

        $this->usuarios = \Dao\Security\Security::getAllUsuarios();
        $this->roles = \Dao\Security\Security::getAllRoles();
        $this->funciones = \Dao\Security\Security::getAllFunciones();

        if ($this->isPostBack()) {

            if (isset($_POST["id"]) && isset($_POST["rolescod"])) {

                $uid = $_POST["id"];
                $rol = $_POST["rolescod"];

                $rolesActuales = \Dao\Security\Security::getRolesByUsuario($uid);

                foreach ($rolesActuales as $r) {
                    \Dao\Security\Security::removeRolFromUser($uid, $r["rolescod"]);
                }

                \Dao\Security\Security::addRolToUser($uid, $rol);

                $rolId = ($rol === "admin") ? 1 : 2;
                \Dao\Security\Security::updateUserRolId($uid, $rolId);
            }

            if (isset($_POST["edit_user_id"])) {
                \Dao\Security\Security::updateUsuario(
                    $_POST["edit_user_id"],
                    $_POST["edit_email"],
                    $_POST["edit_estado"]
                );
            }

            if (isset($_POST["delete_user_id"])) {

                if ($_POST["delete_user_id"] != $userId) {
                    \Dao\Security\Security::deleteUsuario($_POST["delete_user_id"]);
                }
            }

            if (isset($_POST["fncod"]) && isset($_POST["rolescod_fn"])) {
                \Dao\Security\Security::addFeatureToRol($_POST["fncod"], $_POST["rolescod_fn"]);
            }

            if (isset($_POST["remove_fncod"]) && isset($_POST["remove_rolescod_fn"])) {
                \Dao\Security\Security::removeFeatureFromRol($_POST["remove_fncod"], $_POST["remove_rolescod_fn"]);
            }

            $this->usuarios = \Dao\Security\Security::getAllUsuarios();
        }

        $viewData = get_object_vars($this);
        \Views\Renderer::render("pf_seguridad/control", $viewData);
    }
}