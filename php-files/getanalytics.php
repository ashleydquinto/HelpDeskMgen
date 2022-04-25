<?php
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';
    

    $sel = $conn -> query('SELECT * FROM ticket WHERE requestor !=""');
    $sel1 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "New"');
    $sel2 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved"');
    $sel3 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING"');
    $sel4 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING"');
    $sel5 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed"');
    $sel6 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled"');
    $sel7 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND request_category LIKE "Incident"');
    $sel8 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND request_category LIKE "Problem"');
    $sel9 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND request_category LIKE "Request"');
    /* mali fuck
    $sel7 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "New" AND (request_category = "Request")');
    $sel8 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved" AND (request_category = "Request")');
    $sel9 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING" AND (request_category = "Request")');
    $sel10 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING" AND (request_category = "Request")');
    $sel11 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed" AND (request_category = "Request")');
    $sel12 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled" AND (request_category = "Request")');

    $sel13 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "New" AND (request_category = "Incident")');
    $sel14 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved" AND (request_category = "Incident")');
    $sel15 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING" AND (request_category = "Incident")');
    $sel16 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING" AND (request_category = "Incident")');
    $sel17 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed" AND (request_category = "Incident")');
    $sel18 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled" AND (request_category = "Incident")');

    $sel19 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "New" AND (request_category = "Problem")');
    $sel20 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "resolved" AND (request_category = "Problem")');
    $sel21 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "ONGOING" AND (request_category = "Problem")');
    $sel22 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "PENDING" AND (request_category = "Problem")');
    $sel23 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "closed" AND (request_category = "Problem")');
    $sel24 = $conn -> query('SELECT * FROM ticket WHERE (requestor !="") AND status LIKE "cancelled" AND (request_category = "Problem")');
    */
    //for total
    /*
    $get_un = mysqli_query($conn, "SELECT DISTINCT requestor FROM ticket WHERE (requestor !="")");
   

    if(mysqli_num_rows($get_un) > 0)
    {
        while($un = mysqli_fetch_assoc($get_un))
        {
            $requestor = $row['requestor'];
            
            $sel1 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "New"');
            $sel2 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "resolved"');
            $sel3 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "ONGOING"');
            $sel4 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "PENDING"');
            $sel5 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "closed"');
            $sel6 = $conn -> query('SELECT * FROM ticket WHERE (requestor = '$requestor') AND status LIKE "cancelled"');
        }
    }
*/



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
    $incidentrows=mysqli_num_rows($sel7);
 
    $problemrows=mysqli_num_rows($sel8);
 
    $requestrows=mysqli_num_rows($sel9);
 /* mali
    //for new - array[]
    $cg1=mysqli_num_rows($sel7);
    //for resolved - array[3]
    $cg2=mysqli_num_rows($sel8);
    //for ongoing - array[1]
    $cg3=mysqli_num_rows($sel9);
    //for pending - array[2]
    $cg4=mysqli_num_rows($sel10);
    //for pending - array[4]
    $cg5=mysqli_num_rows($sel11);
    //for pending - array[5]
    $cg6=mysqli_num_rows($sel12);
    //for new - array[]
    $cg7=mysqli_num_rows($sel13);
    //for resolved - array[3]
    $cg8=mysqli_num_rows($sel14);
    //for ongoing - array[1]
    $cg9=mysqli_num_rows($sel15);
    //for pending - array[2]
    $cg10=mysqli_num_rows($sel16);
    //for pending - array[4]
    $cg11=mysqli_num_rows($sel17);
    //for pending - array[5]
    $cg12=mysqli_num_rows($sel18);
    //for new - array[]
    $cg13=mysqli_num_rows($sel19);
    //for resolved - array[3]
    $cg14=mysqli_num_rows($sel20);
    //for ongoing - array[1]
    $cg15=mysqli_num_rows($sel21);
    //for pending - array[2]
    $cg16=mysqli_num_rows($sel22);
    //for pending - array[4]
    $cg17=mysqli_num_rows($sel23);
    //for pending - array[5]
    $cg18=mysqli_num_rows($sel24);
    $categstat = [$cg1, $cg2, $cg3, $cg4, $cg5, $cg6, $cg7, $cg8, $cg9, $cg10, $cg11, $cg12, $cg13, $cg14, $cg15, $cg16, $cg17, $cg18];
    */

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
        "cancelled_rows" => $cancelledrows,
        "incident" => $incidentrows,
        "problem" => $problemrows,
        "requests" => $requestrows
     //mali   "categ_stat" => $categstat
    );
    echo json_encode($response);

    $conn->close();

?>