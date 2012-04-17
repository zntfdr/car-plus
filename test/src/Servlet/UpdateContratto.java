package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class UpdateContratto extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Contratto cntr = new Contratto(Integer.parseInt(req.getParameter("id")),Utils.TimeString.dataStringToCalendar(req.getParameter("data_stipula")),Utils.TimeString.dataStringToCalendar(req.getParameter("data_scadenza")),req.getParameter("email_cliente"),req.getParameter("nome_abbonamento"));
		String descrizione = "";
		
		if(StoreContratto.updateContratto(cntr))
			descrizione = "Aggiornamento del contratto (" + cntr.getEmail_cliente() + "," + cntr.getNome_abbonamento() + ") avvenuto con successo!";
		else
			descrizione = "Aggiornamento del contratto non avvenuta! (Errore SQL: " + Query.erroreSQL + ") <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		req.getSession().setAttribute("descrizione",descrizione);	
		res.sendRedirect("jsp/lista_contratti.jsp");
	}
}
