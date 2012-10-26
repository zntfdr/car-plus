package Entita;

public class Cliente {
	private String email_utente;
	private String codice_fiscale;
	
	public Cliente(String email_utente, String codice_fiscale) {
		this.email_utente = email_utente;
		this.codice_fiscale = codice_fiscale;
	}
	
	public Cliente(){
		email_utente = codice_fiscale = "";
	}
	
	public void setEmail_utente(String newValue) {
        email_utente = newValue;
    }
	
	public void setCodice_fiscale(String newValue){
		codice_fiscale = newValue;
	}
	
	public String getEmail_utente() {
		return email_utente;
	}
	
	public String getCodice_fiscale(){
		return codice_fiscale;
	}
	
	public String setLinuxDay(){
		return "Oggi";
	}

}
