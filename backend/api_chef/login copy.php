<?php
require_once 'connection.php';


    if(isset($_POST['email'])){    
    $sql = "SELECT * FROM utilisateur  WHERE EMAIL_USER = :E AND PASSWORD_USER = :P";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam('E', $_POST['email'], PDO::PARAM_STR);
    $stmt->bindParam('P', $_POST['password'], PDO::PARAM_STR);
   // $stmt->bindParam('E', $login, PDO::PARAM_STR);
    //$stmt->bindParam('P', $pass, PDO::PARAM_STR);
    $stmt->execute();

    $res=$stmt->fetch();
    
    if(isset($res['Id_User'])){
         
        $res["message"]='ok';  
        
    }else{
        $res["message"]='non';
            
    }
    

    echo json_encode($res);

}

?>