package Entita;

public class Stazione_CS {
	private String citta;
    private String provincia;
    private String nome;
    private String indirizzo;
    private int num_posti;

    public Stazione_CS(String newcitta, String newprovincia, String newnome, String newindirizzo, int newnum_posti) {
    	citta = newcitta;
        provincia = newprovincia;
        nome = newnome;
        indirizzo = newindirizzo;
        num_posti = newnum_posti;
    } 

    public String getCitta() {
        return citta;    
    }

    public String getProvincia() {
        return provincia;    
    }

    public String getNome() {
       return nome;
    }

    public String getIndirizzo() {
       return indirizzo;
    }

    public int getNum_posti() {
       return num_posti;
    }

    public void setCitta(String newValue) {
        citta = newValue;
    }

    public void setProvincia(String newValue) {
        provincia = newValue;
    }

    public void setNome(String newValue) {
       nome = newValue;
    }

    public void setIndirizzo(String newValue) {
       indirizzo = newValue;
    }

    public void setNewnum_posti(int newValue) {
        num_posti = newValue;
    }
}