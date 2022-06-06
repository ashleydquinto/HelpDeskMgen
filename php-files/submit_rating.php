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
    
    
    //assigning received data to variables
    $r1 = $received_data->r1;
    $r2 = $received_data->r2;
    $r3 = $received_data->r3;
    $r4 = $received_data->r4;
    $qow1 = $received_data->qow1;
    $qow2 = $received_data->qow2;
    $qow3 = $received_data->qow3;
    $d1 = $received_data->d1;
    $d2 = $received_data->d2;
    $ss1 = $received_data->ss1;
    $ss2 = $received_data->ss2;
    $id = $received_data->id;
    $action = $received_data->action;
    $data = array(
                "r1"=>$r1, 
                "r2"=>$r2,
                "r3"=>$r3,
                "r4"=>$r4,
                "qow1"=>$qow1,
                "qow2"=>$qow2,
                "qow3"=>$qow3,
                "d1"=>$d1,
                "d2"=>$d2,
                "ss1"=>$ss1,
                "ss2"=>$ss2,);
    $savedata = serialize($data);           

    //query executed if fields are not empty    
    if($action == "Request") {
    mysqli_query($conn,"UPDATE request_table SET

    rating= '".$savedata."'
                WHERE id = '".$id."'
            ");
    //creating response which will be sent to VUE file
    $response = array(
        "message" => "Rating succesfully added"
    );
}
elseif($action == "Problem") {
    mysqli_query($conn,"UPDATE problem_table SET

    rating= '".$savedata."'
                WHERE id = '".$id."'
            ");
    //creating response which will be sent to VUE file
    $response = array(
        "message" => "Rating succesfully added"
    );
}
elseif($action == "Incident") {
    mysqli_query($conn,"UPDATE incident_table SET

    rating= '".$savedata."'
                WHERE id = '".$id."'
            ");
    //creating response which will be sent to VUE file
    $response = array(
        "message" => "Rating succesfully added"
    );
}
else {
    $response = array(
        "message" => "Task failed"
    );
}
    echo json_encode($response);

    $conn->close();



    


?>

