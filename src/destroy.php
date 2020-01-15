<?php
session_start();
unset($_COOKIE['tid']);
setcookie("tid",null,"-1","/");
session_destroy(); 
?>