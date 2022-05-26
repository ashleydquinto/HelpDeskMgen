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


    //$problem = 'notproceed';

    //assigning received data to variables
    $id = $received_data->id;
    
    $comments =  $received_data->commentname . ": " . $received_data->comments;

    
    //to decide what to do
    $action = $received_data->action;
    $test = array();

    /*
    if($id != '' AND $action != '' AND $action = 'problem' AND $action != 'request' AND $action != 'incident'){
        mysqli_query($conn,"UPDATE problem_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."'
            WHERE id = '".$id."'
        ");

        $message = 'Updated Successfully';

        //creating response which will be sent to VUE file
        $response = array(
            "message" => $message
        );

        echo json_encode($response);

        $conn->close();

        die();
    }
    else{
        echo "Proceeding to other statements";
    }
    */
    if($received_data->comments != '' || $received_data->commentname != '') {
    if($id != '' AND $action != '' AND $action == 'request' AND $action != 'incident' AND $action != 'problem'){
        $get_data = mysqli_query($conn, "SELECT * FROM request_table where id = '$id'");
    if(mysqli_num_rows($get_data) > 0)
    {
        while($rowcom = mysqli_fetch_assoc($get_data))
        {
            if($rowcom['comments'] != '' || $rowcom['comments'] != null) {
           $test = unserialize($rowcom['comments']);
           array_push($test, $comments);
           $savecomment = serialize($test);
            }
            else {
                $commentarray = array();
                array_push($commentarray, $comments);
                $savecomment = serialize($commentarray);
            }
        }
    }
    
    
    
    


        
            mysqli_query($conn,"UPDATE request_table SET

comments= '".$savecomment."'
            WHERE id = '".$id."'
        ");
      
       
        $message = "Updated Successfully";
    }   
    elseif($id != '' AND $action != '' AND $action == 'incident' AND $action != 'request' AND $action != 'problem'){
        $get_data = mysqli_query($conn, "SELECT * FROM incident_table where id = '$id'");
        if(mysqli_num_rows($get_data) > 0)
        {
            while($rowcom = mysqli_fetch_assoc($get_data))
            {
                if($rowcom['comments'] != '' || $rowcom['comments'] != null) {
               $test = unserialize($rowcom['comments']);
               array_push($test, $comments);
               $savecomment = serialize($test);
                }
                else {
                    $commentarray = array();
                    array_push($commentarray, $comments);
                    $savecomment = serialize($commentarray);
                }
            }
        }
        
        
        
        
    
    
            
                mysqli_query($conn,"UPDATE incident_table SET
    
    comments= '".$savecomment."'
                WHERE id = '".$id."'
            ");
          
           
            $message = "Updated Successfully";
    }
    elseif($id != '' AND $action != '' AND $action == 'problem' AND $action != 'request' AND $action != 'incident'){
        
    
    $get_data = mysqli_query($conn, "SELECT * FROM problem_table where id = '$id'");
    if(mysqli_num_rows($get_data) > 0)
    {
        while($rowcom = mysqli_fetch_assoc($get_data))
        {
            if($rowcom['comments'] != '' || $rowcom['comments'] != null) {
           $test = unserialize($rowcom['comments']);
           array_push($test, $comments);
           $savecomment = serialize($test);
            }
            else {
                $commentarray = array();
                array_push($commentarray, $comments);
                $savecomment = serialize($commentarray);
            }
        }
    }
    
    
    
    


        
            mysqli_query($conn,"UPDATE problem_table SET

comments= '".$savecomment."'
            WHERE id = '".$id."'
        ");
      
       
        $message = "Updated Successfully";
    }
    else{
        $message = 'Will not proceed';
    }

}
else {
    $message = "Comment is null";
}
    
    
    //creating response which will be sent to VUE file
    $response = array(
        "message" => $message
    );

    echo json_encode($response);

    $conn->close();



    


?>

