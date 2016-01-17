// Time-stamp: <02 Apr 2008 16:26 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

public class LectRedRedacteurPrioritaire implements LectRed {
    
    private ReentrantLock moniteur;
    private Condition lectureDisponible;
    private Condition ecritureDisponible;
    private int lecteurs;
    private int redacteurs;
    
    public LectRedRedacteurPrioritaire() {
    	this.moniteur = new ReentrantLock();
    	this.lectureDisponible = this.moniteur.newCondition();
    	this.ecritureDisponible = this.moniteur.newCondition();
    	this.lecteurs = 0;
    	this.redacteurs = 0;
    }

    public void demanderLecture  () throws InterruptedException {
        this.moniteur.lock();
    	while(this.redacteurs > 0 || this.moniteur.getWaitQueueLength(this.ecritureDisponible) > 0) {
    	    this.lectureDisponible.await();
    	}
    	this.lecteurs++;
    	this.moniteur.unlock();
    }
    public void terminerLecture  () throws InterruptedException {
        this.moniteur.lock();
    	this.lecteurs--;
        if(this.lecteurs == 0 && this.moniteur.getWaitQueueLength(this.ecritureDisponible) > 0) {
            this.ecritureDisponible.signal();
        }
        this.moniteur.unlock();
    }
    public void demanderEcriture () throws InterruptedException {
    	this.moniteur.lock();
    	while(this.lecteurs > 0 || this.redacteurs > 0) {
    	    this.ecritureDisponible.await();
    	}
    	this.redacteurs++;
    	this.moniteur.unlock();
    }
    public void terminerEcriture () throws InterruptedException {
        this.moniteur.lock();
    	this.redacteurs--;
        if(this.moniteur.getWaitQueueLength(this.ecritureDisponible) > 0) {
            this.ecritureDisponible.signal();
        }
        else {
            this.lectureDisponible.signalAll();
        }
        this.moniteur.unlock();
    }
    public String nomStrategie () {
        return new String("Priorité Rédacteur");
    }
}
