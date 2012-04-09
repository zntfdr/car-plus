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

public class UpdateMacchinaCS extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String targaold = req.getParameter("oldcar_plate");
		Calendar scadenza_bollo = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_bollo"));
		Calendar scadenza_assicurazione = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_assicurazione"));
		Calendar scadenza_revisione = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_revisione"));
		
		Macchina_CS mCS = new Macchina_CS(req.getParameter("car_plate"),Integer.parseInt(req.getParameter("model")),req.getParameter("city"),req.getParameter("province"), req.getParameter("name_cs"),Integer.parseInt(req.getParameter("purchase_year")),scadenza_bollo, scadenza_assicurazione, scadenza_revisione, Integer.parseInt(req.getParameter("tot_km")),Boolean.parseBoolean("TRUE"));
	
		StoreMacchina_CS.UpdateMacchinaCS(mCS, targaold);

		HttpSession session = req.getSession();
		
		session.setAttribute("descrizione", "Aggiornamento della macchina di car sharing con targa " + targaold + " avvenuto con successo!"); 
		
		String page = "jsp/lista_macchine_cs.jsp";
		res.sendRedirect(page);
	}
}
