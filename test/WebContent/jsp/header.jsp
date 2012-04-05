<%@ page import="Entita.Utente" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<div id="header">
        <ul>
            <li><a href="../html/index.html"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="../html/index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
           	<li> <a href="#">Contattaci</a></li>
            <li><%=(user == null) ?  "<a href=\"html/login.html\">Login</a>" : "<a href=\"logout.jsp\">Logout</a>"%></li>
        </ul>
</div>
