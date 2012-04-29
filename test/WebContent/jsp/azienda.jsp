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
        	Car+, con l'innovativo servizio di Car Sharing, offre un'inedito approccio alle quattro ruote: si "compra" l'uso effettivo del mezzo anziché il mezzo stesso! </br>
        	Il Car Sharing è la soluzione ideale chi necessita di spostamenti brevi e frequenti: risulta essere un'alternativa vincente per chi percorre pochi chilometri o per chi non intende rinunciare all'auto di proprietà, ma deve fare i conti con esigenze di mobilità che richiederebbero l'acquisto di una seconda o terza macchina. </br>
        	Il Car Sharing è uno dei nuovi strumenti dela mobilità sostenibile e Car+ vuole diventarne uno dei leader in Italia.</br>
        	Per ulteriori informazioni, il numero verde 800.800.800 è attivo 24 ore su 24. </br>
        	</br>
        	Per informazioni sul team di sviluppo del progetto, clicca <a href="about.jsp">qui</a>.
        <div id="about"></div>
         <div style="clear: both;"></div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>
