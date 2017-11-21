<?php
require 'connection.php';

$study = sanitize($_GET['study']);

$sql = "SELECT title FROM faq WHERE study_name = '$study' LIMIT 50";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
	$result = '[';
	while($row = mysqli_fetch_assoc($result)) {
		$result += '{"title":"'.$row['title'].'"}';
	}
	echo substr( $result , 0 , strlen($result) - 1 ) . ']';
} else {
	echo '{"empty":true}';
}
$conn->close();
?>