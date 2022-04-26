<?php


    /*
    $image = '';

    if(isset($_FILES['file']['name'])){
        $image_name = $_FILES['files']['name'];
        $valid_extensions = array("jpg", "jpeg", "png", "docx", "doc", "txt");
        $extensions = pathinfo($imagename, PATHINFO_EXTENSION);
        if(in_array($extension, $valid_extensions))
        {
            $upload_path = '../src/upload/' . time() . '.' . $extension;
            if(move_uploaded_file($_FILES['files']['tmp_name'], $upload_path)){
                $message = 'File uploaded';
            }
            else{
                $message = 'There is an error while uploading file';
            }
        }
        else
        {
            $message = 'Only .jpg, .jpeg, .png, .docx, and .txt files are allowed.';
        }

    }

    else{
        $message = 'Select file.';
    }

    echo $message;
    */
  
    header('Access-Control-Allow-Origin: *');  

  
    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../src/upload/".$_FILES['file']['name'])) {
        $response = array(
            "message" => 'File has been uploaded successfully.'
        );
    }
    else{
        $response = array(
            "message" => 'Unable to upload file.'
        );
    }

    echo json_encode($response);
?>