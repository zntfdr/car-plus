package Store;
import java.sql.*;

import Entita.Macchina_CP;
import Utils.*;

public class StoreMacchina_CP{
	public static Macchina_CP insertMacchina_CP(Macchina_CP Value){
		String sql = "INSERT INTO macchina_CP(targa,modello_macchina) VALUES('" + Value.getTarga() + "', '" + Value.getModello_macchina() + "')";
	    
		Query.doQuery(sql);
		return readMacchina_CP(Value.getTarga());
	}

	public static Macchina_CP readMacchina_CP(String targa){
		String sql = "SELECT * FROM macchina_CP WHERE targa = '" + targa + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Macchina_CP(rs.getString("targa"), rs.getInt("modello_macchina"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
