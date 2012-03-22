package Store;
import java.sql.*;

import Entita.Stazione_CS;
import Utils.*;

public class StoreStazione_CS{
	public static Stazione_CS insertStazione_CS(Stazione_CS Value){
		String sql = "INSERT INTO stazione_CS(citta, provincia, nome, indirizzo, num_posti) VALUES('" + Value.getCitta() + "', '" + Value.getProvincia() + "', '" + Value.getNome() + "', '" + Value.getIndirizzo() + "', " + Value.getNum_posti()+ ")";
	    
		Query.doQuery(sql);
		return readStazione_CS(Value.getCitta(),Value.getProvincia(),Value.getNome());
	}

	public static Stazione_CS readStazione_CS(String citta, String provincia, String nome){
		String sql = "SELECT * FROM stazione_CS WHERE citta = '" + citta + "' AND provincia = '" + provincia + "' AND nome = '" + nome +"'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Stazione_CS(rs.getString("citta"), rs.getString("provincia"), rs.getString("nome"),rs.getString("indirizzo"),rs.getInt("num_posti"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
