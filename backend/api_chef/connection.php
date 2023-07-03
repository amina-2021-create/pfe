<?php
$host = "localhost";
$user = "root";
$db = "pfe_kha";
$pass = "";
$charset= 'utf8mb4';


    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";

    try {
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(\PDO::ATTR_DEFAULT_FETCH_MODE,\PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        throw new PDOException($e->getMessage());        
    }

?>