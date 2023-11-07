<?php
include_once('db-data.php'); // dbdata maar 1x nodig. gebruiken voor de connection. Is mooier in een ander bestand.

$envSettings = [];
if (file_exists(dirname(__FILE__).'/.env')) {
    $envSettings = parse_ini_file(dirname(__FILE__).'/.env');
}

// Variabelen voor database-instellingen
$DB_SCHEMA_NAME = $envSettings['DB_SCHEMA_NAME'] ?? '';
$DB_USER = $envSettings['DB_USER'] ?? '';
$DB_PASSWORD = $envSettings['DB_PASSWORD'] ?? '';
$DB_HOST = $envSettings['DB_HOST'] ?? '';

// Maak een databaseverbinding
$mysqli = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_SCHEMA_NAME); // db verbinding aanmaken met de connectie dbdata.php

// Controleer de verbinding
if ($mysqli->connect_error) {
    die("Databaseverbinding mislukt: " . $mysqli->connect_error); // db verbinding mislukt, sluit de verbinding
} else {
    echo "Databaseverbinding succesvol!"; // connectie sucesvol laat weten op de pagina voor makkelijk debuggen
    
    // Voer een query uit om gegevens uit een tabel te selecteren (vervang tabelnaam door de werkelijke tabelnaam)
    $query = "SELECT * FROM tabelnaam";
    $result = $mysqli->query($query);
    
    // Controleer of de query succesvol is uitgevoerd
    if ($result) {
        // Verwerk de resultaten
        while ($row = $result->fetch_assoc()) {
            echo "Kolom 1: " . $row['kolom1'] . ", Kolom 2: " . $row['kolom2'] . "<br>";
        }
        
        // Sluit het resultaatset
        $result->close();
    } else {
        echo "Fout bij het uitvoeren van de query: " . $mysqli->error;
    }
    
    // Sluit de databaseverbinding
    $mysqli->close();
}
?>