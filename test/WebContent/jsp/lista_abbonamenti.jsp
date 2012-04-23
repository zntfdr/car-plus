<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Abbonamento"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista degli Abbonamenti | Car+</title>
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
        <h1>Lista degli abbonamenti</h1>
    	<table id="trip_list">
			<tr>
				<td><b>nome</b></td> 
				<td><b>descrizione</b></td> 
				<td><b>tariffa > 100km</b></td> 
				<td><b>tariffa < 100km</b></td> 
				<td><b>tariffa notturna</b></td> 
				<td><b>tariffa diurna</b></td> 
				<td><b>costo mensile</b></td> 
				<td><b># max tessere</b></td> 
				<td><b># min tessere</b></td>
				<td><b>Modifica</b></td>
		        <td><b>Cancella</b></td>
			</tr><% 
			for(Abbonamento A : StoreAbbonamento.getAbbonamenti()) { %>
			<tr>
				<td><%= A.getNome() %></td> 
				<td><%= A.getDescrizione() %></td> 
				<td><%= A.getTariffa_magg_100km() %> &euro;</td> 
				<td><%= A.getTariffa_min_100km() %> &euro;</td> 
				<td><%= A.getTariffa_notturna() %> &euro;</td> 
				<td><%= A.getTariffa_diurna() %> &euro;</td> 
				<td><%= A.getCosto_mensile() %> &euro;</td> 
				<td><%= A.getNum_max_tessere() %></td> 
				<td><%= A.getNum_min_tessere() %></td>
				<td> <a href="update_subscription.jsp?nome=<%= A.getNome() %>"><img src="../img/ic_edit.png"></a></td>
        		<td> <a href="../CancellaAbbonamento?nome=<%= A.getNome() %>"><img src="../img/ic_cancel.png"></a></td>
      		</tr><% } %>
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