<?php
 require_once '../connection.php';


 $sql = "SELECT e.NOM_USER,e.PRENOM_USER,e.CNE_ET,e.EMAIL_USER,a.ETAT,a.STATUT,s.date_D,s.date_F,el.NOM_ELEMENT
 
  FROM absence a join etudiant e   join seance s join element el where e.NIVEAU_ET='LP'and a.Etat='absent'AND a.Statut='non justifie' and a.Id_User = e.Id_User and a.ID_SEANCE=s.ID_SEANCE and s.Id_User=el.Id_User AND s.Id_User=e.Id_User" ;
 $stmt = $pdo->prepare($sql);
 $stmt->execute();
 $resq = $stmt->fetchAll();

 echo json_encode($resq);



?>