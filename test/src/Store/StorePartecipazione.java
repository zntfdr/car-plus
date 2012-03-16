package Store;
import java.sql.*;

import Entita.Partecipazione;
import Utils.*;

public class StorePartecipazione{
	public static Partecipazione insertPartecipazione(Partecipazione Value){
		String sql = "INSERT INTO partecipazione(email_utente,num_posti,id_tragitto_CP) VALUES('" + Value.getEmail_utente() + ", " + Value.getNum_posti() + ", " + Value.getId_tragitto_CP() + "')";
	    
		Query.doQuery(sql);
		return readPartecipazione(Value.getEmail_utente(),Value.getId_tragitto_CP());
	}

	public static Partecipazione readPartecipazione(String email_utente, int id_tragitto_CP){
		String sql = "SELECT * FROM partecipazione WHERE email_utente = '" + email_utente + "' AND id_tragitto_CP = '" + id_tragitto_CP + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Partecipazione(rs.getString("email_utente"), rs.getInt("num_posti"), rs.getInt("id_tragitto_CP"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
