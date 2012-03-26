<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Macchina_CS" %>
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
        <td> <%= A.getScad_bollo() %></td>
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