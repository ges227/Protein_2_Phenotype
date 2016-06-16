<?php
/* gsChrom_num.html 
This is a comment. Comments are not displayed in the browser.
To run it as a php file:
http://localhost/BCHB697/ges43/gsChrom_num.php
*/
?>
<?php

if (isset($_POST['submit1']) && !empty($_POST['chromnum'])) 
{
	require_once "scDbConnection.php";
	$chromnum = mysqli_real_escape_string($connection, htmlentities($_POST["chromnum"]));
}
?>

<?php
	
?>

<?php

if(!empty($connection))
{
		$query = "call protein_chromosome_location(" . '"' . $chromnum . '")';
		$result = mysqli_query($connection, $query);
		if (!$result)
		{
			die("Database query failed.");
		}
}		
?>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset="UTF-8" /> 
    <title>
        gsChrom_num.php
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body class="container" style="background: url('images/ground.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;">
<h1>
	Use GES43_P2P Database 
</h1>
<br>
<br>
	<br>
	<hr>
<div class= "container">
<form role="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
<a href="ProjectPresentation.php#gsindex" class="btn btn-info" role="button">Back to Home</a> 
<p> Get a list of of proteins encoded by genes on the entered chromosome number:
	<input type="text" placeholder="Enter chromosome number" name="chromnum" size=25
	 <?php
		if(!empty($connection))
		{
			echo 'value="' . $chromnum .'"'; 
		} 
		?>
	 />
	 <span class="extext">e.g. 9</span>

	</p>
	
	<br>
	<input type="submit" name="submit1" class="submit" value="Submit" />
	</form>
</div>
	<hr>
	<div class="container">
	<?php
	if (!empty($connection))
	{	
			$NumOfRows = mysqli_num_rows($result);
			$Index = 0;
			

			if ($NumOfRows == 0)
			{
				echo "No protein in this database is encoded by a gene on this chromosome <u>$chromnum</u>.";
			} else
			{
				echo '<table class="table-hover">';
				echo '<caption>
					Protein encoded on this chromosome';
				echo '"' . $chromnum . '"'; 
				echo "</caption>";
				echo "<thead>
						<tr>";
				$row = mysqli_fetch_assoc($result);
				//print_r ($row);
				
				foreach($row as $k => $v ) 
				{       
					if (strpos($k, '_') !== false){
					//echo "true";
					$k= str_replace("_", " ", $k);
					}
					echo "<th>".$k."</th>";
				}
			
				echo "	</tr>
					</thead>
					<tbody>";

				$check = mysqli_data_seek($result, 0);
				
				 while ($rownew = mysqli_fetch_assoc($result))
				 {
					echo "<tr>";
					foreach($rownew as $k => $v)
					{
					echo "<td>".$v."</td>";
					}
					echo "</tr>";	
				 }
				 
				echo "	</tbody>
					</table>";
			}
	}
	?>
	</div>
	<?php
		if(!empty($connection))
		{
			mysqli_free_result($result);
		}
	?>

</body>
</html>



	
<?php
	if(!empty($connection))
	{
		mysqli_close($connection);
	}
?>
	