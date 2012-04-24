package Store;
import java.sql.*;

import Entita.Feedback_tragitto;
import Utils.*;

public class StoreFeedback_tragitto{
	public static boolean insertFeedback_tragitto(Feedback_tragitto Value){
		String sql = "INSERT INTO feedback_tragitto(email_valutante,email_valutato,data,titolo,commento,valutazione) VALUES('" + Value.getEmail_valutante() + "', '" + Value.getEmail_valutato() + "', '" + Utils.TimeString.dataCalendarToString(Value.getData()) + "', '" + Value.getTitolo() + "', '" + Value.getCommento() + "', '" + Value.getValutazione() + "')";

		return Query.doUpdate(sql);
	}

	public static Feedback_tragitto readFeedback_tragitto(int tragitto_id, String email_valutante, String email_valutato){
		String sql = "SELECT * FROM feedback_tragitto WHERE tragitto_id = '" + tragitto_id +"' AND email_valutante = '" + email_valutante + "' AND email_valutato = '" + email_valutato + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Feedback_tragitto(rs.getInt("id_tragitto"), rs.getString("email_valutante"), rs.getString("email_valutato"), Utils.TimeString.dataStringToCalendar(rs.getString("data")), rs.getString("titolo"), rs.getString("commento"), rs.getInt("newvalutazione"));
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
