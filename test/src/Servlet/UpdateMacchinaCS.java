package Servlet;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Store.*;
import Utils.Query;

public class UpdateMacchinaCS extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String descrizione, targaold = req.getParameter("oldcar_plate");
		
		//gestione delle date
		Calendar scadenza_bollo = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_bollo"));
		Calendar scadenza_assicurazione = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_assicurazione"));
		Calendar scadenza_revisione = Utils.TimeString.dataStringToCalendar(req.getParameter("scadenza_revisione"));
		
		Macchina_CS mCS = new Macchina_CS(req.getParameter("car_plate"),Integer.parseInt(req.getParameter("model")),req.getParameter("city"),req.getParameter("province"), req.getParameter("name_cs"),Integer.parseInt(req.getParameter("purchase_year")),scadenza_bollo, scadenza_assicurazione, scadenza_revisione, Integer.parseInt(req.getParameter("tot_km")),Boolean.parseBoolean("TRUE"));
	
		if(StoreMacchina_CS.UpdateMacchinaCS(mCS, targaold))
			descrizione = "Aggiornamento della macchina di car sharing con targa " + targaold + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento della macchina di car sharing con targa " + targaold + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		req.getSession().setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_macchine_cs.jsp");
	}
}
