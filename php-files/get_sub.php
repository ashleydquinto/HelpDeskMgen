<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    $json = file_get_contents("php://input");
    $received_data = json_decode($json);
    $id = $received_data->id;
    $sel = $conn -> query("SELECT * FROM issue_category WHERE id = '$id'");

    $temporal = array();
    $response = array();
    $array1 = array();
    while($row = mysqli_fetch_assoc($sel)){
        if($row['sub_category'] != null || $row['sub_category'] != '') {
            $response = unserialize($row['sub_category']);
        }
        else {
            $response = null;
        }
        
       
            
               
    }

    echo json_encode($response);

    $sel->close();
    $conn->close();

?>