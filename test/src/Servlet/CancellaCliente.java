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

public class CancellaCliente extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String email = request.getParameter("email");			
		StoreCliente.deleteCliente(email);
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Cancellazione cliente " + email + " ");
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista utenti
	}

}
