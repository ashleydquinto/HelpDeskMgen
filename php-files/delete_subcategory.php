<?php
    //necessary headers for CORS
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    //data decode (from json to array)
    $json = file_get_contents("php://input");
    $received_data = json_decode($json);

    //variable declaration
    $response = array();
    $data = array();
    
    //assigning received data to variables
    $id = $received_data->id;
    $sub = $received_data->sub;
    


    if($id != ''){
        $get_data = mysqli_query($conn, "SELECT * FROM issue_category where id = '$id'");
    
        while($rowcom = mysqli_fetch_assoc($get_data))
        {
            
            $data = unserialize($rowcom['sub_category']);
            $key = array_search($sub, $data);
            array_splice($data,$key,1);
            $savesub = serialize($data);
        }
 


        mysqli_query($conn,"UPDATE issue_category SET

            sub_category= '".$savesub."'
            WHERE id = '".$id."'
        ");

        $message = 'Sub-category has been deleted';
    }   
    else{
        $message = 'Will not proceed';
    }

    
 
    
    //creating response which will be sent to VUE file
    $response = array(
        "message" => $message
    );

    echo json_encode($response);

    $conn->close();
?>