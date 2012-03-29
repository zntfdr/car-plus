package Store;
import java.sql.*;

import Entita.Contratto;
import Utils.*;

public class StoreContratto{
	public static Contratto insertContratto(Contratto Value){
		String sql = "INSERT INTO contratto(data_stipula,data_scadenza,email_cliente,nome_abbonamento) VALUES('" + Utils.TimeString.dataCalendarToString(Value.getData_stipula()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getData_scadenza()) + "', '" + Value.getEmail_cliente() + "', '" + Value.getNome_abbonamento() + "')";
	    
		Query.doQuery(sql);
		return readContratto(Value.getId());
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
}
