<?php

/**
 * PHP Version 7.2
 */

use Utilities\Context;
use Utilities\Site;

/* 🔥 MOSTRAR ERRORES SIEMPRE */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require __DIR__ . '/vendor/autoload.php';
session_start();

try {
    Site::configure();
    $pageRequest = Site::getPageRequest();
    $instance = new $pageRequest();
    $instance->run();
    die();
} catch (\Controllers\PrivateNoAuthException $ex) {

    echo "<pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (\Controllers\PrivateNoLoggedException $ex) {

    echo "<pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (Exception $ex) {

    echo "<h2>Exception:</h2>";
    echo "<pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (Error $ex) {

    echo "<h2>Error:</h2>";
    echo "<pre>";
    print_r($ex);
    echo "</pre>";
    die();
}