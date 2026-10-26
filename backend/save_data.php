<?php
include "db.php";

// Debug (remove in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get data safely
    $moisture = $_POST['moisture'] ?? null;
    $temperature = $_POST['temperature'] ?? null;
    $crop = $_POST['crop'] ?? '';
    $soil = $_POST['soil'] ?? '';
    $rain = $_POST['rain'] ?? 0;
    $result = $_POST['result'] ?? '';
    $recommendation = $_POST['recommendation'] ?? '';
    $confidence = $_POST['confidence'] ?? 0;

    // Validate required fields
    if ($moisture === null || $temperature === null) {
        echo "Missing required fields";
        exit;
    }

    // Prepare query
    $stmt = $conn->prepare("INSERT INTO irrigation_data 
        (moisture, temperature, crop, soil_type, rain_expected, irrigation_result, recommendation, confidence)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

    if (!$stmt) {
        echo "Prepare failed: " . $conn->error;
        exit;
    }

    // Bind correct data types
    $stmt->bind_param(
        "ddssissd",
        $moisture,
        $temperature,
        $crop,
        $soil,
        $rain,
        $result,
        $recommendation,
        $confidence
    );

    // Execute
    if ($stmt->execute()) {
        echo "Data Saved Successfully";
    } else {
        echo "Insert Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();

} else {
    echo "No POST request received";
}
?>