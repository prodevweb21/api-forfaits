<?php
function ConversionForfaitSQLEnObjet($forfaitSQL) {
    $forfaitOBJ = new stdClass();
    $forfaitOBJ->destination = $forfaitSQL["destination"];
    $forfaitOBJ->ville_de_depart = $forfaitSQL["ville_de_depart"];



    $forfaitOBJ->hotel = new stdClass();
    $forfaitOBJ->hotel->nom_hotel = $forfaitSQL["nom_hotel"];
    $forfaitOBJ->hotel->coordonnees = $forfaitSQL["coordonnees"];
    $forfaitOBJ->hotel->nombre_etoiles = $forfaitSQL["nombre_etoiles"];
    $forfaitOBJ->hotel->nombre_chambres = $forfaitSQL["nombre_chambres"];

    $forfaitOBJ->hotel->caracteristiques = explode(";", $forfaitSQL["caracteristiques"]);

    $forfaitOBJ->date_de_depart = $forfaitSQL["date_de_depart"];
    $forfaitOBJ->date_de_retour = $forfaitSQL["date_de_retour"];
    $forfaitOBJ->prix = $forfaitSQL["prix"];
    $forfaitOBJ->rabais = $forfaitSQL["rabais"];
    $forfaitOBJ->vedette = $forfaitSQL["vedette"];


return $forfaitOBJ;



}
?>

