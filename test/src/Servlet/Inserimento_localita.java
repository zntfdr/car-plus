package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_localita extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Localita loc = new Localita(req.getParameter("city"),req.getParameter("province"));
		StoreLocalita.insertLocalita(loc);
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", "Inserimento della località (" + loc.getCitta() + "," + loc.getProvincia() + ") avvenuto con successo!"); 
		
		String page = "jsp/lista_localita.jsp";
			
		res.sendRedirect(page);
	}
}
