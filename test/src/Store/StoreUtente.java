package Store;
import java.sql.*;
import Entita.Utente;
import Utils.*;

public class StoreUtente{
    public static Utente insertUtente(Utente ut){
        String sql = "INSERT INTO utente(nome, cognome, sesso, indirizzo, citta, provincia, telefono, email, password, account_sospeso, account_verificato) VALUES('" + ut.getNome() + "','" + ut.getCognome() + "','" + ut.getSesso() + "','" + ut.getIndirizzo() + "','" + ut.getCitta() + "','" + ut.getProvincia() + "','" + ut.getTelefono() + "','" + ut.getEmail() + "','" + ut.getPassword() + "','" + ut.getAccount_sospeso() + "','" + ut.getAccount_verificato() + "')";

      Query.doQuery(sql);
      return readUtente(ut.getEmail());
    }

    public static Utente readUtente(String email){
        String sql = "SELECT * FROM utente WHERE email = '" + email + "'";
        ResultSet rs = Query.doQueryRS(sql);
        if(rs != null){
            try {
                while(rs.next()){
                    return new Utente(rs.getString("nome"), rs.getString("cognome"),rs.getString("sesso"), rs.getString("indirizzo"), rs.getString("citta"), rs.getString("provincia"), rs.getString("password"), rs.getString("email"), rs.getString("telefono"), rs.getBoolean("account_verificato"), rs.getBoolean("account_sospeso"));
                }
            }catch (SQLException e){
                }
            }
        return null;
    }
}
