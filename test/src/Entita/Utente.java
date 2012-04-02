package Entita;

public class Utente {
	
	public enum Type {
	    USER, CLIENTE, BUSINESS
	}
    private String nome;
    private String cognome;
    private String sesso;
    private String indirizzo;
    private String citta;
    private String provincia;
    private String password; /* la criptazione della password viene effettuata esternamente da questa classe */
    private String email;
    private String telefono;
    private boolean account_verificato;
    private boolean account_sospeso;
    private Type user_type;
    
    public Utente(String newnome, String newcognome, String newsesso, String newindirizzo, String newcitta, String newprovincia, String newpassword, String newemail, String newtelefono, boolean newsetAccount_verificato, boolean newaccount_sospeso) {
    	nome = newnome;
    	cognome = newcognome;
    	sesso = newsesso;
    	indirizzo = newindirizzo;
    	citta = newcitta;
    	provincia = newprovincia;
    	password = newpassword;
    	email = newemail;
    	telefono = newtelefono;
    	account_verificato = newaccount_sospeso;
    	account_sospeso = newaccount_sospeso;
    }

    public String getNome() {
        return nome;
    }
    
    public String getCognome() {
        return cognome;
    }
    
    public String getSesso() {
        return sesso;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public String getCitta() {
        return citta;    
    }

    public String getProvincia() {
        return provincia;    
    }
    
    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getTelefono() {
        return telefono;
    }

    public boolean getAccount_verificato() {
        return account_verificato;
    }

    public boolean getAccount_sospeso() {
        return account_sospeso;
    }

    public Type getUserType(){
    	return user_type;
    }
    
    public void setNome(String newValue) {
        nome = newValue;
    }
    
    public void setCognome(String newValue) {
        cognome = newValue;
    }
    
    public void setSesso(String newValue) {
        sesso = newValue;
    }

    public void setIndirizzo(String newValue) {
        indirizzo = newValue;
    }

    public void setCitta(String newValue) {
        citta = newValue;
    }

    public void setProvincia(String newValue) {
        provincia = newValue;
    }
    
    public void setPassword(String newValue) {
        password = newValue;
    }

    public void setEmail(String newValue) {
        email = newValue;
    }

    public void setTelefono(String newValue) {
        telefono = newValue;
    }

    public void setAccount_verificato(boolean newValue) {
        account_verificato = newValue;
    }

    public void setAccount_sospeso(boolean newValue) {
        account_sospeso = newValue;
    }
    
    public void setUserType(Type newValue){
    	user_type=newValue;
    }
}
