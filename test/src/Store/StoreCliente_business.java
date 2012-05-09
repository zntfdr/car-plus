package Store;
import java.sql.*;

import Entita.Cliente_business;
import Utils.*;

public class StoreCliente_business{
	public static boolean insertCliente_business(Cliente_business cb){
		String sql = "INSERT INTO cliente_business(email_utente, partita_iva, nome_attivita) VALUES('" + cb.getEmail_utente() + "', '" + cb.getPartita_iva() + "', '" + cb.getNome_attivita().replace("'", "''") + "')";
		return Query.doUpdate(sql);
	}

	public static boolean updateCliente_business(Cliente_business cb){
		String sql = "update cliente_business set partita_iva = '" + cb.getPartita_iva() + "', nome_attivita = '" + cb.getNome_attivita().replace("'", "''") + "' where email_utente = '" + cb.getEmail_utente() + "'";
		return Query.doUpdate(sql);
	}

	public static Cliente_business readCliente_business(String email_utente){
		String sql = "SELECT * FROM cliente_business WHERE email_utente = '" + email_utente + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Cliente_business(rs.getString("email_utente"), rs.getString("partita_iva"), rs.getString("nome_attivita"));
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
