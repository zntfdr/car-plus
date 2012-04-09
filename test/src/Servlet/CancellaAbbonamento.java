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

public class CancellaAbbonamento extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String nome = request.getParameter("nome");			
		StoreAbbonamento.deleteAbbonamento(nome);
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Cancellazione abbonamento " + nome + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_abbonamenti.jsp"); //invia a lista abbonamenti
	}

}
