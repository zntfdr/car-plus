<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Modello_Macchina" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuova macchina car sharing avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="header">
        <ul>
            <li><img src="../img/logo.png" alt="Logo"/></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
           <li> <a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
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