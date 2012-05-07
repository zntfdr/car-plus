package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Store.*;
import Utils.Query;

public class UpdateCliente extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String descrizione = "";
		if (request.getParameter("submit") != null) {
			Cliente c = new Cliente(request.getParameter("email"), request.getParameter("codice_fiscale"));

			if(StoreCliente.updateCliente(c))
				descrizione = "Aggiornamento del cliente (" + c.getEmail_utente() + "," + c.getCodice_fiscale() + ") avvenuto con successo!";
			else
				descrizione = "Aggiornamento del cliente (" + c.getEmail_utente() + "," + c.getCodice_fiscale() + ") non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";;
			
		} else 
		if (request.getParameter("submit_business") != null) {
			Cliente_business c = new Cliente_business(request.getParameter("email"), request.getParameter("partita_iva"), request.getParameter("nome_attivita"));
			if(StoreCliente_business.updateCliente_business(c))
				descrizione = "Aggiornamento del cliente business (" + c.getEmail_utente() + "," + c.getNome_attivita() + ", " + c.getPartita_iva() + ") avvenuto con successo!";
			else
				descrizione = "Aggiornamento del cliente business (" + c.getEmail_utente() + "," + c.getNome_attivita() + ", " + c.getPartita_iva() + ") non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";;
		}
		
		request.getSession().setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista clienti
	}

}
