<?php

?>
<?php

if (isset($_POST['submit1']) && !empty($_POST['uniprotkb'])) 
{
	require_once "scDbConnection.php";
	$uniprotkb = mysqli_real_escape_string($connection, htmlentities($_POST["uniprotkb"]));
}
?>

<?php

		
?>

<?php
if(!empty($connection))
{
		$query = "call protein_overview(" . '"' . $uniprotkb . '")';
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
        gsProt_Overview.php
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
	<hr>
<div class="container">
<form role="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
	<a href="ProjectPresentation.php#gsindex" class="btn btn-info" role="button">Back to Home</a>

<p> Get overview information on a protein entry by entering its UniprotKB ID:
	<input type="text" placeholder="Enter UniprotKB ID" name="uniprotkb" size=17
	 <?php
		if(!empty($connection))
		{
			echo 'value="' . $uniprotkb .'"'; 
		} 
		?>
	 />
	 <span class="extext">e.g. P02730</span>

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
				echo "There are no protein in this database with a uniprotKB IFDof <u>$uniprotkb</u>.";
			} else
			{
				echo '<table class="table-hover">';
				echo '<caption>
					Overview of protein with UniprotKB ID';
				echo '"' . $uniprotkb . '"'; 
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

<script>
$(".outside-link").click(function() {
    $(".nav li").removeClass("active");
    $($(this).attr("data-toggle-tab")).parent("li").addClass("active");
});
</script>


	
<?php
	if(!empty($connection))
	{
		mysqli_close($connection);
	}
?>
	