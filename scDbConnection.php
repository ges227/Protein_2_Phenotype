<?php
/* scDbConnection.php
This is a comment. Comments are not displayed in the browser.
To run it as a php file:
http://localhost/BCHB697/ges43/scDbConnection.php*/

	$dbhost ="localhost";
	$dbuser = "root";
	$dbpass = "";
	$dbname = "ges43_p2p";
	/*
	$dbhost ="localhost:33060";
	$dbuser = "root";
	$dbpass = "";
	$dbname = "sakila";*/

	$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
	// Test if connection occurred.
	if (mysqli_connect_errno()){
		die("Database connection failed: " .
		mysqli_connect_error() .
		" (" . mysqli_connect_errno() . ")"
		);
	}
?>
