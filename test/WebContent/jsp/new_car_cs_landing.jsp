<%@page import="Utils.TimeString"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Macchina_CS" %>
<%@ page import="Utils.TimeString" %>
<%@ page import = "Utils.HTMLManager" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuova macchina car sharing avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">

    <table id="trip_list">
      <tr>
        <td><b>Targa</b></td>
        <td><b>Nome stazione CS</b></td>
        <td><b>Id modello</b></td>
        <td><b>Scadenza bollo</b></td>
      </tr><% ArrayList<Macchina_CS> listamCS = new ArrayList<Macchina_CS>();
     listamCS = (ArrayList<Macchina_CS>) session.getAttribute("lista_macchine");
     for(Macchina_CS A : listamCS){%>
      <tr>
        <td> <%= A.getTarga() %></td>
        <td> <%= A.getNome_stazione_CS() %></td>
        <td> <%= A.getId_modello() %></td>
        <td> <%= Utils.TimeString.dataCalendarToString(A.getScad_bollo()) %></td>
      </tr>
    <% } %>
    </table>
       <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>
</html>