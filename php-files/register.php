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
    $email = $received_data->email;
    $name = $received_data->name;
    $role = $received_data->role;
    $epass = sha1($password);
    $status = "Active";
    $checkemail = mysqli_query($conn, "select * FROM user_management WHERE username = '".$username."';");
                                    if(mysqli_num_rows($checkemail) == 0)
                                        {
    if ($username != '' && $password != '' && $email != '' && $name != '' && $role != '') {
    mysqli_query($conn,"INSERT INTO user_management(username, password, email, name, role, status) VALUES('".$username."','".$epass."','".$email."','".$name."','".$role."','".$status."')");

    $response = array(
        "message" => "User successfully created."
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
            "message" => "Username already exists"
        );

    }   

    echo json_encode($response);

    $conn->close();
?>