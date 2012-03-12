package Entita;

public class Messaggio_privato {
	public int id;
	public String email_mittente;
	public String email_destinatario;
	public Timestamp data;
	public String titolo;
	public String testo;

	public Messaggio_privato(String newemail_mittente, String newemail_destinatario, Timestamp newdata, String newtitolo, String newtest)
	{
		email_mittente = newemail_mittente;
		email_destinatario = newemail_destinatario;
		data = newdata;
		titolo = newtitolo;
		testo = newtesto;
	}

	public void setEmail_mittente(String newValue) {
		email_mittente = newValue;
	}
	
	public void setEmail_destinatario(String newValue) {
		email_destinatario = newValue;
	}
	
	public void setData(Timestamp newValue) {
		data = newValue;
	}
	public void setTitolo(String newValue) {
		titolo = newValue;
	}
	
	public void setTesto(String newValue) {
		testo = newValue;
	}

	public int getId() {
		return id;
	}
	
	public String getEmail_mittente() {
		return email_mittente;
	}

	public String getEmail_destinatario() {
		return email_destinatario;
	}
	
	public Timestamp getData() {
		return data;
	}
	
	public String getTitolo() {
		return titolo;
	}
	
	public String getTesto() {
		return testo;
	}

}