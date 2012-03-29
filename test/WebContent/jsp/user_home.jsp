<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Entita.Utente" %>    
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <title>Car+ | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    <div id="header">
        <ul>
            <li><a href="../html/index.html"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="../html/index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
           <li> <a href="#">Contattaci</a></li>
            <li><a href="../html/login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        Benvenuto <b><%= user.getNome() %></b>,<br/>
        scegli l'azione desiderata:
        <div id="actions">
            <a href="../jsp/search.jsp"><div id="search"></div></a>
            <a href="../jsp/insert.jsp?who=<%= user.getEmail() %>"><div id="insert"></div></a>
            <a href="../jsp/iltuoconto.jsp?who=<%= user.getEmail() %>"><div id="account"></div></a>
        </div>
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>

