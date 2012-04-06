package Store;
import java.sql.*;

import Entita.Tragitto_CS_info;
import Utils.*;

public class StoreTragitto_CS_info{

	public static Tragitto_CS_info readTragitto_CS_info_tessera(int id){
		String sql = "SELECT MCS.nome, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna prenotazione, T.km_totali. T.pagato FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id WHERE T.id_tessera = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CS_info(rs.getString("nome"), rs.getString("citta"), rs.getString("provincia"), rs.getString("marca"), rs.getString("modello"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione")), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}

	public static Tragitto_CS_info readTragitto_CS_info_contratto(int id){
		String sql = "SELECT MCS.nome, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna prenotazione, T.km_totali. T.pagato FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id INNER JOIN tessera AS TS ON T.id_tessera=TS.id WHERE TS.id_contratto = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CS_info(rs.getString("nome"), rs.getString("citta"), rs.getString("provincia"), rs.getString("marca"), rs.getString("modello"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione")), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}

	public static Tragitto_CS_info readTragitto_CS_info_cliente(String email){
		String sql = "SELECT MCS.nome, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna prenotazione, T.km_totali. T.pagato FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id INNER JOIN tessera AS TS ON T.id_tessera=TS.id INNER JOIN contratto AS C ON TS.id_contratto=C.id WHERE C.email_cliente = '" + email + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CS_info(rs.getString("nome"), rs.getString("citta"), rs.getString("provincia"), rs.getString("marca"), rs.getString("modello"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione")), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}

}