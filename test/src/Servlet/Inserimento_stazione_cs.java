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
public class Inserimento_stazione_cs extends HttpServlet {

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
		
		//Inserisco Località (sia che esista già o no, tanto non crea problemi nè tuple doppie)
		Localita loc = new Localita(req.getParameter("city"),req.getParameter("province"));
		loc = StoreLocalita.insertLocalita(loc);
		
		//Inserisco Stazione_CS
		Stazione_CS sCS = new Stazione_CS(req.getParameter("city"),req.getParameter("province"),req.getParameter("name"),req.getParameter("address"), Integer.parseInt(req.getParameter("num_places")));		
		sCS =  StoreStazione_CS.insertStazione_CS(sCS);
		
		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";
		
		//Prendo dal DB la lista delle stazioni
		String sql = "SELECT nome FROM Stazione_CS";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<String> listasCS = new ArrayList<String>();
				while(rs.next()){
					listasCS.add(rs.getString("nome"));
				}
				ArrayList<Stazione_CS> listaCompleta = Store.StoreStazione_CS.readStazione_CS_List(listasCS);
				session.setAttribute("lista_stazioni", listaCompleta);
			} catch(SQLException e){
				
			}
		}
		
		session.setAttribute("stazione_nuova",sCS); //passo il costrutto parametri alla pagina
		page = "jsp/new_station_cs_landing.jsp";	
		
		res.sendRedirect(page);
	}
}
