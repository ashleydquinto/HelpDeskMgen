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
    /*$get_role = mysqli_query($conn, "SELECT role FROM user_management where username = 'trialaccount' AND status = 'active' ");
    $get_name = mysqli_query($conn, "SELECT name FROM user_management where username = '$username' AND status = 'active' ");

    $role_data = mysqli_fetch_assoc($get_role);
    $name_data = mysqli_fetch_assoc($get_name);

    $final_role = $role_data['role'];
    $final_name = $role_data['name'];
    
    $get_role = mysqli_query($conn, "SELECT role FROM user_management where name = '$username' AND status = 'active' ");
    $hi = mysqli_fetch_assoc($get_role);
    $hello = $hi['role'];
    */

    if(mysqli_num_rows($get_data) > 0)
    {
        while($row = mysqli_fetch_assoc($get_data))
        {
            if (sha1($password) == $row['password']) { 
            $response = array(
                "loginstatus" => "true",
                "name"=> $row['name'],
                "role"=> $row['role']
                
                
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