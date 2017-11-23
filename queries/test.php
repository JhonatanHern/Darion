<?php
require 'connection.php';

$sql = "SHOW TABLES";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	while($row = mysqli_fetch_array($result)) {
		echo $row[0];
	}
} else {
	echo '{"error":true}';
}
$conn->close();
?>