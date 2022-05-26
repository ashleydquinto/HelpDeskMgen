<?php
  
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Content-type: application/json");
    header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');

    include 'connection.php';

    $json = file_get_contents("php://input");
    $received_data = json_decode($json);

    $response = array();
    $data = array();

    $title = $received_data->title;
    $sub = $received_data->sub;
    
    $checktitle = mysqli_query($conn, "select * FROM issue_category WHERE title = '".$title."';");
    
    if(mysqli_num_rows($checktitle) == 0)
    {
        if ($title != '') {
            if ($sub != '' || $sub != null) {
            $array1 = array($sub);
            $savesub = serialize($array1);
        mysqli_query($conn,"INSERT INTO issue_category(title,sub_category) VALUES('".$title."', '".$savesub."')");
    }
    else {
        mysqli_query($conn,"INSERT INTO issue_category(title) VALUES('".$title."')");
    }
        $response = array(
            "message" => "Issue Category successfully created."
        );
        }
        else {
            $response = array(
                "message" => "Please fill up all fields"
            );
        }
    }
else {
    $response = array(
        "message" => "Issue Category already exists"
    );

}   

    echo json_encode($response);
    
    $conn->close();
?>