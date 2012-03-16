package Store;
import java.sql.*;

import Entita.Tragitto_CS;
import Utils.*;

public class StoreTragitto_CS{
	public static Tragitto_CS insertTragitto_CS(Tragitto_CS Value){
		String sql = "INSERT INTO tragitto_CS(id, id_tessera, targa_CS, tempo_prelievo, tempo_consegna, tempo_prelievo_prenotazione, tempo_consegna_prenotazione, km_totali, pagato) VALUES('" + Value.getId() + ", " + Value.getId_tessera() + ", " + Value.getTarga_CS() + ", " + Value.getTempo_prelievo() + 	", " + Value.getTempo_consegna() + ", " + Value.getTempo_prelievo_prenotazione() + ", " + Value.getTempo_consegna_prenotazione() + ", " + Value.getKm_totali() + ", " + Value.getPagato() + "')";
	    
		Query.doQuery(sql);
		return readTragitto_CS(Value.getId());
	}

	public static Tragitto_CS readTragitto_CS(int id){
		String sql = "SELECT * FROM tragitto_CS WHERE id = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CS(rs.getInt("id"), rs.getInt("id_tessera"), rs.getString("targa_CS"), rs.getTimestamp("tempo_prelievo"), rs.getTimestamp("tempo_consegna"), rs.getTimestamp("tempo_prelievo_prenotazione"), rs.getTimestamp("tempo_consegna_prenotazione"), rs.getInt("km_totali"), rs.getBoolean("pagato"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
