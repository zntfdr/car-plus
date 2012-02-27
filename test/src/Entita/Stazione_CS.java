public class Stazione_CS {
    public int id_localita;
    public String nome;
    public String indirizzo;
    public int num_posti;

    //constructor
    public Stazione_CS(int newid_localita, String newnome, String newindirizzo, int newnum_posti) {
        id_localita = newid_localita;
        nome = newnome;
        indirizzo = newindirizzo;
        num_posti = newnum_posti;
    } 

    public int getId_localita() {
       return id_localita;
    }

    public String getNome() {
       return nome;
    }

    public String getIndirizzo() {
       return indirizzo;
    }

    public int getNewnum_posti() {
       return num_posti;
    }

    public void setId_localita(int newValue) {
       id_localita = newValue;
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