<?php
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';
    

    $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !=""');
    $sel2 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved"');
    $sel3 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING"');
    $sel4 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING"');
    $sel5 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed"');
    $sel6 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled"');

    //for total
    $totalrows = mysqli_num_rows($sel);
    
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


    /*
    while($row = $sel -> fetch_assoc()){
        $temporal = $row;
        array_push($response, $temporal);
    }
    */

    $response = array(
        "total_rows" => $totalrows,
        "resolved_rows" => $resolvedrows,
        "ongoing_rows" => $ongoingrows,
        "pending_rows" => $pendingrows,
        "closed_rows" => $closedrows,
        "cancelled_rows" => $cancelledrows
    );
    echo json_encode($response);

    $conn->close();

?>