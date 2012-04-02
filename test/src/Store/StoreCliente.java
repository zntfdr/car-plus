package Store;
import java.util.ArrayList;
import java.sql.*;
import Entita.Cliente;
import Utils.*;

public class StoreCliente {
	public static Cliente insertCliente(Cliente c) {
		String sql_query = "INSERT INTO cliente (email_utente, cf) VALUES ('" + c.getEmail_utente() + "', '" + c.getCodice_fiscale() + "')";
		Query.doQuery(sql_query);
		
		return readCliente(c.getEmail_utente());
	}
	
	public static Cliente readCliente(String email){
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
	
	public static ArrayList<Cliente> getClienti() {
		String sql_query = "SELECT * FROM cliente";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Cliente> list = new ArrayList<Cliente>();
				while (rs.next()) {
					list.add(new Cliente (rs.getString("email_utente"), rs.getString("cf")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		
		return null;
	}
}
