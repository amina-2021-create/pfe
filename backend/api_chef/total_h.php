
<?php


function calculerHeuresAbsence($Id_User) {
    // Connexion à la base de données
   // $connexion = new PDO("mysql:host=nom_hote;dbname=nom_base_de_donnees", "nom_utilisateur", "mot_de_passe");
   require_once '../connection.php';
    // Requête pour récupérer les données d'absence de l'étudiant
    $requete = $connexion->prepare("SELECT SUM(HOUR,date_D,data_F) as heures_absence FROM seance s where s.Id_User= Id_User");
    $requete->bindParam(":etudiant_id", $Id_User);
    $requete->execute();

    // Récupération du nombre d'heures d'absence
    $resultat = $requete->fetch(PDO::FETCH_ASSOC);
    $heuresAbsence = $resultat["heures_absence"];

    // Fermeture de la connexion à la base de données
   // $connexion = null;

    // Retour du nombre d'heures d'absence
    return $heuresAbsence;
}
?>
