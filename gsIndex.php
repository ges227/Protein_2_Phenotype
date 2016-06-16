<!DOCTYPE html>
<!-- gsIndex.php 
This is a comment. Comments are not displayed in the browser
-->

<html lang='en'>
<head>
	<meta charset="UTF-8" /> 
    <title>
        gsIndex.php
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<h1>
    Use GES43_P2P Database
	<br>
	<a href="ProjectPresentation.php#gsindex" class="btn btn-info" role="button">Go Back to Home Page</a>
	<!--button Type="button"  onclick="window.location.href='ProjectPresentation.php#gsindex'"></button--> 
</h1>
<hr>
<p> On this page, you may find reports answering specific bioinformatics questions.
</p>
<ul>
<!--li>
<p>Test Multiquery <a href="Multiquery.php"><b>here</b></a>.</p-->
<li><p>To get overview information on a specific protein in this database, please go <a href="gsProt_Overview.php"><b>here</b></a>.</P>
</li>

<li><p>To find entries of proteins that are encoded by genes on a specific chromosome, please go <a href="gsChrom_num.php"><b>here</b></a>.</P>
</li>
<li><p>To find protein entries that link to DO diseases of specific kind, please go <a href="gsDis_type.php"><b>here</b></a>.</p>
</li>
<li><p>To find entries of proteins that are have a mass within a specific range, please go <a href="gsPep_mass.php"><b>here</b></a>.</P>
</li>
<li><p>To find answers to prebuilt questions that are potentially asked frequently, please go <a href="gsMulti_facts.php"><b>here</b></a>.</P>
</li>
</ul>

<br>

<script>
var url = document.location.toString();
if (url.match('#')) {
    $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
} 

// Change hash for page-reload
$('.nav-tabs a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash;
})
</script>

</body>
</html>