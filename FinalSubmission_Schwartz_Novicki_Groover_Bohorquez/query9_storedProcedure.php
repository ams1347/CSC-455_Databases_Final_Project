<?php
	if(!empty($_GET['mfr_name'])) {
		$mfr_name = $_GET['mfr_name'];
		
		require_once('../mysqli_config.php');
		//Retrieve specific data using prepared statements:
		$query = "CALL numPlatforms(?)";
		$stmt = mysqli_prepare($dbc, $query);
		mysqli_stmt_bind_param($stmt, "s", $mfr_name);
		mysqli_stmt_execute($stmt);
		$result = mysqli_stmt_get_result($stmt);
		//$result = mysqli_query($dbc, $query);
		$rows = mysqli_num_rows($result);
		if($rows==1){ //Client found
			$client = mysqli_fetch_assoc($result); //Fetches the row as an associative array with DB attributes as keys
			
		} // end if($result)
		else {
			echo "<h2>That manufacturer was not found</h2>";
			mysqli_close($dbc);
			exit;
		}
	}
	else {
		echo "You have reached this page in error";
		exit;
	}
	//Clients found, output results
?>

<!DOCTYPE HTML>
<html lang="en">
	<head >
	   <meta charset="utf-8">
	   <title>Query 9: Stored Procedure - CSC 455 Final Project</title>
	   <!-- Author: Bella Novicki -->
	</head>
	<body>
		<h2>Query 9 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>
		<h2>Stored Procedure: Find Platforms</h2>
		<h3>This query receives a manufacturer name as an input and returns the number of platforms they have manufactured.</h3>
		<h4>Number of platforms: <?php echo $client['numOfPlatforms'];?></h4>
		<h3><a href="query9_input.html">Lookup another manufacturer</a></h3>
	</body>
</html>