<?php
// $con = mysqli_connect("localhost","root","","complaint");
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

if(isset($_POST["userId"])&&isset($_POST["category"])){
$userId=$_POST['userId'];
$category=$_POST['category'];
$subcat=$_POST['subcategory'];
$state=$_POST['state'];
$complaintype=$_POST['complaintype'];
$complaintdetials=$_POST['complaindetails'];
$image=$_POST['complaintFile'];

 $upload_path="complaintdocs/".$complaintype.".png";


 $sql=mysqli_query($con,"insert into tblcomplaints(userId,category,subcategory,complaintType,state,noc,complaintDetails,complaintFile) values('$userId','$category','$subcat','$complaintype','$state','','$complaintdetials','$upload_path')");
  if($sql){
  
  file_put_contents($upload_path,base64_decode($image));
     $response = array(
        "status" => "success",
        "success" => true,
        "error" => false,
        "message" => "Complain saved successfully",
    );
    echo  json_encode(
        $response
    );
 }

 else{
       $response = array(
        "status" => "success",
        "success" => false,
        "error" => true,
        "message" => "Failed to upload Complain",
    );
    echo  json_encode(
        $response
    );
 }
}
else{
     $response = array(
        "status" => "fail",
        "success" => false,
        "error" => true,
        "message" => "Failed to upload Complain",
    );
    echo  json_encode(
        $response
    );
}
?>