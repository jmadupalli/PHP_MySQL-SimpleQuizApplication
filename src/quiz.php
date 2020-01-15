<!-- Developed by JayanthM -->

<?php
session_start();
include('database.php');
$msg = '';
$f=0;
if(isset($_COOKIE['tid']) || isset($_SESSION['tid'])){
    if(isset($_SESSION['tid']))
    $tid = mysqli_real_escape_string($con,$_SESSION['tid']);
    else
    $tid = mysqli_real_escape_string($con,$_COOKIE['tid']);
    if(isset($_POST['sub'])){
        $qid = mysqli_real_escape_string($con,$_POST['qid']);
        if(isset($_POST['ans']))
            $ans = mysqli_real_escape_string($con,$_POST['ans']);
        else
            $ans = "c0";
        $ques = mysqli_fetch_assoc(mysqli_query($con, "SELECT * FROM questions where qid='$qid'"));
        $corr = $ques['correct'];
        if($ans == $ques['correct'])
            mysqli_query($con,"UPDATE teams set `noq`=`noq`+1,`noc`=`noc`+1 WHERE tid='$tid' ");
        else
            mysqli_query($con,"UPDATE teams set `noq`=`noq`+1,`noi`=`noi`+1 WHERE tid='$tid' ");
        $team = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM teams where tid='$tid' "));
        mysqli_query($con, "INSERT INTO answers(tid,qid,ans,correct) VALUES('$tid','$qid','$ans','$corr')");
        $msg = "<div class='alert alert-success'>Question #".$team['noq']." answered. Answer the next one below: </div>";
    }
    $team = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM teams where tid='$tid' "));
    
    if($team['noq'] < 20){
        $f=0;
        $ques = mysqli_fetch_assoc(mysqli_query($con, "SELECT * from questions WHERE qid not in(SELECT qid from answers where tid = '$tid') ORDER BY RAND() LIMIT 1"));
    }
    else{
        $f=1;
        $tt = time();
        $msg = "<div class='alert alert-success'><b>Your Quiz Exam is completed.</b></div>";
        mysqli_query($con,"UPDATE teams set `end`='$tt' WHERE tid='$tid' ");
        $team = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM teams where tid='$tid' "));
        $dur = $team['end'] - $team['start'];
        mysqli_query($con,"UPDATE teams set `duration`='$dur' WHERE tid='$tid' ");
        unset($_COOKIE['tid']);
        setcookie("tid",null,"-1","/");
        session_destroy();       
    }

}else{
    header("Location:index.php");
    exit();
}
?>


<html>
<head>
<title>TE2k19 - Technical Quiz (CSE)</title>
<link rel="shortcut icon" href="favicon.png">
<link rel="stylesheet" href="bootstrap.min.css" />
<style>
label{
    margin:10px;
    font-size:17px;
    font-weight:bold;
}
</style>
<?php if($f == 1){
    echo '<script type="text/javascript">window.setTimeout(function(){

        window.location.href = "index.php";

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
    <div class="row" style="text-align:left;">
        <form action="" method="post" style="width:80%;margin:auto;" name="f1">
        <?php 
        echo $msg;
        if(!$f){ ?>
        <p style="font-weight:bold;font-size:24px;">Question: <?php echo $ques['ques'] ?> </p>
        <br/>
        <p style="font-weight:bold;font-size:24px;">Answer: </p>
        <br/>
        <div class="text-center">
        <input type='hidden' value="<?php echo $ques['qid'] ?>" name='qid' />
        <label class="radio-inline"><input type="radio" name="ans" value='c1' /><?php echo $ques['c1'] ?></label><br/>
        <label class="radio-inline"><input type="radio" name="ans" value='c2' /><?php echo $ques['c2'] ?></label><br/>
        <label class="radio-inline"><input type="radio" name="ans" value='c3' /><?php echo $ques['c3'] ?></label><br/>
        <label class="radio-inline"><input type="radio" name="ans" value='c4' /><?php echo $ques['c4'] ?></label><br/>
        <p style="display:inline-block;text-align:left;margin-top:40px;">Time Remaining:</p>
        <progress value="0" max="45" id="progressBar" style="width:50%;"></progress><br/>
        <input id="sub" type="submit" class="btn btn-primary" value="Submit Answer" name="sub" style="margin-top:50px;"/>
        </div>
        <?php }else{ ?>       
        <p style="font-size:24px;width:100%;text-align:center;">
            No. Of questions answered correctly: #<?php echo $team['noc'] ?><br/><br/>
            No. Of questions answered incorrectly: #<?php echo $team['noi'] ?><br/>
        </p>
        <?php } ?>
        </form>
    </div>
</div>
<script type="text/javascript">
document.onkeydown = function() {    
    switch (event.keyCode) { 
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false; 
        case 82 : //R button
            if (event.ctrlKey) { 
                event.returnValue = false; 
                event.keyCode = 0;  
                return false; 
            } 
    }
}
document.addEventListener('contextmenu', event => event.preventDefault());
var timeleft = 45;
var downloadTimer = setInterval(function(){
  document.getElementById("progressBar").value = 45 - --timeleft;
  if(timeleft <= 0)
    document.getElementById("sub").click();
},1000);
</script>
<?php include('footer.html') ?>
        