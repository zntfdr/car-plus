<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Stazione_CS" %>
<%@ page import = "Utils.HTMLManager" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuova Stazione avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
<div class="wrapper">
    <table id="trip_list">
      <tr>
        <td><b>Nome</b></td>
        <td><b>Citta</b></td>
        <td><b>Provincia</b></td>
        <td><b>Indirizzo</b></td>
        <td><b>Numero Posti</b></td>
      </tr><% ArrayList<Stazione_CS> listasCS = new ArrayList<Stazione_CS>();
     listasCS = (ArrayList<Stazione_CS>) session.getAttribute("lista_stazioni");
     for(Stazione_CS A : listasCS){%>
      <tr>
        <td> <%= A.getNome() %></td>
        <td> <%= A.getCitta() %></td>
        <td> <%= A.getProvincia() %></td>
        <td> <%= A.getIndirizzo() %></td>
        <td> <%= A.getNum_posti() %></td>
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