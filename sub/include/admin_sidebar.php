<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                    
                  <li class="mt">
                      <a href="admin_dashboard.php">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="admin_dashboard.php">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>


                  <li class="sub-menu">


                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Manage complains</span>
                      </a>


                      <ul class="sub">

                     
   <li><a href="notprocess-complaint.php">
                      <i class="icon-tasks"></i>
                      Unprocessed
                   <?php 
  $status=NULL; 
  $thth = $_SESSION['state'];                  
$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status is null and tblcomplaints.state='$thth'");
$num1 = mysqli_num_rows($rt);
{?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>
                    </a>
                  </li>



                          <li><a href="inprocess-complaint.php">
                      <i class="icon-tasks"></i>
                      Pending Complaint
                   <?php 
  $status="in Process";    
  $thth = $_SESSION['state'];                
$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='$status' and tblcomplaints.state='$thth'");
$num1 = mysqli_num_rows($rt);
{?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>
                    </a>
                  </li>




<li>
                    <a href="closed-complaint.php">
                      <i class="icon-inbox"></i>
                      Closed Complaints
       <?php 
  $status="closed";
  $thth = $_SESSION['state'];                   
$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='$status' and tblcomplaints.state='$thth'");
$num1 = mysqli_num_rows($rt);
{?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>

                    </a>
                  </li>

            





                        
                      </ul>
                  </li>



                  <li>
                <a href="manage-users.php">
                  <i class="fa fa-tasks"></i>
                  Manage users
                </a>
              </li>





                  





                  <li class="sub-menu">
                      <a href="logout.php" >
                          <i class="fa fa-tasks"></i>
                          <span>Logout</span>
                      </a>
                      
                  </li>




                 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>