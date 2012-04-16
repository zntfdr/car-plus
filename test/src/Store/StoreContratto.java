package Store;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import Entita.Contratto;
import Utils.*;

public class StoreContratto{
	
	public static boolean deleteContratto(int id) {
		String sql = "DELETE FROM contratto WHERE id = " + id;
		return Query.doUpdate(sql);
	}
	
	public static ArrayList<Contratto> getContratto() {
		String sql_query = "SELECT * FROM contratto ORDER BY email_cliente";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Contratto> list = new ArrayList<Contratto>();
				while (rs.next()) {
					list.add(new Contratto (rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"),rs.getString("nome_abbonamento")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		return null;
	}
	
	public static boolean insertContratto(Contratto Value){
		String sql = "INSERT INTO contratto(data_stipula,data_scadenza,email_cliente,nome_abbonamento) VALUES('" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', '" + Value.getEmail_cliente() + "', '" + Value.getNome_abbonamento() + "')";
		return Query.doUpdate(sql);
	}

	public static Contratto readContratto(int id){
		String sql = "SELECT * FROM contratto WHERE id = " + id;
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
	
	
	public static boolean updateContratto(Contratto Value){
		String sql = "UPDATE contratto SET data_stipula = '" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', data_scadenza = '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', email_cliente = '" + Value.getEmail_cliente() + "', nome_abbonamento = '" + Value.getNome_abbonamento() + "' WHERE id = " + Value.getId();
	    
		return Query.doUpdate(sql);
	}
}
