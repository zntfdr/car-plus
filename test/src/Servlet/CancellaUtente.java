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

public class CancellaUtente extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String email = request.getParameter("email");			
		StoreUtente.deleteUtente(email);
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Cancellazione utente " + email + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_utenti.jsp"); //invia a lista utenti
	}

}
