<?php
require_once '../connection.php';
/*$req = $_POST["SELECT Id_Groupe FROM seance WHERE NOW() BETWEEN date_D AND date_F"];
$stmt = $pdo->prepare($req);
$stmt->execute();*/

// $sql = "SELECT * FROM etudiant 
//JOIN seance ON etudiant.id_Groupe = seance.id_Groupe
//WHERE seance.Id_User = $id AND NOW() BETWEEN seance.date_D AND seance.date_F " ;

$id= $_GET['prof_id'];

$sql="SELECT* from seance s where s.Id_User=$id and now() BETWEEN s.date_D and s.date_F; ";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$resq = $stmt->fetchAll();

echo json_encode($resq);
