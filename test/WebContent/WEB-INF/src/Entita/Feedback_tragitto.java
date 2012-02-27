package Entita;
public class Feedback_tragitto {
    public int tragitto_id;
    public int cu_valutante;
    public int cu_valutato;
    public TimeStamp data;
    public String titolo;
    public String commento;
    public int valutazione;

    //constructor
    public Localita(int newtragitto_id, int newcu_valutante, int newcu_valutato, TimeStamp newdata, String newtitolo, String newcommento, int newvalutazione) {
        tragitto_id = newtragitto_id;
        cu_valutante = newcu_valutante;
        cu_valutato = newcu_valutato;
        data = newdata;
        titolo = newtitolo;
        commento = newcommento;
        valutazione = newvalutazione;
    } 

    public void setTragitto_id(int newValue) {
        tragitto_id = newValue;
    }

    public void setCu_valutante(int newValue) {
        cu_valutato = newValue;
    }

    public void setCu_valutante(int newValue) {
        cu_valutante = newValue;
    }

    public void setData(TimeStamp newValue) {
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

    public int getCu_valutante() {
        return cu_valutato;
    }

    public int getCu_valutante() {
        return cu_valutante;
    }

    public TimeStamp getData() {
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
