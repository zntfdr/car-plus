package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
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


		String partenza = req.getParameter("from");
		String arrivo = req.getParameter("to");
		Timestamp data = new Timestamp(2012, 01, 14, 10, 11, 22, 11);
		//data.valueOf(req.getParameter("date"));
		int num_posti = Integer.parseInt(req.getParameter("people"));
		//boolean fumatori = Boolean.parseBoolean(req.getParameter("smoker"));
		boolean fumatori = false;
		String result = "/jsp/searchResult.jsp";

		String sql ="SELECT T.id, Lp.citta AS partenza, La.citta AS arrivo FROM tragitto_CP AS T INNER JOIN localita AS Lp ON T.id_localita_partenza = Lp.id INNER JOIN localita AS La ON T.id_localita_arrivo = La.id WHERE Lp.citta = '"+ partenza +"' AND La.citta = '"+ arrivo + "'";

		ArrayList<Tragitto_CP> listaTragitti_CP = new ArrayList<Tragitto_CP>();
		ResultSet rs = Query.doQueryRS(sql);
		try {
			while(rs.next()){
				Tragitto_CP tmp = StoreTragitto_CP.readTragitto_CP(rs.getInt("id"));
				tmp.setLocalita_partenza(rs.getString("partenza"));
				tmp.setLocalita_arrivo(rs.getString("arrivo"));
				listaTragitti_CP.add(tmp);
			}
		}catch (SQLException e){
		}

		HttpSession session = req.getSession();
		session.setAttribute("listaTragitti_CP", listaTragitti_CP);

		RequestDispatcher dispatcher = req.getRequestDispatcher(result);
		dispatcher.forward(req, res);
	}
}
