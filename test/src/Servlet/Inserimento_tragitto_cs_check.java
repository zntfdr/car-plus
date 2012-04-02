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

public class Inserimento_tragitto_cs_check extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Contratto contratto = StoreContratto.readContratto(Integer.parseInt(req.getParameter("contratto")));
		ArrayList<Tessera> listaTessere = StoreTessera.getTesseraFromContratto(Integer.parseInt(req.getParameter("contratto")));
		
		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		session.setAttribute("listaTessere", listaTessere);
		//Prendo dal DB la lista delle stazioni
		String sql = "SELECT MCS.targa FROM macchina_cs AS MCS INNERJOIN disponibilita AS D ON MCS.id_modello = D.id_modello WHERE MCS.provincia = '" + req.getParameter("provincia_stazione") + "' AND MCS.citta = '" + req.getParameter("citta_stazione") + "' AND MCS.prenotabile = 'true' AND D.nome_abbonamento ='"+ contratto.getNome_abbonamento()+"'";
		
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<String> listaTarghe = new ArrayList<String>();
				while(rs.next()){
					listaTarghe.add(rs.getString("targa"));
				}
				ArrayList<Macchina_CS> listaMacchine = StoreMacchina_CS.readMacchina_CS_List(listaTarghe);
				session.setAttribute("listaStazioni", listaMacchine);
			} catch(SQLException e){
				
			}
		}
		String page = "jsp/new_tragitto_cs.jsp";
		res.sendRedirect(page);
	}
}
