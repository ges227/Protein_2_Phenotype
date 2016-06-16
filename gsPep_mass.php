<?php
/* gsPep_mass.php 
This is a comment. Comments are not displayed in the browser.
To run it as a php file:
http://localhost/ges43/gsPep_mass.php
*/
?>
<?php

if (isset($_POST["submit1"]) && !empty($_POST["minmass"]) && !empty($_POST["maxmass"])) 
{
	require_once "scDbConnection.php";
	$minmass = $_POST["minmass"];
	$maxmass = $_POST["maxmass"];
}
?>
<?php
if(!empty($connection))
{
		$query = "call prot_mass(" . '"' . $minmass . '", ' . $maxmass . ')';
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
        gsPep_mass.php
    </title>
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
	<hr>

<div class="container">	
<form role="form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" >
<a href="ProjectPresentation.php#gsindex" class="btn btn-info" role="button">Back to Home</a> 	
	<p> Get a list of of proteins by entering a minimum and a maximum protein mass:
	<input type="text" placeholder="Min mass" name="minmass" size=10
	<?php
		if(!empty($connection))
		{
			echo 'value="' . $minmass .'"'; 
		} 
		?>
		/>
		<span class="extext">e.g. 30000</span>
	<input type="text" placeholder="Max mass" name="maxmass" size=10
	<?php
		if(!empty($connection))
		{
			echo 'value="' . $maxmass .'"'; 
		} 
		?>
	/>
		<span class="extext">e.g. 45000</span>
	</p>
	
	<br>
	<input type="submit" name="submit1" class="submit" value="Go" />
	</form>
</div>
	<hr>
<div class="container">	
	<?php
	if (!empty($connection))
	{	
			$NumOfRows = mysqli_num_rows($result);
			$Index = 0;
			//echo "Number of rows = $NumOfRows"."<br/>";
			//echo "check row count <br/>";
			//echo (false);
			//echo ($NumOfRows);

			if ($NumOfRows == 0)
			{
				echo "No protein in this database has a mass within the range <u>$minmass</u> and <u>$maxmass</u>.";
			} else
			{
				echo '<table class="table-striped">';
				echo '<caption>
					Protein with a mass within the range of ';
				echo '"' . $minmass . '"'; 
				echo 'Da and ';
				echo '"' . $maxmass . '"';
				echo 'Da'; 
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
<br><br>
</body>