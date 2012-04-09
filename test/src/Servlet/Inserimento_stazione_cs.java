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

public class Inserimento_stazione_cs extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		//Inserisco Stazione_CS
		Stazione_CS sCS = new Stazione_CS(req.getParameter("city"),req.getParameter("province"),req.getParameter("name"),req.getParameter("address"), Integer.parseInt(req.getParameter("num_places")));		
		sCS =  StoreStazione_CS.insertStazione_CS(sCS);
		
		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";
		
		//Prendo dal DB la lista delle stazioni
		String sql = "SELECT nome FROM Stazione_CS ORDER BY provincia,citta";
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
		page = "jsp/lista_stazioni_cs.jsp";	
		session.setAttribute("descrizione", "Registrazione nuova Stazione avvenuta con successo!");
		
		res.sendRedirect(page);
	}
}
