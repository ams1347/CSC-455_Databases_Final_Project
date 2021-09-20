<?php
	require_once('../mysqli_config.php'); //Connect to the database
	$query =	"SELECT platformName, manufacturer, model
				FROM Platform A NATURAL JOIN Model B";
	$result = mysqli_query($dbc, $query);
	//Fetch all rows of result as an associative array
	if($result)
		mysqli_fetch_all($result, MYSQLI_ASSOC); //get the result as an associative, 2-dimensional array
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
    <title>Query 1 - CSC 455 Final Project</title>
	<meta charset ="utf-8"> 
</head>
<body>
	<h2>Query 1 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>

	<table>
		<tr>
			<th>Platform Name</th>
			<th>Manufacturer</th>
			<th>Model</th>
		</tr>	
		<?php foreach ($result as $inspection) {
			echo "<tr>";
			echo "<td>".$inspection['platformName']."</td>";
			echo "<td>".$inspection['manufacturer']."</td>";
			echo "<td>".$inspection['model']."</td>";
			echo "</tr>";
		}
		?>
	</table>
</body>    
</html>


