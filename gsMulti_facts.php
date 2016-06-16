<?php

?>
<?php

if (isset($_POST["submit1"]) && !empty($_POST["question"])) 
{
	require_once "scDbConnection.php";
	$question = $_POST["question"];
}
?>
<?php
if(!empty($connection))
{
	$query = 'call multi_facts(' . '"' . $question . '")';
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
        gsMulti_facts.php
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
<hr>
<div class="container">
<form role="form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" >
<p> Select one of the questions below and press go: </p>
<p> 	
	<input type="radio" name="question" value="1" style ="margin-left:20px"
	<?php	
		if(!empty($connection) && $question == "1")
		{
			echo " checked";
		}
	 ?>	  
	 /> What is the total number of protein records and MIM records for each targeted disease? <br>
	<input type="radio" name="question" value="2" style ="margin-left:20px"
	<?php	
		if(!empty($connection) && $question == "2")
		{
			echo " checked";
		}
	 ?>	  
	/> What protein entries have multiple alternative protein names? &nbsp;<br> 
	<input type="radio" name="question" value="3" style ="margin-left:20px" 
	<?php	
		if(!empty($connection) && $question == "3")
		{
			echo " checked";
		}
	 ?>
	 /> What proteins in this database have no MIM Disease entries annotated to their Uniprot KB entry? 
</p>

<input type="submit" name="submit1" class="submit" value="Get Answer" />
<a href="ProjectPresentation.php#gsindex" class="btn btn-info" role="button">Back to Home</a> 
</form>
</div>
<hr>
<br>
<div class="container">
	<?php
	if (!empty($connection))
	{	
			$NumOfRows = mysqli_num_rows($result);
			$Index = 0;

			if ($NumOfRows == 0)
			{
				echo "No data was found for the selected question.";
			} else
			{
				echo '<table class="table-striped">';
				echo '<caption>
					This is the answer for the selected question. ';
		
				echo "</caption>";
				echo "<thead>
						<tr>";
				$row = mysqli_fetch_assoc($result);
				
				foreach($row as $k => $v ) 
				{       
					if (strpos($k, '_') !== false){
					$k= str_replace("_", " ", $k);
					}
					if (strpos($k, 'Mass') !== false){
					$k= str_replace("Mass", "Mass (Da)", $k);
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