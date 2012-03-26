<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Cliente"%>
<%@ page import="Store.StoreCliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Lista dei Clienti | Car+</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
   
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="index.html"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        <h1>Lista dei Clienti</h1>
    <table id="trip_list">

      <tr>
        <td><b>Mail</b></td>
        <td><b>Codice Fiscale</b></td>
      </tr>
  <% ArrayList<Cliente> lista_clienti = StoreCliente.getClienti();
     for(Cliente c : lista_clienti){%>
      <tr>
        <td> <%= c.getEmail_utente() %></td>
        <td> <%= c.getCodice_fiscale() %></td>
      </tr>
    <% } %>
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