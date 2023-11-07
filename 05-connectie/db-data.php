<?php
$envSettings = [];
if (file_exists(dirname(__FILE__).'/.env')) {
    $envSettings = parse_ini_file(dirname(__FILE__).'/.env');
}

// De bovenstaande code leest de .env-bestandsinstellingen in $envSettings.
// Hiermee kun je de database-instellingen toewijzen aan afzonderlijke variabelen.
$DB_SCHEMA_NAME = $envSettings['DB_SCHEMA_NAME'] ?? '';
$DB_USER = $envSettings['DB_USER'] ?? '';
$DB_PASSWORD = $envSettings['DB_PASSWORD'] ?? '';
$DB_HOST = $envSettings['DB_HOST'] ?? '';
?>