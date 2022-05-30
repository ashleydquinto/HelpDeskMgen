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
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);
    

    
    $date1 = $received_data->date1 . " 00:00:00";
    $date2 = $received_data->date2 . " 23:59:59";
    $categ = $received_data->categ;
        
       
     
    $temporal = array();
    $response = array();
    
    if($categ == 'Requests'){
        $sel = $conn -> query(' SELECT * FROM request_table WHERE requestor !="" AND date_created BETWEEN "'.$date1.'" AND "'.$date2.'" ORDER BY date_created DESC ');//AND status ="available"
       
        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }
    elseif($categ == 'Incidents'){
        $sel = $conn -> query(' SELECT * FROM incident_table WHERE requestor !="" AND date_created BETWEEN "'.$date1.'" AND "'.$date2.'" ORDER BY date_created DESC ');//AND status ="available"
       
        while($row = $sel -> fetch_assoc()){
            $temporal = $row;
            array_push($response, $temporal);
            
        }

    }
    elseif($categ == 'Problems'){
        $sel = $conn -> query(' SELECT * FROM problem_table WHERE requestor !="" AND date_created BETWEEN "'.$date1.'" AND "'.$date2.'" ORDER BY date_created DESC ');//AND status ="available"
       
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
