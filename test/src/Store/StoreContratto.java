package Store;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import Entita.Contratto;
import Entita.Tessera;
import Utils.*;

public class StoreContratto{
	public static void insertContratto(Contratto Value){
		String sql = "INSERT INTO contratto(data_stipula,data_scadenza,email_cliente,nome_abbonamento) VALUES('" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', '" + Value.getEmail_cliente() + "', '" + Value.getNome_abbonamento() + "')";
	    
		Query.doQuery(sql);
	}

	public static Contratto readContratto(int id){
		String sql = "SELECT * FROM contratto WHERE id = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Contratto(rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"),rs.getString("nome_abbonamento"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Contratto> listaContrattiUtente(String emailCliente){
		String sql = "SELECT * FROM contratto WHERE email_cliente = '" + emailCliente +"'";
		ArrayList<Contratto> listaContratti = new ArrayList<Contratto>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					listaContratti.add(new Contratto(rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"), rs.getString("nome_abbonamento")));
				}
				return listaContratti;
			}catch (SQLException e){
			}
		}
		return listaContratti;
	}
	
	public static int CountTessere(Contratto C){
		String sql = "SELECT COUNT(*) FROM tessera WHERE id_contratto = " + C.getId() ;
    	ResultSet rs = Query.doQueryRS(sql);
    	if(rs != null){
			try {
				while(rs.next()){
					return rs.getInt("count");
				}
			}catch (SQLException e){
			}
		}
		return -1;
	}
}
