<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Search</title>
</head>
<body>
<script type="text/javascript">
	function Radius()
	{
			document.getElementById('id1').style.display = "block";
			document.getElementById('id2').style.display = "none";
	}
	function Nearest()
	{
			document.getElementById('id1').style.display = "none";
			document.getElementById('id2').style.display = "block";
	}
</script>
<form method="post" action="GServlet">
<table border=0>
	<tr>
		<td>Postal Code: </td>
		<td><input type="text" name="PostalCode"/></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input type="text" name="City"/><br></td>
	</tr>
	<tr>
		<td>Street:</td>
		<td><input type="text" name="Street"/></td>
	</tr>
	<tr>
		<td>Schulart:</td>
		<td>
			<SELECT name="Schulart">
			<option></option>
			<option value="3">BBS(berufsbildende Schule)</option>
			<option value="4">FÖS(Förderschule)</option>
			<option value="5">GS(Grundschule)</option>
			<option value="6">GY(Gymnasium)</option>
			<option value="9">IGS(Integrierte Gesamtschule)</option>
			<option value="11">KGS(Kooperative Gesamtschule)</option>
			<option value="12">KO(Kolleg)</option>
			<option value="13">RS(Regelschule)</option>
			<option value="14">SFTBBS(Berufsbildende Schule in freier Trägerschaft)</option>
			<option value="15">SFTFÖS(Förderschule in freier Trägerschaft)</option>
			<option value="16">SFTGS(Grundschule in freier Trägerschaft)</option>
			<option value="17">SFTGY(Gymnasium in freier Trägerschaft)</option>
			<option value="18">SFTRS(Regelschule in freier Trägerschaft)</option>
			</SELECT>
		</td>
	</tr>
	<tr>
		<td>Search Type: </td>
		<td>
			Radius Search <input type=radio name="search" value="RS" onclick="Radius()" checked>
		<br>Nearest Schools Search <input type=radio name="search" value="NS" onclick="Nearest()">
	</tr>
	<tr>
		<td><div id=id1 style="display:none">Radius  <input  type=text name=radius size=5 maxlength=4> KM123</div></td>
	</tr>
	<tr>
		<td><div id=id2 style="display:none">Find Nearest <input type=text name=number_nearest size=5 maxlength=4> Schools</div></td>
	</tr>
	<tr>
		<td><input type="Submit" value="Search"/></td>
	</tr>
</table>

</form>
</body>
</html>