package Store;
import java.sql.*;

import Entita.Partecipazione;
import Utils.*;

public class StorePartecipazione{
	public static boolean insertPartecipazione(Partecipazione Value){
		String sql = "INSERT INTO partecipazione(email_utente,num_posti,id_tragitto_CP) VALUES('" + Value.getEmail_utente() + "', '" + Value.getNum_posti() + "', '" + Value.getId_tragitto_CP() + "')";

		return Query.doUpdate(sql);
	}

	public static Partecipazione readPartecipazione(String email_utente, int id_tragitto_CP){
		String sql = "SELECT * FROM partecipazione WHERE email_utente = '" + email_utente + "' AND id_tragitto_CP = '" + id_tragitto_CP + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Partecipazione(rs.getString("email_utente"), rs.getInt("num_posti"), rs.getInt("id_tragitto_CP"));
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
}
