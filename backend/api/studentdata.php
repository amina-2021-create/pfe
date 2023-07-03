<?php
require_once 'connection.php';
/*$req = $_POST["SELECT Id_Groupe FROM seance WHERE NOW() BETWEEN date_D AND date_F"];
$stmt = $pdo->prepare($req);
$stmt->execute();*/

// $sql = "SELECT * FROM etudiant 
//JOIN seance ON etudiant.id_Groupe = seance.id_Groupe
//WHERE seance.Id_User = $id AND NOW() BETWEEN seance.date_D AND seance.date_F " ;
$id= $_GET['seance_id'];
$sql="SELECT e.NOM_USER, e.Id_User,e.PRENOM_USER,e.CNE_ET, a.etat FROM etudiant e inner JOIN affilier f  on e.Id_User=f.Id_User inner JOIN seance s on s.Id_Groupe=f.ID_GROUPE LEFT join absence a on (a.Id_User=e.Id_User and s.ID_SEANCE=a.ID_SEANCE)where s.ID_SEANCE=$id group BY e.Id_User; ";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$resq = $stmt->fetchAll();

echo json_encode($resq);
