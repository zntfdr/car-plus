package Entita;
import java.util.Calendar;

public class Messaggio_privato {
	private int id;
	private String email_mittente;
	private String email_destinatario;
	private Calendar data;
	private String titolo;
	private String testo;

	public Messaggio_privato(int newid,String newemail_mittente, String newemail_destinatario, Calendar newdata, String newtitolo, String newtesto){
		id = newid;
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
	
	public void setData(Calendar newValue) {
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
	
	public Calendar getData() {
		return data;
	}
	
	public String getTitolo() {
		return titolo;
	}
	
	public String getTesto() {
		return testo;
	}
}