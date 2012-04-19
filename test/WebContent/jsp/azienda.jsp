<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <title>Azienda | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
         <h1> Benvenuti su Car+ </h1>
        	Car+ apre il nuovo servizio di Car Sharing offre un approccio inedito alle quattro ruote: si compra l'uso effettivo del mezzo anziché il mezzo stesso.
        	Il Car Sharing è la soluzione ideale per spostamenti brevi e frequenti. Un'alternativa per chi percorre pochi chilometri o per chi non intende rinunciare all'auto di proprietà, ma deve fare i conti con esigenze di mobilità che oggi sono risolte con l'acquisto di una seconda o terza macchina.
        	Il Car Sharing è, in Italia, uno dei nuovi strumenti dela mobilità sostenibile.
        	Per informazioni è attivo 24 ore su 24 il numero verde 800.800.800.
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>
