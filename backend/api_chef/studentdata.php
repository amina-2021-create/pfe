<?php
require_once 'connection.php';
/*$req = $_POST["SELECT Id_Groupe FROM seance WHERE NOW() BETWEEN date_D AND date_F"];
$stmt = $pdo->prepare($req);
$stmt->execute();*/

if(isset($_POST['Id_User'])){
    $id=$_POST['Id_User']; 
    echo $id;   
}

// $sql = "SELECT * FROM etudiant 
//JOIN seance ON etudiant.id_Groupe = seance.id_Groupe
//WHERE seance.Id_User = $id AND NOW() BETWEEN seance.date_D AND seance.date_F " ;
$sql="SELECT * FROM etudiant ";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$resq = $stmt->fetchAll();

echo json_encode($resq);

?>