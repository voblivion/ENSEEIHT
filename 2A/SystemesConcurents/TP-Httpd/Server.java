import java.net.Socket;
import java.net.ServerSocket;

/**
 * Programme Serveur, créant un thread pour chaque requête.
 *
 *  PQ (12-08), PM (10-14)
 */
 
public class Server {
	
    private final static int SERVER_PORT = 5000;
    
    public static void main(String args[]) throws Exception {
        ServerSocket socketEcoute = new ServerSocket (SERVER_PORT);

        System.out.println("En attente de demande pour http://localhost:"+SERVER_PORT+"/...");
        
        while(true) {
            // Attendre une demande de connexion de la part d'un client
            Socket socketService = socketEcoute.accept();
            System.out.println("Arrivée d'une demande sur " + socketService);

            // Créer un thread pour s'occuper de cette connexion
            TraitantConnexion tc = new TraitantConnexion(socketService);
            // Traitement séquentiel de chaque requête.
            tc.start();
        }
    }
}
