<!-- Developed by JayanthM -->

<?php
session_start();
include('database.php');
if(isset($_COOKIE['tid']) || isset($_SESSION['tid'])){
    header("Location:quiz.php");
    exit();
}
$msg = "";
$f = 0;
if(isset($_POST['sub'])){
    $mem1 = mysqli_real_escape_string($con,$_POST['mem1']);
    if(isset($_POST['mem2']))
    $mem2 = mysqli_real_escape_string($con,$_POST['mem2']);
    else
    $mem2="";
    if(isset($_POST['mem3']))
    $mem3 = mysqli_real_escape_string($con,$_POST['mem3']);
    else
    $mem3="";
    if(mysqli_num_rows(mysqli_query($con, "SELECT * from students where tid='0' AND (rollno='$mem1' OR rollno='$mem2' OR rollno='$mem3')")) > 0){
        $curr = time();
        mysqli_query($con, "INSERT INTO teams(`mem1`,`mem2`,`mem3`,`start`) VALUES('$mem1','$mem2','$mem3','$curr')");
        $arr = mysqli_fetch_array(mysqli_query($con,"SELECT * from teams where mem1='$mem1'"));
        mysqli_query($con,"UPDATE students SET tid='$arr[0]' WHERE rollno='$mem1' or rollno='$mem2' or rollno='$mem3'");
        $msg = "<div class='alert alert-success'>Team Registered, Please wait while we redirect you to the exam page.</div>";
        $f=1;
        $_SESSION['tid'] = $arr[0];
        setcookie("tid",$arr[0],time()+(86400), "/");
    }else{
        $msg = "<div class='alert alert-danger'>Not all team members have registered through the website or have already registered in another team.</div>";
    }
}
?>
<html>
<head>
<title>TE2k19 - Technical Quiz (CSE)</title>
<link rel="shortcut icon" href="favicon.png">
<link rel="stylesheet" href="bootstrap.min.css" />
<style> 
input{
    margin:10px;
}
</style>
<?php if($f == 1){
    echo '<script type="text/javascript">window.setTimeout(function(){

        window.location.href = "quiz.php";

    }, 3500);
    </script>';
}
?>
</head>
<body class="text-center">
<div id="header" style="width:100%;">
<h1>Technical Quiz - TechEuphoria 2k19</h1>
</div><hr/>
<div class="container">
    <h3>Team Registration</h3>
    <?php echo $msg ?>
    <div class="row">
        <form action="" method="post" style="width:80%;margin:auto;">
        <input name="mem1" type="text" class="form-control" placeholder="Team member #1 Rollnumber" required/>
        <input name="mem2" type="text" class="form-control" placeholder="Team member #2 Rollnumber" />
        <input name="mem3" type="text" class="form-control" placeholder="Team member #3 Rollnumber" />
        <input name="sub" type="submit" class="btn btn-primary" value="Register Team" />
        </form>

        <div class="alert alert-info" style="margin-top:30px;">Not registered as a student yet? If so, <a href="register.php" target="_blank">Click Here to register</a></div>
    </div>
</div>
<?php include('footer.html') ?>
        