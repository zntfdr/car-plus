package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Store.*;
import Utils.Query;

public class CancellaContratto extends HttpServlet {
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		int id = Integer.parseInt(request.getParameter("id"));			
		String descrizione = "";
		
		if(StoreContratto.deleteContratto(id))
			descrizione = "Cancellazione del contratto #" + id + " avvenuta con successo!";
		else
			descrizione = "Cancellazione del contratto #" + id + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_contratti.jsp"); //invia a lista contratti
	}

}
