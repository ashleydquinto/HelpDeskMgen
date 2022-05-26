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

    
    $temporal2 = array();
    $response = array();
    $array1 = array();
 
    if($action == 'show'){
        $sel = mysqli_query($conn, "SELECT * FROM issue_category");
        if(mysqli_num_rows($sel) > 0)
    {
        while($row = $sel -> fetch_assoc()){
            if($row['sub_category'] != null || $row['sub_category'] != '') {
                $array1 = unserialize($row['sub_category']);
            }
            $length = sizeof($array1);
            
            
            
            
            $i = 0;
            
            while($length > $i) {
                $temporal = array("id"=>$row['id'], 
                "title"=>$row['title'], 
                "sub_category"=>$array1[$i]);
                    array_push($response, (object)$temporal);
                    $i++;
            }
            if($length == 0) {
                $temporal2 = $row;
                array_push($response, (object)$temporal2);
            }
        }
        
            
            
        }
        else {
            $response = "none";
        }
    }
    

    echo json_encode($response);
    

    $sel->close();
    $conn->close();

    
?>