import java.util.concurrent.BlockingQueue;


class Walker extends Thread {
    
    private BlockingQueue<TraitantConnexion> requetesEnAttente;
    
    public Walker(BlockingQueue<TraitantConnexion> requetesEnAttente) {
        this.requetesEnAttente = requetesEnAttente;
    }
    
    public void run() {
        while(true) {
            try {
                this.requetesEnAttente.take().run();
            }
            catch(InterruptedException err) {};
        }
    }
}
