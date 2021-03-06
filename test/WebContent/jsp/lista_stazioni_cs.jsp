<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Stazione_CS"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista delle Stazioni Car Sharing | Car+</title>
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
        <h1>Lista delle Stazioni Car Sharing</h1>
    	<table>
      		<tr>
		        <th>Nome</th>
				<th>Provincia</th>
				<th>Citt&agrave;</th>
				<th>Indirizzo</th>
				<th>Numero Posti</th>
				<th id="th_tools"></th>
      		</tr>
  			<% for(Stazione_CS A : Store.StoreStazione_CS.getStazione_CS()){ %>
	      		<tr>
					<td><%= A.getNome() %></td>
					<td><%= A.getProvincia() %></td>
					<td><%= A.getCitta() %></td>
					<td><%= A.getIndirizzo() %></td>
					<td><%= A.getNum_posti() %></td>
					<td>
						<ul id="tools">
							<li><a href="update_cs_station.jsp?nome=<%= A.getNome() %>&provincia=<%= A.getProvincia() %>&citta=<%= A.getCitta() %>"><img src="../img/ic_edit.png"></a></li>
							<li><a href="../CancellaStazioneCS?nome=<%= A.getNome() %>&provincia=<%= A.getProvincia() %>&citta=<%= A.getCitta() %>"><img src="../img/ic_cancel.png"></a></li>
						</ul>
					</td>
	      		</tr>
		    <% } %>
    	</table>
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