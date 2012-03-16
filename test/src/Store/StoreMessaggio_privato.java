package Store;
import java.sql.*;

import Entita.Messaggio_privato;
import Utils.*;

public class StoreMessaggio_privato{
	public static Messaggio_privato insertMessaggio_privato(Messaggio_privato Value){
		String sql = "INSERT INTO messaggio_privato(email_mittente,email_destinatario,data,titolo,testo) VALUES('" + Value.getEmail_mittente() + ", " + Value.getEmail_destinatario() + ", " + Value.getData() + ", " + Value.getTitolo() +", " + Value.getTesto() + "')";
	    
		Query.doQuery(sql);
		return readMessaggio_privato(Value.getId());
	}

	public static Messaggio_privato readMessaggio_privato(int id){
		String sql = "SELECT * FROM messaggio_privato WHERE id = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Messaggio_privato(rs.getInt("id"), rs.getString("email_mittente"),rs.getString("email_destinatario"),rs.getTimestamp("data"),rs.getString("titolo"),rs.getString("testo"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
