<?php
	function sanitize($s){
		return '\''.str_replace('\'','\\\'',str_replace('"','\\"',$s)).'\'';
	}
	$servername = "localhost";
	$username = "serofcai_DarionR";
	$password = "help me if you can";
	$dbname = "serofcai_Darion";

	$conn = mysqli_connect($servername, $username, $password, $dbname);
	
	if (!$conn) {
		die("Connection failed");
	}
?>