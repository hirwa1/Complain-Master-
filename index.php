<?php
session_start();
error_reporting(0);
include("include/config.php");
if(isset($_POST['submit']))
{
    $username=$_POST['username'];
    $password=$_POST['password'];
$ret=mysqli_query($con,"SELECT * FROM admin WHERE username='$username' and password='$password'");
$num=mysqli_fetch_array($ret);
if($ret)
{
// $extra="change-password.php";//
$extra="admin/admin_dashboard.php";
$_SESSION['alogin']=$_POST['username'];
$_SESSION['id']=$num['id'];
$host=$_SERVER['HTTP_HOST'];
$uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();
}
else
{
$_SESSION['errmsg']="Invalid username or password";
$extra="index.php";
$host  = $_SERVER['HTTP_HOST'];
$uri  = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();
}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMS | Admin login</title>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="css/theme.css" rel="stylesheet">
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
<style>
  * { font-family: 'Poppins', sans-serif;}
</style>    
</head>
<body>

    <div class="navbar navbar-fixed-top" >
        <div class="navbar-inner" style="background-color:black; " >
        <center>
            <div class="container" >
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i>
                </a>

                <a class="brand" href="#" style="color: white;">
                    Compaint Management System | Admin
                </a>


            </div></center>
        </div>
    </div>



    <div class="wrapper" style="min-height:80%;">
        <div class="container" >
            <div class="row" >
                <div class="module module-login span4 offset4" style="border-radius:5px;">
                    <form class="form-vertical" method="post" >
                        <div class="module-head">
                            <h3>Sign In -  Admin</h3>
                        </div>
                        <span style="color:red;" ><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
                        <div class="module-body">
                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" id="inputEmail" name="username" placeholder="Username">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls row-fluid">
                        <input class="span12" type="password" id="inputPassword" name="password" placeholder="Password">
                                </div>
                            </div>
                        </div>
                        <div class="module-foot">
                            <div class="control-group">
                                <div class="controls clearfix">
                                    <button type="submit" class="btn btn-primary pull-right" style="width:100%" name="submit">Login</button>
                                    
                                </div>
                            </div>
                        </div>
                    </form>

                    
                </div>
            
            </div>
           <center> <h2><a href="users" class=" btn btn-success">Citizen</a> &nbsp; <a href="sub" class="btn btn-success">Akagari</a></h2></center>
        </div>
    </div><!--/.wrapper-->
    <!-- -->

 <div class="footer">
        <div class="container">
             

            <b class="copyright">&copy; 2021 Complaint Management System </b> All rights reserved.
        </div>
         
    </div>
    <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
