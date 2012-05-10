<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<html>
		<head>
		    <meta charset="UTF-8">
		    <link href="../css/base.css" type="text/css" rel="stylesheet" />
		    <title>Car+ | Drop down list</title>
<script type="text/javascript">

</script>
</head>
<body>
<%= HTMLManager.getHeader(session) %>
<form action=""> 
<select name="provincia" onchange="showCity1(this.value)">
<option value="">Seleziona una provincia:</option>
<option value="haikou">haikou</option>
<option value="manciuria ">manciuria</option>
<option value="Treviso">Treviso</option>
</select>
</form>
<br />
<div id="citta1">Qui verra mostrata la lista delle citta1...</div>

<form action=""> 
<select name="provincia" onchange="showCity2(this.value)">
<option value="">Seleziona una provincia:</option>
<option value="haikou">haikou</option>
<option value="manciuria ">manciuria</option>
<option value="Treviso">Treviso</option>
</select>
</form>
<br />
<div id="citta2">Qui verra mostrata la lista delle citta2...</div>

</body>
</html>