package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class CancellaContratto extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int id = Integer.parseInt(request.getParameter("id"));			
		String descrizione = "";
		
		if(StoreContratto.deleteContratto(id))
			descrizione = "Cancellazione del contratto #" + id + " avvenuta con successo!";
		else
			descrizione = "Cancellazione del contratto #" + id + " non avvenuta! <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_contratti.jsp"); //invia a lista contratti
	}

}
