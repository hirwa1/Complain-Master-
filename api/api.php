<?php 
// header('Access-Controll-Allow-Origin: *');
// header('Content-Type:application/json');

// step 1: connect to database
// mysqli_connect function has 4 params (host,user name, password,database_name)
//$con = mysqli_connect("localhost","root","","complaint");

$con = mysqli_connect("localhost","Toussaint","digitaloceaN@00d","complaint");
 
 //include("includes/config.php");
$response = array();
header('Content-Type: application/json');
 
if(mysqli_connect_errno())
{
    $response["error"] = TRUE;
    $response["message"] ="Faild to connect to database";
    echo json_encode($response);
    exit;
}


if(isset($_POST["type"]) &&($_POST["type"]=="signup") &&
	isset($_POST["fullName"])&&
	isset($_POST["userEmail"]) &&

	isset($_POST["password"]) &&
	isset($_POST["contactNo"])&&
	isset($_POST["address"]))
{
    // signup user
    $fullName = $_POST["fullName"];
    $userEmail = $_POST["userEmail"];
    $password = md5($_POST["password"]);
    $contactNo = $_POST["contactNo"];
    $address = $_POST["address"];



 
    //check user userEmail whether its already regsitered
    $checkEmailQuery = "select * from users where userEmail = '$userEmail'";
    $result = mysqli_query($con,$checkEmailQuery);
    // print_r($result); exit;
    if($result->num_rows>0){
        $response["error"] = TRUE;
        $response["message"] ="Sorry userEmail already found.";
        echo json_encode($response);
        exit;
    }else{
        $signupQuery = "INSERT INTO users(fullName,userEmail,password,contactNo,address) values('$fullName','$userEmail','$password','$contactNo','$address')";
        $signupResult = mysqli_query($con,$signupQuery);
        if($signupResult){
            // Get Last Inserted ID
            $id = mysqli_insert_id($con);
            // Get User By ID
            $userQuery = "SELECT id,fullName,userEmail,contactNo,address FROM users WHERE id = ".$id;
            $userResult = mysqli_query($con,$userQuery);
             
            $user = mysqli_fetch_assoc($userResult);
             
            $response["error"] = FALSE;
            $response["message"] = "Successfully signed up.";
            $response["user"] = $user;
            echo json_encode($response);
            exit;
        }else{
            $response["error"] = TRUE;
            $response["message"] ="Unable to signup try again later.";
            echo json_encode($response);
            exit;
        }
         
    }
 
}else if(isset($_POST["type"]) && ($_POST["type"]=="login") && isset($_POST["userEmail"])&& isset($_POST["password"])){
    //login user
 
    $userEmail = $_POST["userEmail"];
    $password = md5($_POST["password"]);
 
    $userQuery = "select * from users where userEmail = '$userEmail' && password = '$password'";
    $result = mysqli_query($con,$userQuery);
    // print_r($result); exit;
    if($result->num_rows==0){
        $response["error"] = TRUE;
        $response["message"] ="user not found or Invalid login details.";
        echo json_encode($response);
        exit;
    }else{
        $user = mysqli_fetch_assoc($result);
        $response["error"] = FALSE;
        $response["message"] = "Successfully logged in";
        $response["user"] = $user;
        echo json_encode($response);
        exit;
    }
 
}else if(isset($_POST["type"]) && ($_POST["type"]=="getDashboard") && isset($_POST["userId"])){
    //login user
 
    $userId = $_POST["userId"];

    $userQuery = "select * from tblcomplaints where userId = '$userId'";


    $result = mysqli_query($con,$userQuery);
    // print_r($result); exit;
    if($result->num_rows==0){
        $response["error"] = TRUE;
        $response["message"] ="Data not found or Invalid request details.";
        echo json_encode($response);
        exit;
    }else{
    $product = array();
    $product['data'] = array();
    while ($row = $result -> fetch_assoc()) {
        extract($row);
        $complain_item = array(
               "complaintNumber" => $complaintNumber,
                "category" => $category,
                "subcategory" => $subcategory,
                "complaintType" => $complaintType,
                "state" => $state,
                "noc" => $noc,
                "complaintDetails" => $complaintDetails,
                "complaintFile" => $complaintFile,
                "regDate" => $regDate,
                "status" => $status,
                "lastUpdationDate" => $lastUpdationDate,
        );
        // Push to array  
        array_push($product['data'], $complain_item);
        // turn it to json mode 
    }

    $response = array(
        "status" => "success",
        "success" => true,
        "error" => false,
        "message" => "Complain fetched successfully", "data" =>$product['data'],
    );
    echo  json_encode(
        $response
    );
    } 
 
       }

else {
    // Invalid parameters
    $response["error"] = TRUE;
    $response["message"] ="Invalid parameters";
    echo json_encode($response);
    exit;
}
?>