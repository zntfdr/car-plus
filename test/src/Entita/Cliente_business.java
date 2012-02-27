package Entita;
public class Cliente_business {
    public String nome_attivita;
    public String partita_iva;

    //constructor
    public Cliente_business(String newnome_attivita, String newpartita_iva) {
    nome_attivita = newnome_attivita;
    partita_iva = newpartita_iva;
    }

    public void setNome_attivita(String newValue) {
        nome_attivita = newValue;
    }

    public void setPartita_iva(String newValue) {
        partita_iva = newValue;
    }
}
