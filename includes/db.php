<?php
define('DB_HOST',    'localhost');
define('DB_PORT',    '3306');
define('DB_NAME',    'demo1');
define('DB_USER',    'root');
define('DB_PASS',    '');
define('DB_CHARSET', 'utf8mb4');

define('BASE_URL',    'http://localhost/demo1');
define('BASE_PATH',   dirname(__DIR__));
define('UPLOAD_PATH', BASE_PATH . '/assets/uploads/');
define('UPLOAD_URL',  BASE_URL . '/assets/uploads/');
define('ADMIN_URL',   BASE_URL . '/admin');
define('SYSTEM_URL',  BASE_URL . '/rendszer/');

try {
    $dsn     = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
} catch (PDOException $e) {
    http_response_code(500);
    die('Adatbázis kapcsolódási hiba: ' . $e->getMessage());
}

// Függvények betöltése
require_once __DIR__ . '/functions.php';