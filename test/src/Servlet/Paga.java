package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.Contratto;
import Entita.Tragitto_CS_info;
import Entita.Utente;
import Entita.Utente.Type;
import Store.*;
import Utils.*;

/**
 * Classe per il Login
 */
public class Paga extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String page = "";
		String sql = "";
		String descrizione ="";
		int idTragitto = Integer.parseInt(req.getParameter("idTragitto"));
		boolean paga = Boolean.parseBoolean(req.getParameter("paga"));
		if (paga){
			sql = "UPDATE tragitto_cs SET pagato='true' WHERE id='" + idTragitto +"'";
			descrizione = "Pagamento effettuato";
		} else {
			sql = "UPDATE tragitto_cs SET pagato='false' WHERE id='" + idTragitto +"'";
			descrizione = "Annuallamento pagamento effettuato";
		}
		Query.doUpdate(sql);
		
		req.getSession().setAttribute("descrizione",descrizione);
		page = "jsp/pagamentiCliente.jsp";
		res.sendRedirect(page);
		
	}
}
