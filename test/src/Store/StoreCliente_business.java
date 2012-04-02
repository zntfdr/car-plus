package Store;
import java.sql.*;
import Entita.Cliente_business;
import Utils.*;

public class StoreCliente_business{
	public static Cliente_business insertCliente_business(Cliente_business cb){
		String sql = "INSERT INTO cliente_business(email_utente, partita_iva, nome_attivita) VALUES('" + cb.getEmail_utente() + "', '" + cb.getPartita_iva() + "', '" + cb.getNome_attivita()+ "')";
	    
		Query.doQuery(sql);
		return readCliente_business(cb.getEmail_utente());
	}

	public static Cliente_business readCliente_business(String email_utente){
		String sql = "SELECT * FROM cliente_business WHERE email_utente = '" + email_utente + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Cliente_business(rs.getString("email_utente"), rs.getString("partita_iva"), rs.getString("nome_attivita"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
