package Entita;

public class Localita {
    private String provincia;
    private String citta;

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