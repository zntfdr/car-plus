package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class UpdateModelloMacchina extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String descrizione;
		Modello_Macchina mm = new Modello_Macchina(Integer.parseInt(req.getParameter("id")), req.getParameter("marca"), req.getParameter("modello"), Integer.parseInt(req.getParameter("cilindrata")),Integer.parseInt(req.getParameter("anno")), req.getParameter("alimentazione"), Integer.parseInt(req.getParameter("emissioni_co2")), Integer.parseInt(req.getParameter("num_posti")));
	
		if(StoreModello_Macchina.UpdateModelloMacchina(mm))
			descrizione = "Aggiornamento del modello #" + mm.getId() + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento del modello #" + mm.getId() + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		req.getSession().setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_modelli_macchina.jsp");
	}
}
