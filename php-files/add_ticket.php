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
    $requestor = $received_data->requestor;
    $department = $received_data->department;
    $contact_no = $received_data->contact_no;
    $issue = $received_data->issue;
    $description = $received_data->description;
    $justification = $received_data->justification;
    $status = $received_data->status;

    //query executed if fields are not empty    

    if($requestor != '' && $department != '' && $contact_no != '' && $description != '' && $justification != ''){
        //PREVIOUS QUERY (DI NA GAGAMITIN)
        //mysqli_query($conn,"INSERT INTO ticket(requestor,department,contact_no,issue,description,justification,status,assigned_engineer, sla, diagnostic,resolution,comments) VALUES('".$requestor."','".$department."','".$contact_no."','".$issue."','".$description."','".$justification."','','','','','','')");

        //MGA DI NA LALAGYAN
        //request_category, status, assigned_engineer, sla, diagnostic, resolution, comments
        mysqli_query($conn,"INSERT INTO ticket(
            requestor,
            department,
            contact_no,
            issue,
            description,
            justification,
            status
            ) 
            VALUES(
            '".$requestor."',
            '".$department."',
            '".$contact_no."',
            '".$issue."',
            '".$description."',
            '".$justification."',
            '".$status."'
            )
        ");

        $message = 'Form Inserted';
    }   
    else{
        $message = 'Please input all fields';
    }

    
    
    
    //creating response which will be sent to VUE file
    $response = array(
        "message" => $message
    );

    echo json_encode($response);

    $conn->close();



    


?>

