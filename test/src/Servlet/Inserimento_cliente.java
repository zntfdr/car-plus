package Servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

/**
 * Servlet implementation class Inserimento_cliente
 */
public class Inserimento_cliente extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean mail_exists_yet = false;
		String descrizione = "";
		
		if (request.getParameter("submit") != null) {
			
			String email = request.getParameter("email");
			String codice_fiscale = request.getParameter("codice_fiscale");
			
			Cliente customer = new Cliente(email, codice_fiscale);
			if(StoreCliente.insertCliente(customer))
				descrizione = "Inserimento del cliente base (" + customer.getEmail_utente() + "," + customer.getCodice_fiscale() + ") avvenuta con successo!";
			else
				descrizione = "Inserimento del cliente base (" + customer.getEmail_utente() + "," + customer.getCodice_fiscale() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		} else if (request.getParameter("submit_business") != null) {
			
			String email = request.getParameter("email");
			String partita_iva = request.getParameter("partita_iva");
			String nome_attivita = request.getParameter("nome_attivita");
			
			Cliente_business c = new Cliente_business(email, nome_attivita, partita_iva);
			if(StoreCliente_business.insertCliente_business(c))
				descrizione = "Inserimento del cliente base (" + c.getEmail_utente() + "," + c.getPartita_iva() + "," + c.getNome_attivita() + ") avvenuta con successo!";
			else
				descrizione = "Inserimento del cliente base (" + c.getEmail_utente() + "," + c.getPartita_iva() + "," + c.getNome_attivita() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";						
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione",descrizione);	
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista clienti
	}

}
