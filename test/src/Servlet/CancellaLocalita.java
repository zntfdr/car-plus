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

public class CancellaLocalita extends HttpServlet {
       
	public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
			
		Localita old = new Localita (req.getParameter("citta"), req.getParameter("provincia"));			
		StoreLocalita.deleteLocalita(old);
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", "Cancellazione localita (" + old.getCitta() + "," + old.getProvincia() + ") avvenuta con successo!");
		response.sendRedirect("jsp/lista_localita.jsp"); //invia a lista localita
	}

}
