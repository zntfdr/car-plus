package Store;
import java.util.ArrayList;
import java.sql.*;
import Entita.Cliente;
import Utils.*;

public class StoreCliente {
	public static boolean insertCliente(Cliente c) {
		String sql = "INSERT INTO cliente (email_utente, cf) VALUES ('" + c.getEmail_utente() + "', '" + c.getCodice_fiscale() + "')";
		return Query.doUpdate(sql);
	}
	
	public static boolean updateCliente(Cliente c) {
		String sql = "Update cliente set cf = '" + c.getCodice_fiscale() + "' where email_utente = '" + c.getEmail_utente() + "'";
		return Query.doUpdate(sql);
	}
	
	public static boolean deleteCliente(String email) {
		String sql = "delete from cliente_business where email_utente = '" + email + "'";
		Query.doUpdate(sql);
		
		sql = "delete from cliente where email_utente = '" + email + "'";
		return Query.doUpdate(sql);
	}
	
	public static Cliente readCliente(String email){
		String sql_query = "SELECT * FROM cliente WHERE email_utente = '" + email + "'";
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
