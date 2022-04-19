<?php
    /*
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    */
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    

    include 'connection.php';

    $action = '';

    if(isset($_GET['action'])){
        $action = $_GET['action'];
    }

    $temporal = array();
    $response = array();

    if($action == 'category1'){
        $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !="" AND (request_category LIKE "requests" || request_category LIKE "request" ) ');//REQUESTS , AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }
    }elseif($action == 'category2'){
        $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !="" AND (request_category LIKE "incidents" || request_category LIKE "incident" ) ');//INCIDENTS, AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }
    }
    elseif($action == 'category3'){
        $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !="" AND (request_category LIKE "problems" || request_category LIKE "Problem" ) ');//PROBLEMS, AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }
    }
    else{
        $response = "no variable";
    }

    

    

    echo json_encode($response);

    $sel->close();
    $conn->close();


?>