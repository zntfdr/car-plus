package Servlet;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Store.*;
import Utils.Query;

public class ComputerDiBordo extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String descrizione;
		int id = Integer.parseInt((String)req.getParameter("id")), km_totali = Integer.parseInt((String)req.getParameter("km_totali"));
		
		//gestione delle date
		Calendar tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar((String)req.getParameter("tempo_prelievo"));
		Calendar tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar((String)req.getParameter("tempo_consegna"));
		
		Tragitto_CS tcs = StoreTragitto_CS.readTragitto_CS(id);
		tcs.setTempo_consegna(tempo_consegna);
		tcs.setTempo_prelievo(tempo_prelievo);
		tcs.setKm_totali(km_totali);
	
		if(StoreTragitto_CS.UpdateTragittoCS(tcs))
			descrizione = "Aggiornamento del tragitto #" + id + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento del tragitto #" + id + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		req.getSession().setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_TragittiCsinfo.jsp");
	}
}
