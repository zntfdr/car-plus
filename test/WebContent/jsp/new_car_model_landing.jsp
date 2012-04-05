<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Modello_Macchina" %>
<%@ page import = "Utils.HTMLManager" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuova macchina car sharing avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">
    <table id="trip_list">
      <tr>
        <td><b>Id</b></td>
        <td><b>Marca</b></td>
        <td><b>Modello</b></td>
        <td><b>Cilindrata</b></td>
      </tr><% ArrayList<Modello_Macchina> listamm = new ArrayList<Modello_Macchina>();
     listamm = (ArrayList<Modello_Macchina>) session.getAttribute("lista_modelli");
     for(Modello_Macchina A : listamm){%>
      <tr>
        <td> <%= A.getId() %></td>
        <td> <%= A.getMarca() %></td>
        <td> <%= A.getModello() %></td>
        <td> <%= A.getCilindrata() %></td>
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