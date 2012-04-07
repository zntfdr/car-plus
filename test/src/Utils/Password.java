package Utils;

/*
 * ASSOLUTAMENTE NON CANCELLARE QUESTO METODO! 
 * Alcune password vengono criptate con degli zeri iniziali e, 
 * nel passaggio delle password criptate nei metodi, non so perchè, questi zeri spariscono
 * questo metodo viene usato per riportarli al loro posto
 * 
 */

public class Password {

	public static String checkpsw(String psw){ 
    	while(psw.length() < 32) psw = "0" + psw;
    	return psw; 
    }
}