import java.net.*;
import java.io.*;
import java.util.*;


public class LoadBalancer {
    static String hosts[] = {"localhost", "localhost"};
    static int ports[] = {8081, 8082};
    static int nbHosts = 2;
    static Random rand = new Random();
    
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(8080);
        
            while(true) {
                Socket cs = ss.accept();
                System.out.println("LoadBalancer +1;");
                SlaveThread rt = new SlaveThread(cs);
                rt.start();
            }
        } 
        catch(IOException err) {}
    }
}
