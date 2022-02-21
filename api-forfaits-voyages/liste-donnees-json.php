
<?php
header("Content-Type: application/json");
include_once "include/config.php";

header('Content-Type: application/json;');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, DELETE, PUT, OPTIONS");
header('Access-Control-Allow-Headers: Content-Type');


$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_errno) {
    echo "Échec de connexion à la base de données MySQL: " . $mysqli->connect_error;
    exit();
}


$resultat_requete = $mysqli->query("SELECT * FROM bilan_analytique");

$donnees_tableau = $resultat_requete->fetch_all(MYSQLI_ASSOC);
echo json_encode($donnees_tableau);


$mysqli->close();
?>
