package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

/**
 * Servlet implementation class Inserimento_cliente
 */
public class Inserimento_cliente extends HttpServlet {
       

	/**
	 * Gestisce le richieste HTTP POST
	 * 
	 * @param req
	 *            la richiesta ricevuta dal client.
	 * @param res
	 *            la rispota fornita dal server.
	 * 
	 * @throws ServletException
	 *             se ci sono problemi nell'esecuzione della servlet.
	 * @throws IOException
	 *             se ci sono problemi nella comunicazione client-server.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("submit") != null) {
			
			String email = request.getParameter("email");
			String codice_fiscale = request.getParameter("codice_fiscale");
			
			String check_user_existance_query = "SELECT email FROM utente WHERE email = '" + email + "'";
			ResultSet rs = Utils.Query.doQueryRS(check_user_existance_query);
			
			if (rs != null) {
				try {
					if (rs.next()) {
						Cliente customer = new Cliente(email, codice_fiscale);
						StoreCliente.insertCliente(customer);
					} else {
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
						StoreCliente_business.insertCliente_business(c);
					} else {
						response.sendRedirect("jsp/new_customer.jsp?error=1&customer_type=business"); // In caso di errore reinvia al modulo di inserimento
					}
				} catch (SQLException e) {
				}
			}
		}
		
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista utenti
	}

}
