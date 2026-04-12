<?php
namespace Controllers\Sec;

class Login extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $hasError = false;

    public function run() :void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if ($this->isPostBack()) {

            $this->txtEmail = $_POST["txtEmail"] ?? "";
            $this->txtPswd = $_POST["txtPswd"] ?? "";

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "Correo inválido";
                $this->hasError = true;
            }

            if (\Utilities\Validators::IsEmpty($this->txtPswd)) {
                $this->errorPswd = "Ingrese contraseña";
                $this->hasError = true;
            }

            if (!$this->hasError) {

                $dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);

                if ($dbUser) {

                    if ((int)$dbUser["estado"] !== 1 ||
                        !\Dao\Security\Security::verifyPassword(
                            $this->txtPswd,
                            $dbUser["password"]
                        )
                    ) {
                        $this->generalError = "Credenciales incorrectas";
                        $this->hasError = true;
                    }

                    if (!$this->hasError) {

                        $_SESSION["login"] = [
                            "userId" => $dbUser["id"],
                            "email" => $dbUser["email"],
                            "name" => $dbUser["nombre"],
                            "isLogged" => true
                        ];

                        \Utilities\Site::redirectTo("index.php");
                    }

                } else {
                    $this->generalError = "Credenciales incorrectas";
                }
            }
        }

        $dataView = get_object_vars($this);
        \Views\Renderer::render("security/login", $dataView);
    }
}
?>