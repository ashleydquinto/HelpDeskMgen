<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    $sel = $conn -> query('SELECT title FROM issue_category');

    $temporal = array();
    $response = array();

    while($row = $sel -> fetch_assoc()){
        $temporal = $row;
        array_push($response, $temporal);
    }

    echo json_encode($response);

    $sel->close();
    $conn->close();

?>