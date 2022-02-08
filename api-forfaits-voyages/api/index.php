<?php
include_once '../include/config.php';
include_once '../include/fonctions.php';

header('Content-Type: application/json;');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, DELETE, PUT, OPTIONS");
header('Access-Control-Allow-Headers: Content-Type');



$mysqli = new mysqli($host, $username, $password, $database);
if ($mysqli->connect_errno) {
	echo 'Échec de connexion à la base de données MySQL: ' . $mysqli->connect_error;
	exit();
}
switch ($_SERVER['REQUEST_METHOD']) {
	case 'GET':  // GESTION DES DEMANDES DE TYPE GET
		if (isset($_GET['id'])) {
			if ($requete = $mysqli->prepare("SELECT * FROM forfaits WHERE id=?")) {
				$requete->bind_param("i", $_GET['id']);
				$requete->execute();

				$resultat_requete = $requete->get_result();
				$forfaitSQL = $resultat_requete->fetch_assoc();


				$forfaitObj = ConversionForfaitSQLEnObjet($forfaitSQL);

				echo json_encode($forfaitObj, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

				$requete->close();
			}
		} else {
			$requete = $mysqli->query("SELECT * FROM forfaits");
			$listeForfaitsObj = [];

			while ($forfaitSQL = $requete->fetch_assoc()) {

				$forfaitObj = ConversionForfaitSQLEnObjet($forfaitSQL);


				array_push($listeForfaitsObj, $forfaitObj);
			}

			echo json_encode($listeForfaitsObj, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
			$requete->close();
		}
		break;

	case 'POST':  // GESTION DES DEMANDES DE TYPE POST
		$reponse = new stdClass();
		$reponse->message = "Ajout d'un nouveau forfait voyage: ";

		$corpsJSON = file_get_contents('php://input');
		$data = json_decode($corpsJSON, TRUE);

		$destination = $data['destination'];
		$ville_de_depart = $data['ville_de_depart'];
		$nom_hotel = $data['hotel']['nom_hotel'];
		$coordonnees = $data['hotel']['coordonnees'];
		$nombre_etoiles = $data['hotel']['nombre_etoiles'];
		$nombre_chambres = $data['hotel']['nombre_chambres'];
		$caracteristiques_str = $data['caracteristiques'];
		$date_de_depart = $data['date_de_depart'];
		$date_de_retour = $data['date_de_retour'];
		$prix = $data['prix'];
		$rabais = $data['rabais'];
		$vedette = $data['vedette'];


		if (isset($destination) && isset($ville_de_depart) && isset($nom_hotel) && isset($coordonnees) && isset($nombre_etoiles) && isset($nombre_chambres) && isset($caracteristiques_str) && isset($date_de_depart) && isset($date_de_retour) && isset($prix) && isset($rabais) && isset($vedette)) {
			$caracteristiques = implode(';', $caracteristiques_str);

			if ($requete = $mysqli->prepare("INSERT INTO forfaits (destination, ville_de_depart, nom_hotel, coordonnees, nombre_etoiles, nombre_chambres, caracteristiques, date_de_depart, date_de_retour, prix, rabais, vedette) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
				$requete->bind_param("ssssiisssddi", $destination, $ville_de_depart, $nom_hotel, $coordonnees, $nombre_etoiles, $nombre_chambres, $caracteristiques, $date_de_depart, $date_de_retour, $prix, $rabais, $vedette);

				if ($requete->execute()) {
					$reponse->message .= "Succès";
				} else {
					$reponse->message .=  "Erreur dans l'exécution de la requête";
				}

				$requete->close();
			} else {
				$reponse->message .=  "Erreur dans la préparation de la requête";
			}
		} else {
			$reponse->message .=  "Erreur dans le corps de l'objet fourni";
		}
		echo json_encode($reponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

		break;

	case 'PUT': // GESTION DES DEMANDES DE TYPE PUT 
		$reponse = new stdClass();
		$reponse->message = "Édition du forfait: ";

		$corpsJSON = file_get_contents("php://input");
		$data = json_decode($corpsJSON, TRUE);


		$destination = $data['destination'];
		$ville_de_depart = $data['ville_de_depart'];
		$nom_hotel = $data['hotel']['nom_hotel'];
		$coordonnees = $data['hotel']['coordonnees'];
		$nombre_etoiles = $data['hotel']['nombre_etoiles'];
		$nombre_chambres = $data['hotel']['nombre_chambres'];
		$caracteristiques_str = $data['caracteristiques'];
		$date_de_depart = $data['date_de_depart'];
		$date_de_retour = $data['date_de_retour'];
		$prix = $data['prix'];
		$rabais = $data['rabais'];
		$vedette = $data['vedette'];


		if (isset($_GET["id"])) {

			if (isset($destination) && isset($ville_de_depart) && isset($nom_hotel) && isset($coordonnees) && isset($nombre_etoiles) && isset($nombre_chambres) && isset($caracteristiques_str) && isset($date_de_depart) && isset($date_de_retour) && isset($prix) && isset($rabais) && isset($vedette)) {
				$caracteristiques = implode(';', $caracteristiques_str);

				if ($requete = $mysqli->prepare("UPDATE forfaits SET destination=?, ville_de_depart=?, nom_hotel=?, coordonnees=?, nombre_etoiles=?, nombre_chambres=?, caracteristiques=?, date_de_depart=?, date_de_retour=?, prix=?, rabais=?, vedette=? WHERE id=?")) {
					$requete->bind_param("ssssiisssddii", $destination, $ville_de_depart, $nom_hotel, $coordonnees, $nombre_etoiles, $nombre_chambres, $caracteristiques, $date_de_depart, $date_de_retour, $prix, $rabais, $vedette, $_GET["id"]);

					if ($requete->execute()) {
						$reponse->message .= "Succès";
					} else {
						$reponse->message .= "Erreur dans l'exécution de la requête";
					}
					$requete->close();
				} else {
					$reponse->message .= "Erreur dans la préparation de la requête";
				}
			} else {
				$reponse->message .= "Erreur dans le corps de l'objet fourni";
			}
		} else {
			$reponse->message .= "Erreur dans les paramètres (aucun identifiant fourni)";
		}
		echo json_encode($reponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
		break;

	case "DELETE": // GESTION DES DEMANDES DE TYPE DELETE 
		$reponse = new stdClass();
		$reponse->message = "Suppression du forfait: ";

		if (isset($_GET["id"])) {
			if ($requete = $mysqli->prepare("DELETE FROM `forfaits` WHERE id=?")) {
				$requete->bind_param("i", $_GET["id"]);
				if ($requete->execute()) {
					$reponse->message .= "Succès";
				} else {
					$reponse->message .= "Erreur dans l'exécution de la requête";
				}
				$requete->close();
			} else {
				$reponse->message .= "Erreur dans la préparation de la requête";
			}
		} else {
			$reponse->message .= "Erreur dans les paramètres (aucun identifiant fourni)";
		}
		echo json_encode($reponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

		break;
	default:
}
