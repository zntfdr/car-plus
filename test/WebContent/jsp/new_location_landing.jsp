<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="Entita.Localita" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Car+ | Il nuovo servizio di Car Pooling</title>
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
            <% Localita loc = null;
            loc = (Localita) session.getAttribute("localita_nuova"); %>
            <li> Localita' inserita : <%= loc.getCitta() %></li>
            <li> Provincia : <%= loc.getProvincia() %></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
           <table id="trip_list">
      <tr>
        <td><b>Citta</b></td>
        <td><b>Provincia</b></td></tr>
        <tr> <% loc = session.getAttribute("localita_nuova"); %>
        <td> <%= A.getCitta() %></td>
        <td> <%= A.getProvincia() %></td>

      </tr>
    </table>
       <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>
</html>