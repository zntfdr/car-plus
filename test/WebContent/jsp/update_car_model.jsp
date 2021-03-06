<%@ page import="Store.StoreModello_Macchina"%>
<%@ page import="Entita.Modello_Macchina"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Modello_Macchina modello = Store.StoreModello_Macchina.readModello_Macchina(Integer.parseInt((String) request.getParameter("id")));
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna il modello macchina #<%= modello.getId() %> | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script>
    $(document).ready(function(){
        $("#cilindrata, #emissioni_co2, #num_posti").click(function(e){
        	if(e.which < 48 || e.which > 57) return false;
            return true;
        });
    });    </script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
       
        <form method="POST" action="../UpdateModelloMacchina" id="register">
            <ul>
                <li><h1>Aggiorna il Modello Macchina  #<%= modello.getId() %></h1></li>
                <li class="hide"><input name="id" type="hidden" id="id" value="<%= modello.getId() %>"/></li>
                <li><label for="marca">Marca:</label><input name="marca" type="text" id="marca" value="<%= modello.getMarca() %>" placeholder="Marca" maxlenght="30"/></li>
                <li><label for="modello">Modello:</label><input name="modello" type="text" id="modello" value="<%= modello.getModello() %>" placeholder="Modello" maxlength="50"/></li>
                <li><label for="cilindrata">Cilindrata:</label><input name="cilindrata" type="text" id="cilindrata" value="<%= modello.getCilindrata() %>" placeholder="Cilindrata"/></li>
                <li><label for="anno">Anno:</label><input name="anno" type="text" id="anno" value="<%= modello.getAnno() %>" placeholder="Anno" maxlenght="4"/></li>
                <li>
                	<label for="alimentazione">Alimentazione:</label>
	                <select name="alimentazione">
	                	<option value="Benzina" <% if(modello.getAlimentazione().compareTo("Benzina") == 0) { %> selected="selected" <% } %>>Benzina</option>
	                	<option value="Diesel" <% if(modello.getAlimentazione().compareTo("Diesel") == 0) { %> selected="selected" <% } %>>Diesel</option>
	                	<option value="GPL" <% if(modello.getAlimentazione().compareTo("GPL") == 0) { %> selected="selected" <% } %>>GPL</option>
	                	<option value="Metano" <% if(modello.getAlimentazione().compareTo("Metano") == 0) { %> selected="selected" <% } %>>Metano</option>
	                	<option value="Elettrica" <% if(modello.getAlimentazione().compareTo("Elettrica") == 0) { %> selected="selected" <% } %>>Elettrica</option>
	                </select>
                </li>
                <li><label for="emissioni_co2">Emissioni CO<small><sup>2</sup></small>:</label><input name="emissioni_co2" type="text" id="emissioni_co2" value="<%= modello.getEmissioni_co2() %>" placeholder="Emissioni CO2 [g/km]"/></li>
                <li><label for="num_posti"># Posti:</label><input name="num_posti" type="text" id="num_posti" value="<%= modello.getNum_posti() %>" placeholder="Numero Posti"/></li>

                <li><button name="submit" type="submit" id="submit">Aggiorna</button></li>
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