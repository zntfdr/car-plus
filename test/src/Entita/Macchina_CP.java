package Entita;
public class Macchina_CP {
    public String targa;
    public int modello_macchina;

    //constructor
    public Macchina_CP(String newtarga, int newmodello_macchina) {
        targa = newtarga;
        modello_macchina = newmodello_macchina;
    }

    public void setTarga(String newValue) {
       targa = newValue;
    }

    public void setModello_macchina(int newValue) {
       modello_macchina = newValue;
    }

    public String getTarga() {
       return targa;
    }

    public int getModello_macchina() {
       return modello_macchina;
    }
}
