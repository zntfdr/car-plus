package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Store.*;
import Utils.*;

/**
 *
 */
public class RicercaTragitto_CP extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String provinciaPartenza = req.getParameter("fromProv");
		String cittaPartenza = req.getParameter("from");
		String provinciaArrivo = req.getParameter("toProv");
		String cittaArrivo = req.getParameter("to");
		Calendar data = Utils.TimeString.dataStringToCalendar(req.getParameter("date"));
		int num_posti = Integer.parseInt(req.getParameter("people"));

		HttpSession session = req.getSession();
		String page = "jsp/searchResult.jsp";

		String sql ="SELECT id FROM tragitto_CP WHERE provincia_partenza = '" + provinciaPartenza.replace("'", "''") +"' AND citta_partenza = '"+ cittaPartenza.replace("'", "''") +"' AND provincia_arrivo = '"+ provinciaArrivo.replace("'", "''") + "' AND citta_arrivo = '"+ cittaArrivo.replace("'", "''") + "' AND tempo_partenza >= '" + Utils.TimeString.dataCalendarToString(data)+"' AND num_posti >= '" + num_posti + "'";
		String descrizione ="";
		ResultSet rs = Query.doQueryRS(sql);

		if(rs != null){
			try {
				ArrayList<Integer> listaIDTragitto = new ArrayList<Integer>();
				while(rs.next()){
					listaIDTragitto.add(rs.getInt("id"));
				}
				if(!listaIDTragitto.isEmpty()){
					ArrayList<Tragitto_CP> listaTragitti_CP = Store.StoreTragitto_CP.readTragitto_CP_List(listaIDTragitto);
					session.setAttribute("listaTragitti_CP", listaTragitti_CP);
					descrizione ="Risultati ricerca: ";
				} else {
					descrizione ="<p>Spiacente! Non ci sono tragitti che soddisfano la tua richiesta!</p> <p><a href=\"javascript:history.go(-1)\">Torna indietro</a></p>";
					if(session.getAttribute("listaTragitti_CP")!=null){
						session.removeAttribute("listaTragitti_CP");
					}
				}
			}catch (SQLException e){
			}
		} else descrizione ="<p>Spiacente! Non ci sono tragitti che soddisfano la tua richiesta!</p> <p><a href=\"javascript:history.go(-1)\">Torna indietro</a></p>";
		session.setAttribute("num_posti", num_posti);
		session.setAttribute("descrizione", descrizione);
		res.sendRedirect(page);
	}
}
