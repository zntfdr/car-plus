
        <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="Store.StoreTessera" %>
    <%@ page import="Entita.*"%>
    <%@ page import="Servlet.Interrogazione" %>
    <%@ page import = "Utils.HTMLManager" %>
    <%	if (session.getAttribute("ADMIN") == null) {
    	response.sendRedirect("login.jsp");
    } else {  %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Associa Tessera Step 3 | Car+</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
        <link href="../css/base.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/png" href="../img/favicon.png" />
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    	<%= HTMLManager.getHeader(session) %>
        <div id="content">
            <div class="wrapper">
            <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione"); } %>
            <h1>Associa Tessere a Cliente</h1>
            <% int idContratto = Integer.parseInt(request.getParameter("contratto"));
            Abbonamento abbonamento = Interrogazione.abbonamentoFromContratto(idContratto); 
            ArrayList<Tessera>lista_tessere=StoreTessera.getTesseraFromContratto(idContratto);
            int num_tessere=0;
            if (lista_tessere!=null) num_tessere= lista_tessere.size();
            int y = abbonamento.getNum_max_tessere() - num_tessere; %>
            Il contratto <%=idContratto %> ora ha <%=num_tessere %> tessere.<br>  
            <% if (y!=0) { %>
            <form method="GET" action="../Inserimento_tessera" id="step3">
            <li class="hide"><input name="idContratto" value="<%=idContratto %>" readonly="readonly"></input></li>
            Inserisci il numero di tessere da aggiungere, fino ad un massimo di <%=abbonamento.getNum_max_tessere()- num_tessere %>
             <select name="numTessere">
      			<% for(int i = 1; i<=y; i++){ %>
          		<option value="<%=i %>"> <%=i%></option>
    		    <% } %>
    		</select>
    		<button name="submit" type="submit" id="submit">Associa le Tessere</button>
    		</form>
    		<%}
            else {%>
            Non puoi associare altre tessere a questo contratto
            <%}%>
          	<div style="clear: both;"></div>
            </div>
        </div>
        <div id="footer">
        	<div class="wrapper">
            </div>
        </div>
    </body>
    </html>
    <% } %>