package Entita;
import java.util.Calendar;

public class Feedback_tragitto {
    private int tragitto_id;
    private String email_valutante;
    private String email_valutato;
    private Calendar data;
    private String titolo;
    private String commento;
    private int valutazione;

    public Feedback_tragitto(int newtragitto_id, String newemail_valutante, String newemail_valutato, Calendar newdata, String newtitolo, String newcommento, int newvalutazione) {
        tragitto_id = newtragitto_id;
        email_valutante = newemail_valutante;
        email_valutato = newemail_valutato;
        data = newdata;
        titolo = newtitolo;
        commento = newcommento;
        valutazione = newvalutazione;
    } 

    public void setTragitto_id(int newValue) {
        tragitto_id = newValue;
    }

    public void setEmail_valutante(String newValue) {
        email_valutato = newValue;
    }

    public void setEmail_valutato(String newValue) {
        email_valutato = newValue;
    }

    public void setData(Calendar newValue) {
        data = newValue;
    }

    public void setTitolo(String newValue) {
        titolo = newValue;
    }

    public void setCommento(String newValue) {
        commento = newValue;
    }

    public void setValutazione(int newValue) {
        valutazione = newValue;
    }

    public int getTragitto_id() {
        return tragitto_id;
    }

    public String getEmail_valutato() {
        return email_valutato;
    }

    public String getEmail_valutante() {
        return email_valutante;
    }

    public Calendar getData() {
        return data;
    }

    public String getTitolo() {
        return titolo;
    }

    public String getCommento() {
        return commento;
    }

    public int getValutazione() {
        return valutazione;
    }
}
