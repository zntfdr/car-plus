package Store;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import Entita.Tragitto_CS_info;
import Utils.*;

public class StoreTragitto_CS_info{

	public static ArrayList<Tragitto_CS_info> readTragitto_CS_info_tragitto(int id){
		String sql = "SELECT MCS.nome_stazione_CS, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna_prenotazione, T.km_totali, T.pagato, T.id_tessera, T.targa_cs FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id WHERE T.id = '" + id + "'";
		ArrayList<Tragitto_CS_info> Tragitto_CS_info_list = new ArrayList<Tragitto_CS_info>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					String nome = rs.getString("nome_stazione_CS");
					String citta = rs.getString("citta");
					String provincia = rs.getString("provincia");
					String marca = rs.getString("marca");
					String modello = rs.getString("modello");
					String tp = rs.getString("tempo_prelievo");
					Calendar tempo_prelievo;
						if (tp != null){
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar(tp);
							}
						else{ 
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					String tc = rs.getString("tempo_consegna");
					Calendar tempo_consegna;
						if (tc != null){
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar(tc);
							}
						else{ 
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					Calendar tempo_prelievo_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione"));
					Calendar tempo_consegna_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione"));
					int km = rs.getInt("km_totali");
					boolean pagato = rs.getBoolean("pagato");
					int id_tessera = rs.getInt("id_tessera");
					String targa = rs.getString("targa_cs");
					Tragitto_CS_info_list.add(new Tragitto_CS_info(nome,citta,provincia,marca,modello,tempo_prelievo,tempo_consegna,tempo_prelievo_prenotazione,tempo_consegna_prenotazione,km,pagato,id,id_tessera,-1,targa,null));
				}
			}catch (SQLException e){
			}
		}
		return Tragitto_CS_info_list;
	}
	
	public static ArrayList<Tragitto_CS_info> readTragitto_CS_info_tessera(int id){
		String sql = "SELECT MCS.nome_stazione_CS, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna_prenotazione, T.km_totali, T.pagato, T.id, T.targa_cs FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id WHERE T.id_tessera = '" + id + "'";
		ArrayList<Tragitto_CS_info> Tragitto_CS_info_list = new ArrayList<Tragitto_CS_info>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					String nome = rs.getString("nome_stazione_CS");
					String citta = rs.getString("citta");
					String provincia = rs.getString("provincia");
					String marca = rs.getString("marca");
					String modello = rs.getString("modello");
					String tp = rs.getString("tempo_prelievo");
					Calendar tempo_prelievo;
						if (tp != null){
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar(tp);
							}
						else{ 
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					String tc = rs.getString("tempo_consegna");
					Calendar tempo_consegna;
						if (tc != null){
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar(tc);
							}
						else{ 
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					Calendar tempo_prelievo_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione"));
					Calendar tempo_consegna_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione"));
					int km = rs.getInt("km_totali");
					boolean pagato = rs.getBoolean("pagato");
					int id_tragitto = rs.getInt("id");
					String targa = rs.getString("targa_cs");
					Tragitto_CS_info_list.add(new Tragitto_CS_info(nome,citta,provincia,marca,modello,tempo_prelievo,tempo_consegna,tempo_prelievo_prenotazione,tempo_consegna_prenotazione,km,pagato,id_tragitto,id,-1,targa,null));
				}
			}catch (SQLException e){
			}
		}
		return Tragitto_CS_info_list;
	}

	public static ArrayList<Tragitto_CS_info> readTragitto_CS_info_contratto(int id){
		String sql = "SELECT MCS.nome_stazione_CS, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna_prenotazione, T.km_totali, T.pagato, T.id, T.id_tessera, T.targa_cs FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id INNER JOIN tessera AS TS ON T.id_tessera=TS.id WHERE TS.id_contratto = '" + id + "'";
		ArrayList<Tragitto_CS_info> Tragitto_CS_info_list = new ArrayList<Tragitto_CS_info>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					String nome = rs.getString("nome_stazione_CS");
					String citta = rs.getString("citta");
					String provincia = rs.getString("provincia");
					String marca = rs.getString("marca");
					String modello = rs.getString("modello");
					String tp = rs.getString("tempo_prelievo");
					Calendar tempo_prelievo;
						if (tp != null){
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar(tp);
							}
						else{ 
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					String tc = rs.getString("tempo_consegna");
					Calendar tempo_consegna;
						if (tc != null){
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar(tc);
							}
						else{ 
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					Calendar tempo_prelievo_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione"));
					Calendar tempo_consegna_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione"));
					int km = rs.getInt("km_totali");
					boolean pagato = rs.getBoolean("pagato");
					int id_tragitto = rs.getInt("id");
					int id_tessera = rs.getInt("id_tessera");
					String targa =rs.getString("targa_cs");
					Tragitto_CS_info_list.add(new Tragitto_CS_info(nome,citta,provincia,marca,modello,tempo_prelievo,tempo_consegna,tempo_prelievo_prenotazione,tempo_consegna_prenotazione,km,pagato,id_tragitto,id_tessera,id,targa,null));
				}
			}catch (SQLException e){
			}
		}
		return Tragitto_CS_info_list;
	}

	public static ArrayList<Tragitto_CS_info> readTragitto_CS_info_cliente(String email){
		String sql = "SELECT MCS.nome_stazione_CS, MCS.citta, MCS.provincia, MM.marca, MM.modello, T.tempo_prelievo, T.tempo_consegna, T.tempo_prelievo_prenotazione, T.tempo_consegna_prenotazione, T.km_totali, T.pagato, T.id, T.id_tessera, TS.id_contratto, T.targa_cs  FROM tragitto_CS AS T INNER JOIN macchina_CS AS MCS ON T.targa_CS=MCS.targa INNER JOIN modello_macchina AS MM ON MCS.id_modello=MM.id INNER JOIN tessera AS TS ON T.id_tessera=TS.id INNER JOIN contratto AS C ON TS.id_contratto=C.id WHERE C.email_cliente = '" + email + "'";
		ArrayList<Tragitto_CS_info> Tragitto_CS_info_list = new ArrayList<Tragitto_CS_info>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					String nome = rs.getString("nome_stazione_CS");
					String citta = rs.getString("citta");
					String provincia = rs.getString("provincia");
					String marca = rs.getString("marca");
					String modello = rs.getString("modello");
					String tp = rs.getString("tempo_prelievo");
					Calendar tempo_prelievo;
						if (tp != null){
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar(tp);
							}
						else{ 
							tempo_prelievo = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					String tc = rs.getString("tempo_consegna");
					Calendar tempo_consegna;
						if (tc != null){
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar(tc);
							}
						else{ 
							tempo_consegna = Utils.TimeString.parseSQLTimestampToCalendar("1111-11-11 00:00:00"); 
							}
					Calendar tempo_prelievo_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_prelievo_prenotazione"));
					Calendar tempo_consegna_prenotazione = Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_consegna_prenotazione"));
					int km = rs.getInt("km_totali");
					boolean pagato = rs.getBoolean("pagato");
					int id_tragitto = rs.getInt("id");
					int id_tessera = rs.getInt("id_tessera");
					int id_contratto = rs.getInt("id_contratto");
					String targa = rs.getString("targa_cs");
					Tragitto_CS_info_list.add(new Tragitto_CS_info(nome,citta,provincia,marca,modello,tempo_prelievo,tempo_consegna,tempo_prelievo_prenotazione,tempo_consegna_prenotazione,km,pagato,id_tragitto,id_tessera,id_contratto,targa,email));
				}
			}catch (SQLException e){
			}
		}
		return Tragitto_CS_info_list;
	}

}