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

public class CancellaMacchinaCS extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String targa = request.getParameter("targa");			
		
		StoreMacchina_CS.deleteMacchinaCS(targa);
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Cancellazione della macchina di car sharing con targa " + targa + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_macchine_cs.jsp"); //invia a lista modello macchina
	}

}
