package Servlet;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

/**
 *
 */
public class Inserimento_modello_macchina extends HttpServlet {

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

		//Fine conversione date

		//Inserisco nuovo modello macchina  marca,modello,cilindrata,anno,alimentazione)
		Modello_Macchina mm = new Modello_Macchina(0, req.getParameter("marca"), req.getParameter("modello"), Integer.parseInt(req.getParameter("cilindrata")),Integer.parseInt(req.getParameter("anno")), req.getParameter("alimentazione"), Integer.parseInt(req.getParameter("emissioni_co2")), Integer.parseInt(req.getParameter("num_posti")));		
		StoreModello_Macchina.insertModello_Macchina(mm);

		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";

		//Prendo dal DB la lista delle macchine
		String sql = "SELECT id FROM Modello_Macchina";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<String> listamm = new ArrayList<String>();
				while(rs.next()){
					listamm.add(rs.getString("id"));
				}
				ArrayList<Modello_Macchina> listaCompleta = Store.StoreModello_Macchina.readModello_Macchina_List(listamm);
				session.setAttribute("lista_modelli", listaCompleta);
			} catch(SQLException e){
				
			}
		}
		page = "jsp/new_car_model_landing.jsp";	

		res.sendRedirect(page);
	}
}
