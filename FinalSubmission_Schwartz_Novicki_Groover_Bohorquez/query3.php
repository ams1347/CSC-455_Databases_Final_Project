<?php
	require_once('../mysqli_config.php'); //Connect to the database
	$query = 'SELECT a.publisherName AS p, b.publisherName AS parent
				FROM Publisher a, Publisher b 
				WHERE a.parentPublisher = b.publisherName';
	
	$result = mysqli_query($dbc, $query);
	$rows = array();
	$num_rows = mysqli_num_rows($result);
	if($num_rows > 0){ //Client found
	//Fetch all rows of result as an associative array
		$client = mysqli_fetch_all($result, MYSQLI_ASSOC); //get the result as an associative, 2-dimensional array
	}
	else { 
		echo "<h2>No rows found.</h2>"; 
		echo "<h3>Please try again later.</h3>";
		exit;
	} 
	mysqli_close($dbc);
?>

<!DOCTYPE HTML>
<html lang="en">
	<head >
	   <meta charset="utf-8">
	   <title>Query 3: Self-Join - CSC 455 Final Project</title>
	   <!-- Author: Bella Novicki -->
	</head>
	<body>
		<h2>Query 3 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>
		<h2>Self-Join</h2>
		<h3>This query displays any publishers that have another listed as their parent publisher using a self-join.</h3>
		<table>
			<tr>
			<th> Publisher </th>
			<th> Parent </th>
			</tr>
			<?php foreach ($result as $client) { ?>
			<tr>
			<td> <?php echo $client['p'];?> </td>
			<td> <?php echo $client['parent'];?> </td>
			</tr>
			<?php }
			?>
		</table>
	</body>
</html>