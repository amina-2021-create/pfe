<?php
 require_once 'connection.php';


 $sql = "SELECT * FROM `utilisateur`";
 $stmt = $pdo->prepare($sql);
 $stmt->execute();
 $resq = $stmt->fetchAll();

 echo json_encode($resq);



?>