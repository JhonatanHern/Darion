<?php
require 'connection.php';

$study = sanitize($_GET['study']);

$sql = "SELECT title FROM faq WHERE study_name = $study LIMIT 50";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$data = '[';
	while($row = mysqli_fetch_array($result)) {
		$data .= '"'.$row[0].'",';
		//echo '"'.$row[0].'",';
	}
	echo substr( $data , 0 , strlen($data) - 1 ) . ']';
} else {
	echo '{"empty":true}';
}
$conn->close();
?>