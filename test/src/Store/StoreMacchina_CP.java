package Store;
import java.sql.*;

import Entita.Macchina_CP;
import Utils.*;

public class StoreMacchina_CP{
	public static boolean insertMacchina_CP(Macchina_CP Value){
		String sql = "INSERT INTO macchina_CP(targa,modello_macchina) VALUES('" + Value.getTarga() + "', '" + Value.getModello_macchina() + "')";

		return Query.doUpdate(sql);	
	}

	public static Macchina_CP readMacchina_CP(String targa){
		String sql = "SELECT * FROM macchina_CP WHERE targa = '" + targa + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Macchina_CP(rs.getString("targa"), rs.getInt("modello_macchina"));
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
