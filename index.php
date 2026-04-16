<?php

use Utilities\Site;

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

} catch (\Controllers\PrivateNoAuthException $ex) {
    echo "<h2>PrivateNoAuthException:</h2><pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (\Controllers\PrivateNoLoggedException $ex) {
    echo "<h2>PrivateNoLoggedException:</h2><pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (Exception $ex) {
    echo "<h2>Exception:</h2><pre>";
    print_r($ex);
    echo "</pre>";
    die();

} catch (Error $ex) {
    echo "<h2>Error:</h2><pre>";
    print_r($ex);
    echo "</pre>";
    die();
}
