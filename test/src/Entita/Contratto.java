package Entita;

public class Contratto {
	public int id;
    public Timestamp data_stipula;
    public Timestamp data_scadenza; 
    public String email_cliente;
    public String nome_abbonamento;

	public Contratto(Timestamp newdata_stipula, Timestamp newdata_scadenza, String newemail_cliente, String new_nome_abbonamento)
	{
		data_stipula = newdata_stipula;
		data_scadenza = newdata_scadenza;
		email_cliente = newemail_cliente;
		nome_abbonamento = newnome_abbonamento;
	}

	public void setData_stipula(Timestamp newValue) {
		data_stipula = newValue;
	}
	
	public void setData_scadenza(Timestamp newValue) {
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
	
	public Timestamp getData_stipula() {
		return data_stipula;
	}
	
	public Timestamp getData_scadenza() {
		return data_scadenza;
	}
	
	public String getEmail_cliente() {
		return email_cliente;
	}

	public String getNome_abbonamento() {
		return nome_abbonamento;
	}

}