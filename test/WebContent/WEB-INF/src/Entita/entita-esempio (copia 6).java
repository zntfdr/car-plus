
public class NOMEENTITA {
    public String attributo1;
    public int attributo2;

    //constructor
    public NOMEENTITA(String newattributo1, int newattributo2) {
        attributo1 = newattributo1;
        attributo2 = newattributo2;
    } 

    public void setAttributo1(String newValue) {
       attributo1 = newValue;
    }

    public void setAttributo2(int newValue) {
       attributo2 = newValue;
    }

    public String getAttributo1() {
       return attributo1;
    }

    public int getAttributo2() {
       return attributo2;
    }
}