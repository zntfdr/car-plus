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
public class Get_citta extends HttpServlet {

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
		String selectName = req.getParameter("selectName");
		String newSelectName = selectName.replace("provincia", "citta");
		String sql= "SELECT DISTINCT citta FROM stazione_cs WHERE provincia = '"+provincia+"'";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				out.println("<label for=\"" + newSelectName + "\">Citt&agrave;:</label><select name=\""+newSelectName+"\" id=\""+newSelectName+"\" > ");
				out.println("<option>Seleziona una cittˆ..</option>");
				while(rs.next()){
					String citta = rs.getString("citta");
					out.println("<option value=\""+ citta + "\">"+citta+"</option>");
				}
				out.println("</section>");
			} catch(SQLException e){
				
			}
		}
		out.flush();
		out.close();
	}
}