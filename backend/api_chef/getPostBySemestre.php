<?php

require_once '../connection.php';


$sql = "SELECT *
FROM absence
INNER JOIN etudiant ON absence.Id_User=etudiant.Id_User;";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$resq = $stmt->fetchAll();

echo json_encode($resq);



?>






