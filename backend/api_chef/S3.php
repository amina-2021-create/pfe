<?php
require_once 'connection.php';

$sql = "SELECT e.NOM_USER, e.PRENOM_USER, e.EMAIL_USER, a.etat, s.date_D, s.date_F, el.NOM_ELEMENT FROM groupe g 
JOIN semestre t ON t.ID_SEMESTRE = g.ID_SEMESTRE 
JOIN etudiant e ON g.ID_FILIERE_ = e.ID_FILIERE_ 
JOIN absence a ON a.Id_User = e.Id_User 
JOIN seance s ON s.ID_SEANCE = a.ID_SEANCE 
JOIN element el ON el.ID_ELEMENT = s.ID_ELEMENT 
WHERE t.NUM_SEMESTRE = 'S3'";

$stmt = $pdo->prepare($sql);
$stmt->execute();
$resq = $stmt->fetchAll();

echo json_encode($resq);
?>
