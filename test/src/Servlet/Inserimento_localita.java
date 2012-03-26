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
public class Inserimento_localita extends HttpServlet {

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
		Localita loc = new Localita(req.getParameter("city"),req.getParameter("province"));
		loc = StoreLocalita.insertLocalita(loc);
		
		HttpSession session = req.getSession();
		session.setAttribute("localita_nuova",loc); //passo il costrutto parametri alla pagina
		page = "jsp/new_location_landing.jsp"; 
			
		res.sendRedirect(page);
	}
}
