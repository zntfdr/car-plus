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

/**
 *
 */
public class Inserimento_abbonamento extends HttpServlet {

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
		HttpSession session = req.getSession();
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		abb = StoreAbbonamento.insertAbbonamento(abb);
		String sql = "SELECT nome FROM abbonamento";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<String> listaAbb = new ArrayList<String>();
				while(rs.next()){
					listaAbb.add(rs.getString("nome"));
				}
				ArrayList<Abbonamento> listaCompleta = Store.StoreAbbonamento.readAbbonamento_List(listaAbb);
				session.setAttribute("lista_abbonamenti", listaCompleta);
			} catch(SQLException e){
				
			}
		}
		session.setAttribute("abbonamento_nuovo", abb); //passo il costrutto parametri alla pagina
		page = "jsp/lista_abbonamenti.jsp";
		res.sendRedirect(page);
	}
}