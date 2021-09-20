<?php
	require_once('../mysqli_config.php'); //Connect to the database
	$query1 = 'SELECT * FROM Platform';
	$query2 = 'INSERT INTO Platform (platformName, releaseDate, manufacturer) 
				VALUES ("PlayStation 5", "2022-11-12", "Sony");';
	$query3 = 'SELECT * FROM Platform';
	$query4 = 'DELETE FROM Platform WHERE platformName = "PlayStation 5"';
	
	$result1 = mysqli_query($dbc, $query1);
	$result2 = mysqli_query($dbc, $query2);
	$result3 = mysqli_query($dbc, $query3);
	$rows = array();
	$num_rows1 = mysqli_num_rows($result1);
	$num_rows2 = mysqli_num_rows($result3);
	if($num_rows2 > 11){ 
	//Fetch all rows of result as an associative array
		$client1 = mysqli_fetch_all($result1, MYSQLI_ASSOC); //get the result as an associative, 2-dimensional array
		$client2 = mysqli_fetch_all($result3, MYSQLI_ASSOC); //get the result as an associative, 2-dimensional array
		$result4 = mysqli_query($dbc, $query4); //delete the row from database

	}
	else { 
		echo "<h2>Error.</h2>"; 
		echo "<h3>Please try again later.</h3>";
		exit;
	} 
	mysqli_close($dbc);
?>

<!DOCTYPE HTML>
<html lang="en">
	<head >
	   <meta charset="utf-8">
	   <title>Query 10: Stored Trigger Example - CSC 455 Final Project</title>
	   <!-- Author: Bella Novicki -->
	</head>
	<body>
		<h2>Query 10 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>
		
		<h2>Trigger</h2>
		<h3>The trigger being demonstrated does not allow the user to add a platform that is being released
			after 2021. The example query attempts to add the PlayStation 5 to the platforms table, but the user
			has accidentally tried to insert the release date as 2022-11-12 instead of 2021-11-12. The trigger
			automatically sets the release date to 2021 instead.</h3>
		<h2>Before Insert</h2>
		<table>
			<tr>
			<th> Platform </th>
			<th> Release </th>
			<th> Manufacturer </th>
			</tr>
			<?php foreach ($result1 as $client1) { ?>
			<tr>
			<td> <?php echo $client1['platformName'];?> </td>
			<td> <?php echo $client1['releaseDate'];?> </td>
			<td> <?php echo $client1['manufacturer'];?> </td>
			</tr>
			<?php }
			?>
		</table>
		<h2>After Insert</h2>
		<table>
			<tr>
			<th> Platform </th>
			<th> Release </th>
			<th> Manufacturer </th>
			</tr>
			<?php foreach ($result3 as $client2) { ?>
			<tr>
			<td> <?php echo $client2['platformName'];?> </td>
			<td> <?php echo $client2['releaseDate'];?> </td>
			<td> <?php echo $client2['manufacturer'];?> </td>
			</tr>
			<?php }
			?>
		</table>
	</body>
</html>