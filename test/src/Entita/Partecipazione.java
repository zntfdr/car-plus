package Entita;

public class Partecipazione {
	private String email_utente;
	private int num_posti;
	private int id_tragitto_CP;

	public Partecipazione(String newemail_utente, int newnum_posti, int newid_tragitto_CP){
		email_utente = newemail_utente;
		num_posti = newnum_posti;
		id_tragitto_CP = newid_tragitto_CP; 
	}

	public void setEmail_utente(String newValue) {
		email_utente = newValue;
	}

	public void setNum_posti(int newValue) {
		num_posti = newValue;
	}

	public void setId_tragitto_CP(int newValue) {
		id_tragitto_CP = newValue;
	}

	public String getEmail_utente() {
		return email_utente;
	}

	public int getNum_posti() {
		return num_posti;
	}

	public int getId_tragitto_CP() {
		return id_tragitto_CP;
	}
}