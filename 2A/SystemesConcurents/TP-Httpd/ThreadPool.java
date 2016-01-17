import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.BlockingQueue;

/* À COMPLÉTER */


public class ThreadPool {

    /** Requêtes en attente d'être servies. */
    private BlockingQueue<TraitantConnexion> requetesEnAttente;
    private Walker[] walkers;
    
    /** Crée et active un pool avec le nombre de threads spécifié. */
    public ThreadPool(int nbThread) {
        this.requetesEnAttente = new LinkedBlockingQueue<TraitantConnexion>();
        walkers = new Walker[nbThread];
        for(int k = 0; k < nbThread; k++) {
            walkers[k] = new Walker(requetesEnAttente);
            walkers[k].start();
        }
    }
    
    public void addTraitantConnexion(TraitantConnexion tc) {
    	this.requetesEnAttente.add(tc);
    }
}
