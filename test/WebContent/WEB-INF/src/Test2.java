import java.sql.*;
public class Test2{
    public static void main (String args[]){
       String sql2 ="SELECT * FROM tester";
        ResultSet res = null;
        res = QueryRS.doQueryRS(sql2);
        
        int id;
        String codicefiscale=null;
        System.out.println("CIao");
        
        try{
            while (res.next()){
                id = res.getInt("id");
                codicefiscale = res.getString("cf");
                System.out.println("ID: " + id + " CF: " + codicefiscale);
            System.out.println("CIao656546ww");
            }
        } catch (SQLException e) {
        System.out.println("CIaoeeeee");
			return;
		}
    }
}
