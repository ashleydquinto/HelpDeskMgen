<?php
    //necessary headers for CORS
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    //data decode (from json to array)
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);

    //variable declaration
    $response = array();
    $data = array();
    
    //assigning received data to variables
    $id = $received_data->id;
 

    if($id != ''){
        mysqli_query($conn,"DELETE FROM issue_category WHERE id = '".$id."'
        ");

        $message = 'Category has been deleted';
    }   
    else{
        $message = 'Will not proceed';
    }

    
    
    
    //creating response which will be sent to VUE file
    $response = array(
        "message" => $message
    );

    echo json_encode($response);

    $conn->close();
?>