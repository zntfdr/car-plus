<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
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
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
        $("#cilindrata, #emissioni_co2, #num_posti").click(function(e){
        	if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });
    });
</script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="get" action="../Inserimento_modello_macchina" id="new_car_model">
            <ul>
                <li><h1>Nuovo Modello Macchina</h1></li>
                <li><input name="marca" type="text" id="marca" placeholder="Marca" maxlenght="30"/></li>
                <li><input name="modello" type="text" id="modello" placeholder="Modello" maxlength="50"/></li>
                <li><input name="cilindrata" type="text" id="cilindrata" placeholder="Cilindrata"/></li>
                <li><input name="anno" type="text" id="anno" placeholder="Anno" maxlenght="4"/></li>
                <li><select name="alimentazione">
                	<option value="Benzina">Benzina</option>
                	<option value="Diesel">Diesel</option>
                	<option value="GPL">GPL</option>
                	<option value="Metano">Metano</option>
                	<option value="Elettrica">Elettrica</option>
                </select></li>
                <li><input name="emissioni_co2" type="text" id="emissioni_co2" placeholder="Emissioni CO2 [g/km]"/></li>
                <li><input name="num_posti" type="text" id="num_posti" placeholder="Numero Posti"/></li>

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