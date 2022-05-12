<?php
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include '../../connection.php';

    
    //data decode (from json to array)
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);

    //assigning received data to variables
    $id = $received_data->id;

    if($id != ''){
        $sel = $conn -> query('SELECT date_created FROM incident_table WHERE id = "'.$id.'" ');
        $sel2 =  $conn -> query('SELECT date_resolved FROM incident_table WHERE id = "'.$id.'" ');
    
        $date1 = mysqli_fetch_row($sel);
        $date_created = $date1[0];

        $date2 = mysqli_fetch_row($sel2);
        $date_resolved = $date2[0];

        //$date2 = mysqli_fetch_assoc($sel2);
        
        //$created_date=(string)$date1[$date_created];
        //$resolved_date=(string)$date2[$date_resolved];
    
        //creating response which will be sent to VUE file
        $response = array(
            "id" => $id,
            "message" => 'Successfully captured dates',
            "date_created" => $date_created,
            "date_resolved" => $date_resolved
        );
    }
    else{
        $response = array(
            "message" => 'Unable to proceed'
        );
    }

    echo json_encode($response);

    $conn->close();

?>