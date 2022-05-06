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
    $action = $received_data->action;

    //closed string var
    $closed = 'Closed';

    if($id != '' AND $action == 'incident' AND $action != 'request' AND $action != 'problem'){
        mysqli_query($conn,"UPDATE incident_table SET 
            status= '".$closed."'
            WHERE id = '".$id."' 
        ");

        $message = 'Ticket Closed';
    }   
    elseif($id != '' AND $action == 'request' AND $action != 'incident' AND $action != 'problem'){
        mysqli_query($conn,"UPDATE request_table SET 
            status= '".$closed."'
            WHERE id = '".$id."' 
        ");

        $message = 'Ticket Closed';
    }   
    elseif($id != '' AND $action == 'problem' AND $action != 'request' AND $action != 'incident'){
        mysqli_query($conn,"UPDATE problem_table SET 
            status= '".$closed."'
            WHERE id = '".$id."' 
        ");

        $message = 'Ticket Closed';
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