<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuovo Modello Macchina | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
        $("#cilindrata, #emissioni_co2, #num_posti").click(function(e){
        	if(e.which < 48 || e.which > 57) return false;
            return true;
        });
    });
</script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="POST" action="../Inserimento_modello_macchina" id="new_car_model">
            <ul>
                <li><h1>Nuovo Modello Macchina</h1></li>
                <li><label for="marca">Marca:</label><input name="marca" type="text" id="marca" placeholder="Marca" maxlenght="30"/></li>
                <li><label for="modello">Modello:</label><input name="modello" type="text" id="modello" placeholder="Modello" maxlength="50"/></li>
                <li><label for="cilindrata">Cilindrata:</label><input name="cilindrata" type="text" id="cilindrata" placeholder="Cilindrata o Kw"/></li>
                <li><label for="anno">Anno:</label><input name="anno" type="text" id="anno" placeholder="Anno" maxlenght="4"/></li>
                <li><label for="alimentazione">Alimentazione:</label><select name="alimentazione">
                	<option value="Benzina">Benzina</option>
                	<option value="Diesel">Diesel</option>
                	<option value="GPL">GPL</option>
                	<option value="Metano">Metano</option>
                	<option value="Elettrica">Elettrica</option>
                </select></li>
                <li><label for="emissioni_co2">Emissioni CO<small><sup>2</sup></small></label><input name="emissioni_co2" type="text" id="emissioni_co2" placeholder="Emissioni Co2 [g/km]"/></li>
                <li><label for="num_posti">Numero Posti:</label><input name="num_posti" type="text" id="num_posti" placeholder="Numero Posti"/></li>

                <li><button name="submit" type="submit" id="submit">Registra</button></li>
            </ul>
        </form>
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
<% } %>