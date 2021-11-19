
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );



if(isset($_POST['send']))
{
	$sender=$_SESSION['id'];
	$rec=$_GET['uid'];
    $msg =$_POST['msg'];
    $time = date("Y - m - d") . " " . date("h:i A");
$sql=mysqli_query($con,"insert into chat(sender , receiver, msg , time) values('$sender','$rec' , '$msg' , '$time')");
$_SESSION['msg']="Category Created !!";

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Manage Users</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CMS | Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
		<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>
</head>
<body>
	<section id="container" >
<?php include('include/header.php');?>
<?php include('include/admin_sidebar.php');?>				

	<section id="main-content">
          <section class="wrapper">
			<div class="row">
			<div class="col-lg-9 main-chart">
					<div class="content" style="margin-left: 20px;">

	<div class="module">
							<div class="module-head">
								<h3>Chat With Sub-Admin</h3>
							</div>
							<div class="module-body" style=" padding: 20px;">



							
								
 <?php
 
  $userid=$_GET['uid'];
  $admin = $_SESSION['id'];
  $query=mysqli_query($con,"select * from chat where (sender='$admin' and receiver='$userid') or (sender='$userid' and receiver='$admin') ");
while($row=mysqli_fetch_array($query))
{
?>									
									
											<?php
                                            $sender = $row['sender'];
                                            if ($sender == $admin){

                                            ?>


											<p style="  padding:20px;  ">
                                            <span style="float:right; background-color: #f1f1f1; padding:10px; border-radius:10px; ">
                                            <?php echo htmlentities($row['msg']);?>
                                             &nbsp;
											<i>
                                                <?php echo htmlentities($row['time']);?>
                                            </i>
                                        </span>
                                    </p>

                                            <?php
                                            }
                                            else{
                                                ?>
                                             <p style="   padding:10px;"> 
                                              <span style=" background-color: #f1f1f1; padding:10px; border-radius:10px; max-width:80%;"> <?php echo htmlentities($row['msg']);?> &nbsp;
                                                <?php echo htmlentities($row['time']);?></span></p>
                                                <?php 
                                            }
                                            ?>

											
										<?php  } ?>
										<br>
								<form style="display:flex; justify-content: space-between; width:100%" method="post" action="">
                                    <input type="text" name="msg" required style="height:38px; width:89.5%;  border: 2px solid #f1f1f1; border-radius:10px;">
                                    <input type="submit" name="send" value="send" class="btn btn-sucess" style="width:10%; height:38px; border: 2px solid #f1f1f1; border-radius:10px;"> 
                                        </form>
							</div>
						</div>						

						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</section><!--/.container-->
		<?php include('include/footer.php');?>
	</section><!--/.wrapper-->



	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	 <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>