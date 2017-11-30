<?php
require 'connection.php';

$study = sanitize($_GET['study']);

$sql = "SELECT title FROM tips WHERE study_name = $study";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$answers = '[';
	while($row = mysqli_fetch_assoc($result)) {
		$answers .= '"'.$row['title'].'",';
	}
	echo substr( $answers , 0 , strlen($answers) - 1 ) . ']';
} else {
	echo '{"error":true}';
}
$conn->close();
?>