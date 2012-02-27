package Utils;
 import java.math.*;
 import java.security.*;
 public class MD5{
    public static String encrypt(String password){
    try {
    MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
    mdEnc.update(password.getBytes(), 0, password.length());
    return new BigInteger(1, mdEnc.digest()).toString(16); // Encrypted string
     } catch (java.security.NoSuchAlgorithmException e){
        }
    return null;
    }
}
