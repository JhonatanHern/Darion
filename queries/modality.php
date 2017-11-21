<?php
require 'connection.php';

$name = sanitize($_GET['title']);

$sql = "SELECT indications AS i ,preparation AS p FROM modality WHERE name = '$name'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	echo '{"indications":"'.$row['i'].'","preparation":"'.$row['p'].'"}';
} else {
	echo '{"error":true}';
}
$conn->close();
?>