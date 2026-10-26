<?php
include "db.php";

header('Content-Type: application/json');

// Optional: limit records for performance
$sql = "SELECT 
    moisture,
    temperature,
    crop,
    rain_expected,
    irrigation_result,
    created_at
FROM irrigation_data 
ORDER BY id DESC 
LIMIT 20";

$result = $conn->query($sql);

$data = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {

        // Convert rain 0/1 → readable text
        $row['rain_expected'] = $row['rain_expected'] ? "Yes" : "No";

        $data[] = $row;
    }

    echo json_encode([
        "status" => "success",
        "data" => $data
    ]);

} else {
    echo json_encode([
        "status" => "empty",
        "data" => []
    ]);
}

$conn->close();
?>