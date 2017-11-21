<?php
require 'connection.php';

$study = sanitize($_GET['study']);
$title = sanitize($_GET['title']);

$sql = "SELECT response FROM faq WHERE title = '$title'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	echo '{"response":"' . $row['response'] . '"}'
} else {
	echo '{"error":true}';
}
$conn->close();
?>