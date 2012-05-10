package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Utils.*;
import Store.*;

public class CancellaCliente extends HttpServlet {
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		String descrizione, email = request.getParameter("email");			
		
		if(StoreCliente.deleteCliente(email))
			descrizione = "Cancellazione cliente " + email + " avvenuta con successo!";
		else
			descrizione = "Cancellazione cliente " + email + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista clienti
	}

}
