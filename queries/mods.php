<?php
require 'connection.php';

$study = sanitize($_GET['study']);

$sql = "SELECT name FROM modality WHERE study_name = '$study'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$result = '[';
	while($row = mysqli_fetch_assoc($result)) {
		$result += '"'.$row['name'].'",';
	}
	echo substr( $result , 0 , strlen($result) - 1 ) . ']';
} else {
	echo '{"error":true}';
}
$conn->close();
?>