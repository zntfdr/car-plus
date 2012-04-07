<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <title>Car+ | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
        <li> Co2 Risparmiata:<% ArrayList<Integer> array = Interrogazione.getCo2Saved();%>
		<%for(Integer I : array){%>
		<%= I %>
		<%}%> grammi</li>
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