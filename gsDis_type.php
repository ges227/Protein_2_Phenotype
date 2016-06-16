<?php
/* gsChrom_num.html 
This is a comment. Comments are not displayed in the browser.
To run it as a php file:
http://localhost/BCHB697/ges43/gsDis_type.php
*/
?>
<?php
/*
	$dbhost ="localhost:3306";
	$dbuser = "root";
	$dbpass = "root697";
	$dbname = "mydb";
	$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
	// Test if connection occurred.
	if (mysqli_connect_errno()){
		die("Database connection failed: " .
		mysqli_connect_error() .
		" (" . mysqli_connect_errno() . ")"
		);
	}
*/
//echo "$distype".'<br/>';
if (isset($_POST['submit1']) && !empty($_POST['distype'])) 
{
	require_once "scDbConnection.php";
	//$distype = $_POST["distype"];
	$distype = mysqli_real_escape_string($connection, htmlentities($_POST["distype"]));
}
//echo "$distype".'<br/>';
?>
<?php
// use a stored procedure to get the data from db
if(!empty($connection))
{
		$query = "call protein_disease_relationship(" . '"' . $distype . '")';
		//echo $query."<br/>";
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

<p> Get a list of UniprotKB entries that link to Disease Ontology entries by entering a disease type:
<select  name="distype">
  <!--option value="" selected disabled>Select a rating</option--> 
  <option 
  	<?php
		if(!empty($connection))
		{
			echo 'value="' . $distype .'"'; 
		} else
		{
			echo 'value="" selected disabled';
		}
	?>
  >
  	<?php
		if(!empty($connection))
		{
			echo ($distype); 
		} else
		{
			echo 'Select a disease type';
		}
	 ?> 
  </option>
  
  <option value="Autosomal">Autosomal</option>
  <option value="Anemia">Anemia</option>
  <option value="Cancer">Cancer</option>
  <option value="Keratosis">Keratosis</option>
  <option value="Psychotic">Psychotic</option>
  <option value="Thalassemia">Thalassemia</option>
  
</select>
</p>
<input type="submit" name="submit1" value="Go" />
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
				echo "No protein entries in this database is affiliated with a disease of this type <u>$distype</u>.";
			} else
			{
				echo '<table class="table-striped">';
				echo '<caption>
					Protein entries affiliated with a disease of this type';
				echo '"' . $distype . '"'; 
				echo "</caption>";
				echo "<thead>
						<tr>";
				$row = mysqli_fetch_assoc($result);
				
				foreach($row as $k => $v ) 
				{       
					if (strpos($k, '_') !== false){
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
	// close database connection
	if(!empty($connection))
	{
		mysqli_close($connection);
	}
?>