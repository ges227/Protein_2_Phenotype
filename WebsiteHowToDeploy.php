<!DOCTYPE html>
<!-- WebsiteHowToDeploy.php 
This is a comment. Comments are not displayed in the browser
-->
<html>
<head>
    <title>
        WebsiteHowToDeploy.php
    </title>
</head>
<body>

<h1>
    Instructions to deploy my web application
	<br>
</h1>
<hr>
<ul>
<!--
i. What are the system requirements?
ii. Does this web app need a database? How to create one? Which user has
the authority to create or restore a database?
iii. What is the user name and password that the website needs in order to
connect to the database?
iv. Where to keep your files that support your website?
v. How to test the website to ensure a successful deployment?-->
	<li> <b>System Requirements</b>
	<p>This web application can be run on a standard operating system with access to any of the following internet browsers </p>
	<ul>
	<li>Safari</li>
	<li>Google Chrome</li>
	<li>Mozilla Firefox</li>
	</ul>
	<p>The following are additionally required:</p>
	<ul>
	<li>The database backup <a href="GES43_p2p.SQL" target="_blank"><b>file</b></a></li>
	<li><a target="_blank" href="https://www.apachefriends.org/">XAMPP distribution</a></li>
	<li>Access to localhost</li>
	</ul>
		<P>
	</P>
	</li>
	
	<li> <b>Database Requirements</b>
	<p> This website needs a database to run dynamic reports, located on the <a target="_blank" href="https://www.apachefriends.org/">Report Search Index</a> Page.
	</p>
	<p> The database was created using MYSQLWorkbench. It was then imported into the Apache distribution. Any user with access to the database file is able to restore the database on an apache server and run the dynamic reports. However, only a database administrator has the authority to create the original database suitable for this website.</p> 
	<p> To restore the database for dynamic use of this website, follow the following instructions. They suitable for OS X Users	
	<ol>
	<li>Make sure you have XAMPP installed and have downloaded the database file from this page</li>
	<li>Open XAMPP and navigate to the manage servers tag. Make sure you're able to run all servers. </li>
	<li>Open the file named "php.ini" in a text editor and make the following changes, the close the file:
		<ul>
			<li>post_max_size=200M</li>
			<li>upload_max_filesize=100M</li>
			<li>Memory_limit=100M</li>
		</ul>
	</li>
	<li>On the XAMPP manager, restart all three servers</li>
	<li>Open your favorite web browser, open up http://localhost/phpmyadmin/. Alternatively, you can navigate to the "Welcome" tab on the XAMPP manager, click on "Go to Application". This will open up a page http://localhost/dashboard/. At the upper right of this page, click on phpMyAdmin</li>
	<li>Once at localhost/phpMyAdmin, click import on the tool bar at top of the page, on the right hand side</li>
	<li>Browse your computer to upload the database file.</li>
	</ol>
	</p>
	</li>
	<li> <b>Credentials to connect to the database</b>
		<ul>
		<P><b>Host:</b> localhost</P>
		<P><b>User Name:</b> root</P>
		<P><b>Password:</b>"" </P> 
		<P><b>Database name:</b> ges43_p2p</P></ul>
		<p>*note that the "" above signifies the password field should be left empty</p>
	</li>
	<li> <b>Supporting files</b>: files supporting this website should be kept at the following locations:
	<ul>
	<li><b>For OS X Users:</b> Applications/XAMPP/xamppfiles/htdocs/BCHB697/ges43</li>
	<li><b>For Windows Users:</b> c:/XAMPP/xamppfiles/htdocs/BCHB697/ges43</li></ul>
	</li>
	
	<li><b>Testing Instructions</b>
	<ol>
		<li>Make sure you have followed the deployment instructions above</li>
		<li>Make sure the PHP files have been installed in the location stated above</li>
		<li>Make sure scDbConnection.php file contains the credentials as listed asbove</li>
		<li>On your favorite webbrowser and navigate to localhost/BCHB697/ges43/scDbConnection.php</li>
		<li>In the case of a successful deployment this page should be blank</li>
		<li>For further confirmation, navigate to the report search index and chose any of report options. Run a report. If deployment was successful, data will be generated in tables.</li>
		<li>Check out other reports. Have fun!</li>
	</ol>
	
	</li>
	



</ul>
<br>
<br>
</body>
</html>
