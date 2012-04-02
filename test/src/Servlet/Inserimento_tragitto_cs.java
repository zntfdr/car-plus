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

public class Inserimento_tragitto_cs extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Contratto contratto = StoreContratto.readContratto(Integer.parseInt(req.getParameter("contratto")));
		Tessera tessera = StoreTessera.readTessera(Integer.parseInt(req.getParameter("tessera")));
		String tempoPrelievo = req.getParameter("tempoPrelievo");
		String tempoConsegna = req.getParameter("tempoConesegna");
		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		
		//Tragitto_CS tragittoCS = new Tragitto_CS(0,tessera.getId(),targa, tempoPrelievo, tempoConsegna);
		
		String sql = "SELECT MCS.targa FROM macchina_cs AS MCS INNER JOIN disponibilita AS D ON MCS.id_modello = D.modello_macchina INNER JOIN tragitto_cs AS TCS ON MCS.targa = TCS.targa_cs  WHERE MCS.provincia = '" + req.getParameter("provincia_stazione") + "' AND MCS.citta = '" + req.getParameter("citta_stazione") + "' AND MCS.prenotabile = 'true' AND D.nome_abbonamento = '"+ contratto.getNome_abbonamento()+"' AND TCS.tempo_consegna < '"+ tempoPrelievo +"'";
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