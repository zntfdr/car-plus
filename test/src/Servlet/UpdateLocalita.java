package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Entita.Utente.Type;
import Utils.*;
import Store.*;

public class UpdateLocalita extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		Localita newplace = new Localita(req.getParameter("city"),req.getParameter("province"));
		Localita oldplace = new Localita(req.getParameter("oldcity"),req.getParameter("oldprovince"));
	
		StoreLocalita.UpdateLocalita(newplace,oldplace);

		HttpSession session = req.getSession();
		session.setAttribute("descrizione", "Aggiornamento della località (" + newplace.getCitta() + "," + newplace.getProvincia() + ") in (" + oldplace.getCitta() + "," + oldplace.getProvincia() + ") avvenuto con successo!"); 
		
		String page = "jsp/lista_localita.jsp";
		res.sendRedirect(page);
	}
}
