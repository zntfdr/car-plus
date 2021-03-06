package Store;
import java.sql.*;

import Entita.Messaggio_privato;
import Utils.*;

public class StoreMessaggio_privato{
	public static boolean insertMessaggio_privato(Messaggio_privato Value){
		String sql = "INSERT INTO messaggio_privato(email_mittente,email_destinatario,data,titolo,testo) VALUES('" + Value.getEmail_mittente() + "', '" + Value.getEmail_destinatario() + "', '" + Utils.TimeString.dataCalendarToString(Value.getData()) + "', '" + Value.getTitolo().replace("'", "''") +"', '" + Value.getTesto().replace("'", "''") + "')";

		return Query.doUpdate(sql);
	}

	public static Messaggio_privato readMessaggio_privato(int id){
		String sql = "SELECT * FROM messaggio_privato WHERE id = '" + id + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Messaggio_privato(rs.getInt("id"), rs.getString("email_mittente"),rs.getString("email_destinatario"),Utils.TimeString.dataStringToCalendar(rs.getString("data")),rs.getString("titolo"),rs.getString("testo"));
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
