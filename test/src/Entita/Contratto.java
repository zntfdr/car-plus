package Entita;
import java.util.Calendar;

public class Contratto {
	private int id;
    private Calendar data_stipula;
    private Calendar data_scadenza; 
    private String email_cliente;
    private String nome_abbonamento;

	public Contratto(int newid, Calendar newdata_stipula, Calendar newdata_scadenza, String newemail_cliente, String newnome_abbonamento){
		id = newid;
		data_stipula = newdata_stipula;
		data_scadenza = newdata_scadenza;
		email_cliente = newemail_cliente;
		nome_abbonamento = newnome_abbonamento;
	}

	public void setData_stipula(Calendar newValue) {
		data_stipula = newValue;
	}
	
	public void setData_scadenza(Calendar newValue) {
		data_scadenza = newValue;
	}
	
	public void setEmail_cliente(String newValue) {
		email_cliente = newValue;
	}
	
	public void setNome_abbonamento(String newValue) {
		nome_abbonamento = newValue;
	}

	public int getId() {
		return id;
	}
	
	public Calendar getData_stipula() {
		return data_stipula;
	}
	
	public Calendar getData_scadenza() {
		return data_scadenza;
	}
	
	public String getEmail_cliente() {
		return email_cliente;
	}

	public String getNome_abbonamento() {
		return nome_abbonamento;
	}

}