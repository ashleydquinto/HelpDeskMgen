<?php
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');


    //data decode (from json to array)
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);

    //$action = '';

    include 'connection.php';

    //assigning received data to variables
    if($received_data != '' || $received_data != null){
        $action = $received_data->action;
    }
    else{
        echo 'No action.';
        $action = '';
    }
    

    

    if($action == '' OR $action == null OR $action == 'tickets-table'){
        $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !=""');
        $sel1 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "New"');
        $sel2 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved"');
        $sel3 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING"');
        $sel4 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING"');
        $sel5 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed"');
        $sel6 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled"');

        //for total
        $totalrows = mysqli_num_rows($sel);
        
        //for new - array[]
        $newrows=mysqli_num_rows($sel1);
        //for resolved - array[3]
        $resolvedrows=mysqli_num_rows($sel2);
        //for ongoing - array[1]
        $ongoingrows=mysqli_num_rows($sel3);
        //for pending - array[2]
        $pendingrows=mysqli_num_rows($sel4);
        //for pending - array[4]
        $closedrows=mysqli_num_rows($sel5);
        //for pending - array[5]
        $cancelledrows=mysqli_num_rows($sel6);
    }
    else if($action == 'request'){
        $sel = $conn -> query('SELECT * FROM request_table WHERE requestor !=""');
        $sel1 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "New"');
        $sel2 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "resolved"');
        $sel3 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "ONGOING"');
        $sel4 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "PENDING"');
        $sel5 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "closed"');
        $sel6 = $conn -> query('SELECT * FROM request_table WHERE (requestor !="") AND status LIKE "cancelled"');

        //for total
        $totalrows = mysqli_num_rows($sel);
        
        //for new - array[]
        $newrows=mysqli_num_rows($sel1);
        //for resolved - array[3]
        $resolvedrows=mysqli_num_rows($sel2);
        //for ongoing - array[1]
        $ongoingrows=mysqli_num_rows($sel3);
        //for pending - array[2]
        $pendingrows=mysqli_num_rows($sel4);
        //for pending - array[4]
        $closedrows=mysqli_num_rows($sel5);
        //for pending - array[5]
        $cancelledrows=mysqli_num_rows($sel6);
    }
    else if($action == 'incident'){
        $sel = $conn -> query('SELECT * FROM incident_table WHERE requestor !=""');
        $sel1 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "New"');
        $sel2 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "resolved"');
        $sel3 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "ONGOING"');
        $sel4 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "PENDING"');
        $sel5 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "closed"');
        $sel6 = $conn -> query('SELECT * FROM incident_table WHERE (requestor !="") AND status LIKE "cancelled"');

        //for total
        $totalrows = mysqli_num_rows($sel);
        
        //for new - array[]
        $newrows=mysqli_num_rows($sel1);
        //for resolved - array[3]
        $resolvedrows=mysqli_num_rows($sel2);
        //for ongoing - array[1]
        $ongoingrows=mysqli_num_rows($sel3);
        //for pending - array[2]
        $pendingrows=mysqli_num_rows($sel4);
        //for pending - array[4]
        $closedrows=mysqli_num_rows($sel5);
        //for pending - array[5]
        $cancelledrows=mysqli_num_rows($sel6);
    }
    else if($action == 'problem'){
        $sel = $conn -> query('SELECT * FROM problem_table WHERE requestor !=""');
        $sel1 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "New"');
        $sel2 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "resolved"');
        $sel3 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "ONGOING"');
        $sel4 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "PENDING"');
        $sel5 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "closed"');
        $sel6 = $conn -> query('SELECT * FROM problem_table WHERE (requestor !="") AND status LIKE "cancelled"');

        //for total
        $totalrows = mysqli_num_rows($sel);
        
        //for new - array[]
        $newrows=mysqli_num_rows($sel1);
        //for resolved - array[3]
        $resolvedrows=mysqli_num_rows($sel2);
        //for ongoing - array[1]
        $ongoingrows=mysqli_num_rows($sel3);
        //for pending - array[2]
        $pendingrows=mysqli_num_rows($sel4);
        //for pending - array[4]
        $closedrows=mysqli_num_rows($sel5);
        //for pending - array[5]
        $cancelledrows=mysqli_num_rows($sel6);
    }
    
    else{
        echo "did not proceed.";
    }
    

    


    /*
    while($row = $sel -> fetch_assoc()){
        $temporal = $row;
        array_push($response, $temporal);
    }
    */

    $response = array(
        "total_rows" => $totalrows,
        "new_rows" => $newrows,
        "resolved_rows" => $resolvedrows,
        "ongoing_rows" => $ongoingrows,
        "pending_rows" => $pendingrows,
        "closed_rows" => $closedrows,
        "cancelled_rows" => $cancelledrows
    );
    echo json_encode($response);

    $conn->close();

?>