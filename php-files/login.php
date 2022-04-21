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

    $username = $received_data->username;
    $password = $received_data->password;
    
    $get_data = mysqli_query($conn, "SELECT * FROM user_management where username = '$username' AND status = 'active' ");

    if(mysqli_num_rows($get_data) > 0)
    {
        while($row = mysqli_fetch_assoc($get_data))
        {
            if (sha1($password) == $row['password']) { 
            $response = array(
                "loginstatus" => "true"
                
                
            );
            
        }
        else{
            $response = array(
                "loginstatus" => "false",
                "message" => "Invalid Password"
                
            );
        }
        }
    }
    else{
        $response = array(
            "loginstatus" => "false",
            "message" => "Account doesn't exist"
            
        );
    }


    

    echo json_encode($response);

    $conn->close();
?>