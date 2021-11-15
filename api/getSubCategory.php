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

if(!empty($_POST["catid"])){
  $catid=intval($_POST['catid']);
 if(!is_numeric($catid)){
    $response["error"] = TRUE;
    $response["message"] ="invalid industry id";
    echo json_encode($response);
    exit;
 }else{

$result = mysqli_query($con,"SELECT id,subcategory FROM subcategory WHERE categoryid ='$catid'");
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
        $subcategory_item = array(
               "id" => $id,
                "subcategory" => $subcategory,
        );
        array_push($category['data'], $subcategory_item);
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
 }
 
}
else {
    $response["error"] = TRUE;
    $response["message"] ="Invalid parameters";
    echo json_encode($response);
    exit;
}
?>