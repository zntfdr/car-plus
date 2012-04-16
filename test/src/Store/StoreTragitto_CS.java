package Store;
import java.sql.*;

import Entita.Tragitto_CS;
import Utils.*;

public class StoreTragitto_CS{
	public static boolean insertTragitto_CS(Tragitto_CS Value){
		String sql = "INSERT INTO tragitto_CS(id_tessera, targa_CS, tempo_prelievo_prenotazione, tempo_consegna_prenotazione) VALUES('" + Value.getId_tessera() + "', '" + Value.getTarga_CS() + "', '" + Utils.TimeString.dataOraCalendarToString(Value.getTempo_prelievo_prenotazione()) + "', '" + Utils.TimeString.dataOraCalendarToString(Value.getTempo_consegna_prenotazione()) + "')";
	    
		return Query.doUpdate(sql);
	}

	public static Tragitto_CS readTragitto_CS(int id){
		String sql = "SELECT * FROM tragitto_CS WHERE id = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CS(rs.getInt("id"), rs.getInt("id_tessera"), rs.getString("targa_CS"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione")), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
