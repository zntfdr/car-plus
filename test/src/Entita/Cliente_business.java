package Entita;
public class Cliente_business {
    public String email_utente;
	public String nome_attivita;
    public String partita_iva;

    //constructor
    public Cliente_business(String newemail_utente, String newnome_attivita, String newpartita_iva) {
    email_utente = newemail_utente;
    nome_attivita = newnome_attivita;
    partita_iva = newpartita_iva;
    }

    public void setEmail_utente(String newValue) {
        email_utente = newValue;
    }
    
    public void setNome_attivita(String newValue) {
        nome_attivita = newValue;
    }

    public void setPartita_iva(String newValue) {
        partita_iva = newValue;
    }
    
    public String getEmail_utente() {
		return email_utente;
	}
    
    public String getNome_attivita() {
		return nome_attivita;
	}
    
    public String getPartita_iva() {
		return partita_iva;
	}
}
