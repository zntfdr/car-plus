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
 *
 */
public class Get_stazione extends HttpServlet {

	/**
	 * Gestisce le richieste HTTP GETT
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
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// imposta il tipo MIME della risposta
		res.setContentType("text/html");

		// ottiene un flusso di uscita per scrivere la risposta
		PrintWriter out = res.getWriter();
		String provincia = req.getParameter("provincia");
		String citta = req.getParameter("citta");
		String sql = "SELECT * FROM stazione_cs WHERE provincia = '"+provincia+"' AND citta='"+citta+"'";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				out.println("<label for=\"nome_stazione\">Nome Stazione:</label><select name=\"nome_stazione\">");
				while(rs.next()){
					String stazione = "Nome stazione: " + rs.getString("nome") + " indirizzo: "+rs.getString("indirizzo") + " posti: " + rs.getInt("num_posti");
					out.println("<option value=\""+ rs.getString("nome") + "\">"+stazione+"</option>");
				}
				out.println("</section>");
			} catch(SQLException e){
				out.println("Errore DB");
			}
		}
		out.flush();
		out.close();
	}
}