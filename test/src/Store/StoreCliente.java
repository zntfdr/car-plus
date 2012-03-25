package Store;
import java.sql.*;
import Entita.Cliente;
import Utils.*;

public class StoreCliente {
	public static Cliente insertCliente(Cliente c) {
		String sql_query = "INSERT INTO cliente (email, codice_fiscale) VALUES ('" + c.getEmail_utente() + "', '" + c.getCodice_fiscale() + "')";
		Query.doQuery(sql_query);
		
		return readCliente(c.getEmail_utente(), c.getCodice_fiscale());
	}
	
	public static Cliente readCliente(String email, String codice_fiscale){
		String sql_query = "SELECT * FROM cliente WHERE email = '" + email + "'";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				while (rs.next()) {
					return new Cliente (rs.getString("email_utente"), rs.getString("cf"));
				}
			} catch (SQLException e) {
				
			}
		}
		return null;
	}
}
