package Entita;
public class Macchina_CP {
    public String targa;
    public int modello_macchina;

    //constructor
    public Macchina_CP(String newtarga, int newmodello_macchina) {
        targa = newtarga;
        modello_macchina = newmodello_macchina;
    }

    public void setTarga(int newValue) {
       targa = newValue;
    }

    public void setModello_macchina(String newValue) {
       modello_macchina = newValue;
    }

    public int getTarga() {
       return targa;
    }

    public String getModello_macchina() {
       return modello_macchina;
    }
}
