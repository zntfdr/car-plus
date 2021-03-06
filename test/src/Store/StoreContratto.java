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
		String sql_query = "SELECT * FROM contratto ORDER BY email_cliente, nome_abbonamento";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql_query);
			if (rs != null) {
				ArrayList<Contratto> list = new ArrayList<Contratto>();
				while (rs.next()) {
					list.add(new Contratto (rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"),rs.getString("nome_abbonamento")));
				}
				return list;
			}
		} catch (SQLException e) {

		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
			} finally {
				rs = null;
			}
		}
		return null;
	}

	public static boolean insertContratto(Contratto Value){
		String sql = "INSERT INTO contratto(data_stipula,data_scadenza,email_cliente,nome_abbonamento) VALUES('" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', '" + Value.getEmail_cliente() + "', '" + Value.getNome_abbonamento().replace("'", "''") + "')";
		return Query.doUpdate(sql);
	}

	public static Contratto readContratto(int id){
		String sql = "SELECT * FROM contratto WHERE id = " + id;
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Contratto(rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"),rs.getString("nome_abbonamento"));
				}
			}
		} catch (SQLException e){
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
			} finally {
				rs = null;
			}
		}
		return null;
	}


	public static boolean updateContratto(Contratto Value){
		String sql = "UPDATE contratto SET data_stipula = '" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', data_scadenza = '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', email_cliente = '" + Value.getEmail_cliente() + "', nome_abbonamento = '" + Value.getNome_abbonamento().replace("'", "''") + "' WHERE id = " + Value.getId();
		return Query.doUpdate(sql);
	}
}
