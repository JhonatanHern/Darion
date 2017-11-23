<?php
/*
 * The user serofcai_DarionR has only-read access to the database.
*/
header('Content-Type: application/json');
error_reporting(0);
ini_set('display_errors', 0);

function sanitize($s){
	return '\''.str_replace('\'','\\\'',str_replace('"','\\"',$s)).'\'';
}
/*
$servername = "localhost";
$username = "serofcai_DarionR";
$password = "help me if you can";
$dbname = "serofcai_Darion";
*/


$servername = "localhost";
$username = "root";
$password = "facebook2.0";
$dbname = "serofcai_DarionR";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
	die("Connection failed");
}
?>