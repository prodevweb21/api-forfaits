
<?php
header("Content-Type: application/json");
include_once "include/config.php";


$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_errno) {
    echo "Échec de connexion à la base de données MySQL: " . $mysqli->connect_error;
    exit();
}


$resultat_requete = $mysqli->query("SELECT `nbr_occupants`, `activite_spa`, `service_transport`, `film_sur_demande`, `minibar_collation`, `qte_cartes_cadeaux`, `nbr-reclamations`, `nbr_annulations` FROM `bilan_analytique`");

$donnees_tableau = $resultat_requete->fetch_all(MYSQLI_ASSOC);
echo json_encode($donnees_tableau);

$mysqli->close();
?>
