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

public class CancellaModelloMacchina extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int id = Integer.parseInt(request.getParameter("id"));			
		
		StoreModello_Macchina.deleteModelloMacchina(id);
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Cancellazione modello macchina #" + id + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_modelli_macchina.jsp"); //invia a lista modello macchina
	}

}
