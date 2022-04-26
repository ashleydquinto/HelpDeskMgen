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

    $action = 'show';

    if(isset($_GET['action'])){
        $action = $_GET['action'];
    }

    $temporal = array();
    $response = array();

    if($action == 'show'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE requestor !="" ORDER BY date_created DESC ');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }

    if($action == 'new'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "New") ORDER BY date_created DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }

    if($action == 'ongoing'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "Ongoing") ORDER BY date_created DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }

    if($action == 'pending'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "Pending") ORDER BY date_created DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }
    
    if($action == 'resolved'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "Resolved") ORDER BY date_resolved DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }

    if($action == 'closed'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "Closed") ORDER BY date_created DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }

    if($action == 'cancelled'){
        $sel = $conn -> query(' SELECT * FROM ticket WHERE (requestor !="" AND status = "Cancelled") ORDER BY date_created DESC');//AND status ="available"

        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }
    /*will be used once search is added
    if($action == 'search'){
        $keyword = $_POST['keyword'];
        $sel = $conn -> query("SELECT * FROM table_users WHERE status = 'available' AND (firstName LIKE '%$keyword%' OR lastName LIKE '%$keyword%' OR email LIKE '%$keyword%')");
        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
        }
    }
    */

    

    

    echo json_encode($response);

    $sel->close();
    $conn->close();

    
?>