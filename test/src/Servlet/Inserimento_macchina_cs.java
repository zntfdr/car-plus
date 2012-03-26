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
public class Inserimento_macchina_cs extends HttpServlet {

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
		//le prossime dichiarazioni mi servono per convertire le date
		SimpleDateFormat formato_DB = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		java.util.Date temp;

		Timestamp scadenza_bollo = null;
		Timestamp scadenza_assicurazione = null;
		Timestamp scadenza_revisione = null;

		try { 
			temp = formato_DB.parse(req.getParameter("scadenza_bollo"));
			scadenza_bollo = new Timestamp(temp.getTime());
		} catch (ParseException e) { e.printStackTrace(); }

		try { 
			temp = formato_DB.parse(req.getParameter("scadenza_assicurazione"));
			scadenza_bollo = new Timestamp(temp.getTime());
		} catch (ParseException e) { e.printStackTrace(); }

		try { 
			temp = formato_DB.parse(req.getParameter("scadenza_revisione"));
			scadenza_bollo = new Timestamp(temp.getTime());
		} catch (ParseException e) { e.printStackTrace(); }

		//Fine conversione date

		//Inserisco Macchina car sharing
		Macchina_CS mCS = new Macchina_CS(req.getParameter("car_plate"),Integer.parseInt(req.getParameter("model")),req.getParameter("city"),req.getParameter("province"), req.getParameter("name_cs"),Integer.parseInt(req.getParameter("purchase_year")),scadenza_bollo,scadenza_bollo,scadenza_bollo,Integer.parseInt(req.getParameter("tot_km")),Boolean.parseBoolean("TRUE"));		
		mCS =  StoreMacchina_CS.insertMacchina_CS(mCS);

		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";

		//Prendo dal DB la lista delle macchine
		String sql = "SELECT nome FROM Macchina_CS";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<String> listamCS = new ArrayList<String>();
				while(rs.next()){
					listamCS.add(rs.getString("targa"));
				}
				ArrayList<Macchina_CS> listaCompleta = Store.StoreMacchina_CS.readMacchina_CS_List(listamCS);
				session.setAttribute("lista_macchine", listaCompleta);
			} catch(SQLException e){

			}
		}
		session.setAttribute("macchina_nuova",mCS); //passo il costrutto parametri alla pagina
		page = "jsp/new_car_cs_landing.jsp";	

		res.sendRedirect(page);
	}
}
