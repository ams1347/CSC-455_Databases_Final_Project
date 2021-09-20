<?php
	require_once('../mysqli_config.php'); //Connect to the database
	$query = 'SELECT gameTitle, genre FROM Genre
WHERE gameTitle in (SELECT gameTitle FROM Genre GROUP BY gameTitle HAVING COUNT(genre) > 2);';
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
    <title>Query 7 - CSC 455 Final Project</title>
	<meta charset ="utf-8">
	<!--This Query displays the game title and genres for all games with 3 or more genres-->
</head>
<body>
	<h2>Query 7 - CSC 455 Final Project, Aaron Schwartz, Max Groover, Bella Novicki, George Bohorquez</h2>
	<table>
		<tr>
			<th>Game</th>
			<th>Genre</th>
		</tr>	
		<?php foreach ($result as $inspection) {
			echo "<tr>";
			echo "<td>".$inspection['gameTitle']."</td>";
			echo "<td>".$inspection['genre']."</td>";
			echo "</tr>";
		}
		?>
	</table>
</body>
</html>