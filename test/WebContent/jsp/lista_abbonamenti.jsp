<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Abbonamento"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Lista degli Abbonamenti | Car+</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
   
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="file:///Macintosh HD/Users/Gianmarco/Sites"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
    <table id="trip_list">

      <tr>
        <td><b>Nome</b></td>
        <td><b>Descrizione</b></td>
        <td><b>Tariffa</b></td>
        <td><b>Numero Max Tessere</b></td>
        <td><b>Numero Min Tessere</b></td>
      </tr>
  <% ArrayList<Abbonamento> listaAbb = new ArrayList<Abbonamento>();
     listaAbb = (ArrayList<Abbonamento>) session.getAttribute("lista_abbonamenti");
     for(Abbonamento A : listaAbb){%>
      <tr>
        <td> <%= A.getNome() %></td>
        <td> <%= A.getDescrizione() %></td>
        <td> <%= A.getCosto_mensile() %></td>
        <td> <%= A.getNum_max_tessere() %></td>
        <td> <%= A.getNum_min_tessere() %></td>
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