<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="Entita.Stazione_CS" %>
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
             <% Stazione_CS sCS = null;
            sCS = (Stazione_CS) session.getAttribute("stazione_nuova"); %>
            <li>Ciao <%= sCS.getNome() %></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        <div id="announce"></div>
        <div id="actions">
            <a href="search.html"><div id="search"></div></a>
            <a href="#"><div id="insert"></div></a>
        </div>
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>
</html>