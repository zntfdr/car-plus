<%@page import="Utils.TimeString"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Cliente"%>
<%@ page import="Entita.Contratto"%>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Associa Tessera Step 2 | Car+</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione"); } %>
        <h1>Lista contratti cliente</h1>
        <form method="POST" action="associaTesseraStep3.jsp" id="step2">
        <select name="contratto">
  			<% String cliente = request.getParameter("cliente"); 
  			for(Contratto C : Interrogazione.listaContrattiUtente(cliente)){ %>
      		<option value="<%=C.getId() %>">Contr. <%=C.getId() %> | Abb. <%=C.getNome_abbonamento() %> | Scad. <%=TimeString.dataCalendarToString(C.getData_scadenza()) %></option>
		    <% } %>
		</select>
		<button name="submit" type="submit" id="submit">Scegli Contratto/Abbonamento</button>
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