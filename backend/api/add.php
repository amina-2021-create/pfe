<?php
require_once 'connection.php';
// Prepare the SQL statement

$sql = "INSERT INTO absence (Id_User, ID_SEANCE,etat) VALUES (:id_user,:id_seance,'absent')";
$stmt = $pdo->prepare($sql);

// Bind the parameters
$id = $_GET['etudient_id'];
$seance = $_GET['seance_id'];
$stmt->bindParam(':id_user', $id);
$stmt->bindParam(':id_seance', $seance);

// Execute t
$stmt->execute();

// requête d'insertion de données




  /*$sql = " INSERT INTO absence VALUES ()";
  $stmt = $pdo->prepare($sql);
  $stmt->execute();

  $res=$stmt->fetch();
  if(isset($res['Id_User'])){
      $res["message"]='ok';    
  }else{
      $res["message"]='non';
          
  }
  
  echo json_encode($res);

}


/*
if (isset($_POST['ID'])) {
    $id = $_POST ['ID'];
    echo "L'id_user est : " .$id;
} else {
    echo "Id_User n'a pas été défini";
}
*/


 


/*if(isset($_POST['Id_User']) && isset($_POST['ID_SEANCE'])){
  $cne=$_POST['Id_User'];
  $seance=$_POST['ID_SEANCE'];
  $sql = "INSERT INTO absence (Id_User, ID_SEANCE) VALUES ('$cne','$seance')";

  // Exécution de la requête d'insertion
  if ($conn->query($sql) === TRUE) {
    echo "Ligne insérée avec succès.";
  } else {
    echo "Erreur d'insertion de ligne : " . $conn->error;
  }
}*/
