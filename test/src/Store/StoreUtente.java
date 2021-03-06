package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Cliente;
import Entita.Utente;
import Utils.*;

public class StoreUtente{
	public static boolean deleteUtente(String email) {
		String sql_query = "delete from utente where email = '" + email + "'";
		return Query.doUpdate(sql_query);
	}

	public static boolean insertUtente(Utente ut){
		String sql = "INSERT INTO utente(nome, cognome, sesso, indirizzo, citta, provincia, telefono, email, password, account_sospeso, account_verificato) VALUES('" + ut.getNome().replace("'", "''") + "','" + ut.getCognome().replace("'", "''") + "','" + ut.getSesso() + "','" + ut.getIndirizzo().replace("'", "''") + "','" + ut.getCitta().replace("'", "''") + "','" + ut.getProvincia().replace("'", "''") + "','" + ut.getTelefono().replace("'", "''") + "','" + ut.getEmail() + "','" + Password.checkpsw(ut.getPassword()) + "','" + ut.getAccount_sospeso() + "','" + ut.getAccount_verificato() + "')";
		return Query.doUpdate(sql);
	}

	public static boolean UpdateUtente(Utente ut){
		String sql = "UPDATE utente SET nome = '" + ut.getNome().replace("'", "''") + "', cognome = '" + ut.getCognome().replace("'", "''") + "', sesso = '" + ut.getSesso() + "', indirizzo = '" + ut.getIndirizzo().replace("'", "''") + "', citta = '" + ut.getCitta().replace("'", "''") + "', provincia = '" + ut.getProvincia().replace("'", "''") + "', telefono = '" + ut.getTelefono() + "', password = '" + Password.checkpsw(ut.getPassword()) + "' WHERE email = '" + ut.getEmail() + "'";
		return Query.doUpdate(sql);
	}

	public static boolean UpdateUtenteWithoutPassword(Utente ut){
		String sql = "UPDATE utente SET nome = '" + ut.getNome().replace("'", "''") + "', cognome = '" + ut.getCognome().replace("'", "''") + "', sesso = '" + ut.getSesso() + "', indirizzo = '" + ut.getIndirizzo().replace("'", "''") + "', citta = '" + ut.getCitta().replace("'", "''") + "', provincia = '" + ut.getProvincia().replace("'", "''") + "', telefono = '" + ut.getTelefono() + "' WHERE email = '" + ut.getEmail() + "'";
		return Query.doUpdate(sql);
	}

	public static Utente readUtente(String email){
		String sql = "SELECT * FROM utente WHERE email = '" + email + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Utente(rs.getString("nome"), rs.getString("cognome"),rs.getString("sesso"), rs.getString("indirizzo"), rs.getString("citta"), rs.getString("provincia"), Password.checkpsw(rs.getString("password")), rs.getString("email"), rs.getString("telefono"), rs.getBoolean("account_verificato"), rs.getBoolean("account_sospeso"));
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

	public static ArrayList<Utente> getUtenti() {
		String sql_query = "SELECT * FROM utente ORDER BY email";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql_query);
			if(rs != null){
				ArrayList<Utente> list = new ArrayList<Utente>();
				while (rs.next()) {
					list.add(new Utente (rs.getString("nome"), rs.getString("cognome"),rs.getString("sesso"), rs.getString("indirizzo"), rs.getString("citta"), rs.getString("provincia"), Password.checkpsw(rs.getString("password")), rs.getString("email"), rs.getString("telefono"), rs.getBoolean("account_verificato"), rs.getBoolean("account_sospeso")));
				}
				return list;
			}
		} catch (SQLException e) {

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
