<?php
require 'connection.php';

$title = sanitize($_GET['title']);

$sql = "SELECT information FROM tips WHERE title = '$title'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	echo '{"information":"' . $row['information'] . '"}'
} else {
	echo '{"error":true}';
}
$conn->close();
?>