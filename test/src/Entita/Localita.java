package Entita;

public class Localita {
    public String provincia;
    public String citta;

    //constructor
    public Localita(String newcitta, String newprovincia) {
        provincia = newprovincia;
        citta = newcitta;
    } 

    public String getProvincia() {
       return provincia;
    }

    public String getCitta() {
       return citta;
    }

    public void setProvincia(String newValue) {
       provincia = newValue;
    }

    public void setCitta(String newValue) {
       citta = newValue;
    }
}