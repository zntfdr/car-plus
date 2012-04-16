package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_tragitto_cs extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Calendar tempoPrelievoPrenotazione = Utils.TimeString.parseSQLTimestampToCalendar((String)session.getAttribute("tempoPrelievo"));
		Calendar tempoConsegnaPrenotazione = Utils.TimeString.parseSQLTimestampToCalendar((String)session.getAttribute("tempoConsegna"));
		
		Tragitto_CS tragitto = new Tragitto_CS(0, Integer.parseInt(req.getParameter("idTessera")), req.getParameter("carplate"),null, null,tempoPrelievoPrenotazione ,tempoConsegnaPrenotazione , 0, false);
		StoreTragitto_CS.insertTragitto_CS(tragitto);
		
		//Se tutto va bene, comincio a definire la sessione				
		String page = "jsp/user_home.jsp";
		res.sendRedirect(page);
	}
}