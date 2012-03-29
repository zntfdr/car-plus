package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

/**
 *
 */
public class Vista_partecipazione extends HttpServlet {

	/**
	 * Gestisce le richieste HTTP GETT
	 * 
	 * @param req
	 *            la richiesta ricevuta dal client.
	 * @param res
	 *            la rispota fornita dal server.
	 * 
	 * @throws ServletException
	 *             se ci sono problemi nell'esecuzione della servlet.
	 * @throws IOException
	 *             se ci sono problemi nella comunicazione client-server.
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String page = "";
		int tragitto_ID = Integer.parseInt(req.getParameter("id"));
		Tragitto_CP tragitto = Store.StoreTragitto_CP.readTragitto_CP(tragitto_ID);
		
		HttpSession session = req.getSession();
		session.setAttribute("tragitto_scelto", tragitto); //passo il costrutto parametri alla pagina
		page = "jsp/show_partecipazione.jsp";
			
		res.sendRedirect(page);
	}
}
