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
			
			String check_user_existance_query = "SELECT email FROM utente WHERE email = '" + email + "'";
			ResultSet rs = Utils.Query.doQueryRS(check_user_existance_query);
			
			if (rs != null) {
				try {
					if (rs.next()) {
						Cliente customer = new Cliente(email, codice_fiscale);
						if(StoreCliente.insertCliente(customer))
							descrizione = "Inserimento del cliente base (" + customer.getEmail_utente() + "," + customer.getCodice_fiscale() + ") avvenuta con successo!";
						else
							descrizione = "Inserimento del cliente base (" + customer.getEmail_utente() + "," + customer.getCodice_fiscale() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
					} else {
						mail_exists_yet = true;
						HttpSession session = request.getSession();
						session.setAttribute("error_mail", email);
						session.setAttribute("error_cf", codice_fiscale);
						response.sendRedirect("jsp/new_customer.jsp?error=1&customer_type=normal"); // In caso di errore reinvia al modulo di inserimento
					}
				} catch(SQLException e) {
				}
			}
			
		} else if (request.getParameter("submit_business") != null) {
			
			String email = request.getParameter("email");
			String partita_iva = request.getParameter("partita_iva");
			String nome_attivita = request.getParameter("nome_attivita");
			
			String check_user_existance_query = "SELECT email FROM utente WHERE email = '" + email + "'";
			ResultSet rs = Utils.Query.doQueryRS(check_user_existance_query);
			
			if (rs != null) {
				try {
					if (rs.next()) {
						Cliente_business c = new Cliente_business(email, partita_iva, nome_attivita);
						if(StoreCliente_business.insertCliente_business(c))
							descrizione = "Inserimento del cliente base (" + c.getEmail_utente() + "," + c.getPartita_iva() + "," + c.getNome_attivita() + ") avvenuta con successo!";
						else
							descrizione = "Inserimento del cliente base (" + c.getEmail_utente() + "," + c.getPartita_iva() + "," + c.getNome_attivita() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";						
					} else {
						mail_exists_yet = true;
						HttpSession session = request.getSession();
						session.setAttribute("error_bu_mail", email);
						session.setAttribute("error_bu_pi", partita_iva);
						session.setAttribute("error_bu_na", nome_attivita);
						response.sendRedirect("jsp/new_customer.jsp?error=1&customer_type=business"); // In caso di errore reinvia al modulo di inserimento
					}
				} catch (SQLException e) {
				}
			}
		}
		
		if(!mail_exists_yet) 
		{
			HttpSession session = request.getSession();
			session.setAttribute("descrizione",descrizione);	
			response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista clienti
		}
	}

}
