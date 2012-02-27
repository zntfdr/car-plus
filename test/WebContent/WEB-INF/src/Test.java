import Entita.*;
import Utils.*;
import Store.*;
import java.sql.*;
public class Test{
    public static void main (String args[]){
        Localita loc = new Localita (876, "Veneto", "Treviso", "Padova");
        StoreLocalita.insertLocalita(loc);
    }
}
