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
    $id = $received_data->id2;
    $response2 = array();
    $get_data = mysqli_query($conn, "SELECT * FROM request_table where id = '$id'");
    if(mysqli_num_rows($get_data) > 0)
    {
        while($rowcom = mysqli_fetch_assoc($get_data))
        {
            
            $response2 = unserialize($rowcom['comments']);

        }
    }
    
    echo json_encode($response2);

    
    $conn->close();

    
?>