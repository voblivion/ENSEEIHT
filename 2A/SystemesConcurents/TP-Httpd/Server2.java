import java.net.Socket;
import java.net.ServerSocket;

/**
 * Programme Serveur, utilisant un pool de threads.
 *
 *  PQ (12-08), PM (10-14)
 */
public class Server2 {
    
    private final static int SERVER_PORT = 5000;
    private final static int NUMBER_OF_THREADS = 2;
    private static ThreadPool threadPool;
    
    public static void main(String args[]) throws Exception {
        ServerSocket socketEcoute = new ServerSocket (SERVER_PORT);
        
        threadPool = new ThreadPool(NUMBER_OF_THREADS);

        System.out.println("En attente de demande pour http://localhost:"+SERVER_PORT+"/...");
        
        while(true) {
            // Attendre une demande de connexion de la part d'un client
            Socket socketService = socketEcoute.accept();
            System.out.println("Arrivée d'une demande sur " + socketService);

            // Créer un objet permettant de traiter la requête
            TraitantConnexion tc = new TraitantConnexion(socketService);
            threadPool.addTraitantConnexion(tc);
        }
    }
}
