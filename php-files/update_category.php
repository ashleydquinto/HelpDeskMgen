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
    $categ = $received_data->categ;
    $tempo = $received_data->tempo;
    


    if($id != '' && $categ != ''){
        $get_data = mysqli_query($conn, "SELECT * FROM issue_category where id = '$id'");
    
        while($rowcom = mysqli_fetch_assoc($get_data))
        {
            if($sub != null || $sub != '') {
            $data = unserialize($rowcom['sub_category']);
            $key = array_search($tempo, $data);
            if ($sub != $tempo) {
            
            $data[$key] = $sub;
            $savesub = serialize($data);
        }
        
    }
        }
 

        if(($sub != null || $sub != '') && $sub != $tempo) {
        mysqli_query($conn,"UPDATE issue_category SET
            title= '".$categ."',
            sub_category= '".$savesub."'
            WHERE id = '".$id."'
        ");
        $message = 'Updated Successfully';
        }
        elseif($sub == null || $sub == '' || $sub == $tempo) {
            mysqli_query($conn,"UPDATE issue_category SET
            title= '".$categ."'
            WHERE id = '".$id."'
        ");
        $message = 'Updated Successfully';
        }
        else {
            $message = "Will not proceed"; 
        }
        
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