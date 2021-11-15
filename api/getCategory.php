<?php
//$con = mysqli_connect("localhost","root","","complaint");
$con = mysqli_connect("localhost","Toussaint","digitaloceaN@00d","complaint");
$response = array();
header('Content-Type: application/json');
 
if(mysqli_connect_errno())
{
    $response["error"] = TRUE;
    $response["message"] ="Faild to connect to database";
    echo json_encode($response);
    exit;
}

  $sql = "select id,categoryName from category ";

  $result = mysqli_query($con,$sql);
    // print_r($result); exit;
    if($result->num_rows==0){
        $response["error"] = TRUE;
        $response["message"] ="Data not found or Invalid request details.";
        echo json_encode($response);
        exit;
    }else{

    $category = array();
    $category['data'] = array();
    while ($row = $result -> fetch_assoc()) {
        extract($row);
        $complain_item = array(
               "id" => $id,
                "categoryName" => $categoryName,
        );
        // Push to array  
        array_push($category['data'], $complain_item);
        // turn it to json mode 
    }
    $response = array(
        "status" => "success",
        "success" => true,
        "error" => false,
        "message" => "Category fetched successfully", "data" =>$category['data'],
    );
    echo  json_encode(
        $response
    );
}
?>