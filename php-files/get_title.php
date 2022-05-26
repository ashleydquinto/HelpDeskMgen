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

    

    $response = array();
  
 
    if($action == 'show'){
        $sel = mysqli_query($conn, "SELECT * FROM issue_category");
        if(mysqli_num_rows($sel) > 0)
    {
        while($row = $sel -> fetch_assoc()){
            array_push($response, $row['title']);
        }
        
            
            
        }
        
    }
    

    echo json_encode($response);
    

    $sel->close();
    $conn->close();

    
?>