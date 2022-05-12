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
    $assigned_engineer = $received_data->assigned_engineer;
    $sla = $received_data->sla;
    $status = $received_data->status;
    $diagnostic = $received_data->diagnostic;
    $resolution = $received_data->resolution;
    $comments = $received_data->comments;
    $priority = $received_data->priority;

    //to decide what to do
    $action = $received_data->action;
 

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

    if($id != '' AND $action != '' AND $action == 'request' AND $action != 'incident' AND $action != 'problem'){
        if($assigned_engineer !=''){
            mysqli_query($conn,"UPDATE request_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."',
            date_responded = CURRENT_TIMESTAMP()
            WHERE id = '".$id."'
        ");
        }
        else{
            mysqli_query($conn,"UPDATE request_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."'
            WHERE id = '".$id."'
            ");
        }
        

        

        $message = 'Updated Successfully';
    }   
    elseif($id != '' AND $action != '' AND $action == 'incident' AND $action != 'request' AND $action != 'problem'){
        if($assigned_engineer !=''){
            mysqli_query($conn,"UPDATE incident_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."',
            date_responded = CURRENT_TIMESTAMP()
            WHERE id = '".$id."'
        ");
        }
        else{
            mysqli_query($conn,"UPDATE incident_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."'
            WHERE id = '".$id."'
            ");
        }

        $message = 'Updated Successfully';
    }
    elseif($id != '' AND $action != '' AND $action == 'problem' AND $action != 'request' AND $action != 'incident'){
        if($assigned_engineer !=''){
            mysqli_query($conn,"UPDATE problem_table SET
            assigned_engineer= '".$assigned_engineer."',
            sla= '".$sla."',
            status = '".$status."',
            diagnostic= '".$diagnostic."',
            resolution= '".$resolution."',
            comments= '".$comments."',
            priority= '".$priority."',
            date_responded = CURRENT_TIMESTAMP()
            WHERE id = '".$id."'
        ");
        }
        else{
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
        }

        $message = 'Updated Successfully';
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

