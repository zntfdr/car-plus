package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Entita.Utente.Type;
import Utils.*;
import Store.*;

public class UpdateModelloMacchina extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		Modello_Macchina mm = new Modello_Macchina(Integer.parseInt(req.getParameter("id")), req.getParameter("marca"), req.getParameter("modello"), Integer.parseInt(req.getParameter("cilindrata")),Integer.parseInt(req.getParameter("anno")), req.getParameter("alimentazione"), Integer.parseInt(req.getParameter("emissioni_co2")), Integer.parseInt(req.getParameter("num_posti")));
	

		StoreModello_Macchina.UpdateModelloMacchina(mm);

		HttpSession session = req.getSession();
		
		session.setAttribute("descrizione", "Aggiornamento del modello #" + mm.getId() + " avvenuto con successo!"); 
		
		String page = "jsp/lista_modelli_macchina.jsp";
		res.sendRedirect(page);
	}
}
