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

public class UpdateCliente extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String descrizione = "";
		if (request.getParameter("submit") != null) {
			
			String email = request.getParameter("email");
			String codice_fiscale = request.getParameter("codice_fiscale");
			descrizione = "cliente " + email;
			
			Cliente customer = new Cliente(email, codice_fiscale);
			StoreCliente.updateCliente(customer);
			
		} else if (request.getParameter("submit_business") != null) {
			
			String email = request.getParameter("email");
			String partita_iva = request.getParameter("partita_iva");
			String nome_attivita = request.getParameter("nome_attivita");
			
			descrizione = "cliente business "+email;
			
			Cliente_business c = new Cliente_business(email, partita_iva, nome_attivita);
			StoreCliente_business.updateCliente_business(c);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", "Aggiornamento " + descrizione + " ");
		response.sendRedirect("jsp/lista_clienti.jsp"); //invia a lista utenti
	}

}
