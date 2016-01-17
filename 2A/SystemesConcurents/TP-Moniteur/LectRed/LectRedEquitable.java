// Time-stamp: <02 Apr 2008 16:26 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

public class LectRedEquitable implements LectRed {
    
    private ReentrantLock moniteur;
    private Condition disponible;
    private Condition redacteurPret;
    private int redacteurs;
    private int lecteurs;
    
    public LectRedEquitable() {
    	this.moniteur = new ReentrantLock(true);
    	this.disponible = this.moniteur.newCondition();
    	this.redacteurPret = this.moniteur.newCondition();
    	this.redacteurs = 0;
    	this.lecteurs = 0;
    }

    public void demanderLecture  () throws InterruptedException {
        this.moniteur.lock();
        if(this.moniteur.getWaitQueueLength(this.redacteurPret) > 0 || this.moniteur.getWaitQueueLength(this.disponible) > 0 || this.redacteurs > 0) {
            this.disponible.await();
        }
        this.lecteurs++;
        this.disponible.signal();
    	this.moniteur.unlock();
    }
    public void terminerLecture  () throws InterruptedException {
        this.moniteur.lock();
        this.lecteurs--;
        if(this.lecteurs == 0) {
            if(this.moniteur.getWaitQueueLength(this.redacteurPret) > 0) {
                this.redacteurPret.signal();
            }
            else {
                this.disponible.signal();
            }
        }
        this.moniteur.unlock();
    }
    public void demanderEcriture () throws InterruptedException {
    	this.moniteur.lock();
    	if(this.lecteurs > 0 || this.redacteurs > 0) {
    	    this.disponible.await();
    	    
    	    if(this.lecteurs > 0) {
    	        this.redacteurPret.await();
    	    }
    	}
    	this.redacteurs++;
    	this.moniteur.unlock();
    }
    public void terminerEcriture () throws InterruptedException {
        this.moniteur.lock();
    	this.redacteurs--;
        this.disponible.signal();
        this.moniteur.unlock();
    }
    public String nomStrategie () {
        return new String("Equitable");
    }
}
