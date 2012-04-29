package Store;
import java.sql.*;
import java.util.Calendar;

import Entita.Macchina_CS;
import Entita.Tragitto_CS;
import Utils.*;

public class StoreTragitto_CS{
	public static boolean insertTragitto_CS(Tragitto_CS Value){
		String sql = "INSERT INTO tragitto_CS(id_tessera, targa_CS, tempo_prelievo_prenotazione, tempo_consegna_prenotazione) VALUES('" + Value.getId_tessera() + "', '" + Value.getTarga_CS() + "', '" + Utils.TimeString.dataOraCalendarToString(Value.getTempo_prelievo_prenotazione()) + "', '" + Utils.TimeString.dataOraCalendarToString(Value.getTempo_consegna_prenotazione()) + "')";

		return Query.doUpdate(sql);
	}

	public static Tragitto_CS readTragitto_CS(int id){
		String sql = "SELECT * FROM tragitto_CS WHERE id = " + id;
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					String tp = rs.getString("tempo_prelievo");
					Calendar tempo_prelievo;
					if (tp != null){
						tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar(tp);
					}
					else{ 
						tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
					}
					String tc = rs.getString("tempo_consegna");
					Calendar tempo_consegna;
					if (tc != null){
						tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar(tc);
					}
					else{ 
						tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
					}
					return new Tragitto_CS(rs.getInt("id"), rs.getInt("id_tessera"), rs.getString("targa_CS"), tempo_prelievo, tempo_consegna, Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione")), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}
		}catch (SQLException e){
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
	
	public static boolean UpdateTragittoCS(Tragitto_CS tcs){
		String sql = "UPDATE tragitto_cs SET id_tessera = " + tcs.getId_tessera() + ", targa_CS = '" + tcs.getTarga_CS() + "', tempo_prelievo = '" + Utils.TimeString.dataOraCalendarToString(tcs.getTempo_prelievo()) + "', tempo_consegna = '" + Utils.TimeString.dataOraCalendarToString(tcs.getTempo_consegna()) + "', tempo_prelievo_prenotazione= '" + Utils.TimeString.dataOraCalendarToString(tcs.getTempo_prelievo_prenotazione()) + "', tempo_consegna_prenotazione= '" + Utils.TimeString.dataOraCalendarToString(tcs.getTempo_consegna_prenotazione()) + "', km_totali = " + tcs.getKm_totali() + ", pagato = " + tcs.getPagato() + " WHERE id = " + tcs.getId();
		return Query.doUpdate(sql);
	}
}
