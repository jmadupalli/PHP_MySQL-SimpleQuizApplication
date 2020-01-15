<html>
<head>
<title>TE2k19 - Technical Quiz (CSE)</title>
<link rel="shortcut icon" href="favicon.png">
<link rel="stylesheet" href="bootstrap.min.css" />

</head>
<?php
include('database.php');
$f = 0;
if(isset($_POST['submit'])){
    $rollno = mysqli_real_escape_string($con,strtolower($_POST['rollno']));
    $name = mysqli_real_escape_string($con,$_POST['name']);
    $clgn = mysqli_real_escape_string($con,strtolower($_POST['clg']));
    $clgc = mysqli_real_escape_string($con,strtolower($_POST['clgc']));
    $email = mysqli_real_escape_string($con,$_POST['email']);
    $phno = mysqli_real_escape_string($con,$_POST['phno']);
    if(mysqli_num_rows(mysqli_query($con, "SELECT id from students where rollno='".$rollno."' ")) == 0){
    mysqli_query($con,"INSERT into students(name,rollno,clg,clgcode,email,phone) VALUES('$name','$rollno','$clgn','$clgc','$email','$phno') ");
        $msg = "<div class='alert alert-success'>Registered Succesfully.</div>";
    }else{
        $msg = "<div class='alert alert-danger'>You are already registered.</div>";
    }
    $f = 1;
}

if($f == 1){
    echo '<script type="text/javascript">window.setTimeout(function(){

        window.location.href = "index.php";

    }, 3500);
    </script>';
}    
?>
<body class="text-center">
<div id="header" style="width:100%;">
<h1>Technical Quiz - TechEuphoria 2k19</h1>
</div><hr/>
<div class="container">
    <h3>Student Registration</h3>
    <?php echo $msg ?>
    <div class="row">
        <form action="" method="post" style="width:80%;margin:auto;">
            <input type="text" id="rollno" name="rollno" placeholder="Your Roll no." required><br/>

            <input type="text" id="name" name="name" placeholder="Your Name" required><br/>

            <input type="text" id="clg" name="clg" placeholder="Your College Name" required><br/>
            <input type="text" id="clgc" name="clgc" placeholder="Your College Code" required><br/>
            <input type="email" id="email" name="email" placeholder="Email Id" required><br/>
            <input type="text" id="phno" name="phno" placeholder="Your Phone no." required><br/>
            <button type="submit" id="submit" name="submit" class="btn btn-primary" >Register</button>

        </form>
    </div>
</div>
<?php include('footer.html') ?>