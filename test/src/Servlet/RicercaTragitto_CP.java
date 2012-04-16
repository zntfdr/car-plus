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
		
		String provinciaPartenza = req.getParameter("fromProv");
		String cittaPartenza = req.getParameter("from");
		String provinciaArrivo = req.getParameter("toProv");
		String cittaArrivo = req.getParameter("to");
		Calendar data = Utils.TimeString.dataStringToCalendar(req.getParameter("date"));
		int num_posti = Integer.parseInt(req.getParameter("people"));

		HttpSession session = req.getSession();
		String result = "jsp/searchResult.jsp";

		String sql ="SELECT id FROM tragitto_CP WHERE provincia_partenza = '" + provinciaPartenza +"' AND citta_partenza = '"+ cittaPartenza +"' AND provincia_arrivo = '"+ provinciaArrivo+ "' AND citta_arrivo = '"+ cittaArrivo + "' AND tempo_partenza >= '" + Utils.TimeString.dataCalendarToString(data)+"' AND num_posti >= '" + num_posti + "'";
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
				} else result ="jsp/failure.jsp";
			}catch (SQLException e){
			}
		} else result ="jsp/failure.jsp";
		session.setAttribute("num_posti", num_posti);
		res.sendRedirect(result);
	}
}
