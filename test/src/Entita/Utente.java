package Entita;

public class Utente {
    public int codice_utente;
    public String nome;
    public String cognome;
    public String sesso;
    public String indirizzo;
    public int id_localita;
    public String password; /* la criptazione della password viene effettuata esternamente da questa classe */
    public String email;
    public String telefono;
    public boolean account_verificato;
    public boolean account_sospeso;
    
    //constructor
    public Utente(int newcodice_utente, String newnome, String newcognome, String newsesso, String newindirizzo, int newid_localita, String newpassword, String newemail, String newtelefono, boolean newsetAccount_verificato, boolean newaccount_sospeso) {
      codice_utente = newcodice_utente;
      nome = newnome;
      cognome = newcognome;
      sesso = newsesso;
      indirizzo = newindirizzo;
      id_localita = newid_localita;
      password = newpassword;
      email = newemail;
      telefono = newtelefono;
      account_verificato = newaccount_sospeso;
      account_sospeso = newaccount_sospeso;
    }
    
    public int getCodice_utente() {
        return codice_utente;
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

    public int getId_localita() {
        return id_localita;    
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

    public void setCodice_utente(int newValue) {
        codice_utente = newValue;
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

    public void setId_localita(int newValue) {
        id_localita = newValue;
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
}
