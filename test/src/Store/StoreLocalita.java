package Store;
import java.sql.*;
import Entita.Localita;
import Utils.*;

public class StoreLocalita{
	public static Localita insertLocalita(Localita loc){
		String sql = "INSERT INTO localita(provincia, citta) VALUES('" + loc.getProvincia() + "', '" + loc.getCitta() + "')";

		Query.doQuery(sql);
		return readLocalita(loc.getProvincia(), loc.getCitta());
	}

	public static Localita readLocalita(String provincia, String citta){
		String sql = "SELECT * FROM localita WHERE provincia = '" + provincia + "' AND citta = '" + citta + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Localita(rs.getString("citta"),rs.getString("provincia"));
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return null;
	}
}
