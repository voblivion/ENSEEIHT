import java.net.*;
import java.io.*;
import java.util.*;


public class SlaveThread extends Thread {
    static String hosts[] = {"localhost", "localhost"};
    static int ports[] = {8081, 8082};
    static int nbHosts = 2;
    static Random rand = new Random();
    private Socket clientSocket;
    
    public SlaveThread(Socket clientSocket) {
        this.clientSocket = clientSocket;
    }
    
    public void run() {
        try {
            // Connexion avec un esclave
            int rd = rand.nextInt(this.nbHosts);
            Socket slaveSocket = new Socket(this.hosts[rd], this.ports[rd]);
            System.out.println(this.hosts[rd] + ":" + this.ports[rd] + " +1;");
        
            OutputStream slaveOut = slaveSocket.getOutputStream();
            InputStream slaveIn = slaveSocket.getInputStream();
            OutputStream clientOut = this.clientSocket.getOutputStream();
            InputStream clientIn = this.clientSocket.getInputStream();
        
            // Lecture de la requête
            byte[] buff = new byte[1024];
            int buffLength = clientIn.read(buff);
            
            // Envoi sur l'esclave
            slaveOut.write(buff, 0, buffLength);
            // slaveOut.close();
            
            // Transfert de la réponse
            while((buffLength = slaveIn.read(buff)) != -1) {
                clientOut.write(buff, 0, buffLength);
            }
            //clientOut.close();
        
            slaveSocket.close();
            this.clientSocket.close();
        }
        catch(IOException err) {err.printStackTrace();}
        // catch(UnknownHostException err) {}
    }
}
