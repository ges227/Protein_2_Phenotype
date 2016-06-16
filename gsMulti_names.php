<!DOCTYPE html>
<!-- gsMulti_names.php 
This is a comment. Comments are not displayed in the browser
-->

<html lang='en'>
<head>
    <meta charset="UTF-8" /> 
    <title>
        gsMulti_names.php
    </title>
    <link rel="stylesheet" type="text/css" HREF="StyleSheets.css">
</head>
<body>
	<h1>
		Use GES43_P2P Database
					<br>
	<button Type="button"  onclick="window.location.href='gsIndex.php'">Go Back to Report Search Index</button>
	</h1>
	<br>
	<hr>

	<form id="form2" action="" method="post">
	<p style="text-align:center"> Get a list of protein entries with multiple protein names: </p>
	<br>
	<center><input type="submit" name="submit2" class="submit" value="Go" /></center>
	</form>
	<hr>
	<br>
	<!--/* the class name is case sensitive.*/ -->
	<!--div style="width:800px; margin:0 auto;" -->
	<table class="table1" >
	<!--table-->
		<caption>
			These entries have multiple protein synonyms, separated by a comma
		</caption>
		<!-- make the first row a column header row-->
		<tr>
			<th> Targeted Disease Name</th>
			<th> UniprotKB ID </th>
			<th> Protein Name </th>
			<th> Protein Alternative names </th>
		</tr>
		<tr>
			<td> Schizophrenia </td>
			<td> O43272 </td>
			<td> Protein Dehydrogenase 1;mitochondrial </td>
			<td> p53-induced gene 6 protein, Proline oxidase, Proline oxidase 2</td>
		</tr>
		<tr>
			<td> Malaria </td>
			<td> P01375 </td>
			<td> Tumor necrosis factor</td>
			<td> Cachectin, TNF-alpha, Tumor necrosis factor ligand superfamily member 2</td>
		</tr>
	</table> <!--/div-->

</body>