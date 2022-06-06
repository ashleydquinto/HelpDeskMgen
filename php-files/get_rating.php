<?php
    /*
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    */
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);
    include 'connection.php';
    $id = $received_data->id3;
    $action = $received_data->action;
    

    

    

    $response3 = array();
  
 
    if($action == "Request") {
        $sel = mysqli_query($conn, "SELECT * FROM request_table WHERE (rating != '' AND id = '".$id."')");
        
        while($row = $sel -> fetch_assoc()){
            $response3 = unserialize($row['rating']);
            
        }
        
    }
    elseif($action == "Incident") {
        $sel = mysqli_query($conn, "SELECT * FROM incident_table WHERE (rating != '' AND id = '".$id."')");
        
        while($row = $sel -> fetch_assoc()){
            $response3 = unserialize($row['rating']);
            
        }
        
    }
    elseif($action == "Problem") {
        $sel = mysqli_query($conn, "SELECT * FROM problem_table WHERE (rating != '' AND id = '".$id."')");
        
        while($row = $sel -> fetch_assoc()){
            $response3 = unserialize($row['rating']);
            
        }
        
    }
            
        
        
  
    

    echo json_encode($response3);
    

    $sel->close();
    $conn->close();

    
?>