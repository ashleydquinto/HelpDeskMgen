<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    $sel = $conn -> query('SELECT * FROM issue_category');

    $temporal = array();
    $response = array();
    $array1 = array();
    while($row = $sel -> fetch_assoc()){
        if($row['sub_category'] != null || $row['sub_category'] != '') {
            $array1 = unserialize($row['sub_category']);
        }
        $length = sizeof($array1);
        
        
        
        
        $i = 0;
        
        while($length > $i) {
            $temporal = array("title"=>$row['title'] . " - " . $array1[$i]);
                array_push($response, (object)$temporal);
                $i++;
        }
        if($length == 0) {
            $temporal = $row;
        array_push($response, $temporal);
        }
        
    }

    echo json_encode($response);

    $sel->close();
    $conn->close();

?>