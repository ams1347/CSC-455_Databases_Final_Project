<?php
	require_once('../mysqli_config.php'); //Connect to the database
	$query = "SELECT model FROM Model WHERE platformName LIKE '%PlayStation%'";
	$result = mysqli_query($dbc, $query);
	if($result)
		mysqli_fetch_all($result, MYSQLI_ASSOC);
	else {
		echo "<h2>We are unable to process this request right now.</h2>"; 
		echo "<h3>Please try again later.</h3>";
		exit;
	}
	mysqli_close($dbc);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Query 6 - CSC 455 Final Project</title>
	<meta charset ="utf-8">
	<!--Max Groover-->
</head>
<body>
	<h2>Query 6 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>
	<table>
		<tr>
			<th>All PlayStation Models</th>
		</tr>	
		<?php foreach ($result as $inspection) {
			echo "<tr>";
			echo "<td>".$inspection['model']."</td>";
			echo "</tr>";
		}
		?>
	</table>
</body>
</html>