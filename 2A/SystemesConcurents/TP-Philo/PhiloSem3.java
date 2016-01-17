// Time-stamp: <08 déc 2009 08:30 queinnec@enseeiht.fr>

import java.util.concurrent.Semaphore;

public class PhiloSem3 implements StrategiePhilo {

    /****************************************************************/
    int nb;
    Semaphore[] philosophes;
    EtatPhilosophe[] philosophesStates;
    int[] tempsPhilosophes;
    Semaphore mutex;
    
    public PhiloSem3 (int nbPhilosophes) {
        nb = nbPhilosophes;
    	philosophes = new Semaphore[nbPhilosophes];
    	philosophesStates = new EtatPhilosophe[nbPhilosophes];
    	tempsPhilosophes = new int[nbPhilosophes];
    	for(int k = 0; k < nbPhilosophes; k++) {
    	    philosophes[k] = new Semaphore(0);
            philosophesStates[k] = EtatPhilosophe.Pense;
            tempsPhilosophes[k] = 0;
    	}
    	mutex = new Semaphore(1, true);
    }

    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException
    {
    	mutex.acquire();
    	int pg = Main.PhiloGauche(no);
    	int pd = Main.PhiloDroite(no);
    	while(philosophesStates[pg] == EtatPhilosophe.Mange || philosophesStates[pd] == EtatPhilosophe.Mange) {
    	    tempsPhilosophes[no]++;
    	    philosophesStates[no] = EtatPhilosophe.Demande;
            mutex.release();
    	    philosophes[no].acquire();
    	    mutex.acquire();
    	}
    	tempsPhilosophes[no] = 0;
        philosophesStates[no] = EtatPhilosophe.Mange;
	    mutex.release();
        int fd = Main.FourchetteDroite(no);
        int fg = Main.FourchetteGauche(no);
        IHMPhilo.poser(fd, EtatFourchette.AssietteGauche);
        IHMPhilo.poser(fg, EtatFourchette.AssietteDroite);
    }

    /** Le philosophe no rend les fourchettes.
     *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
     *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
    public void libererFourchettes (int no)
    {
    	int fd = Main.FourchetteDroite(no);
    	int fg = Main.FourchetteGauche(no);
    	IHMPhilo.poser(fd, EtatFourchette.Table);
    	IHMPhilo.poser(fg, EtatFourchette.Table);
    	
    	try {
            mutex.acquire();
        }
        catch(InterruptedException err) {}
        
    	philosophesStates[no] = EtatPhilosophe.Pense;
    	int pg = Main.PhiloGauche(no);
    	int pgg = Main.PhiloGauche(pg);
    	int pd = Main.PhiloDroite(no);
    	int pdd = Main.PhiloDroite(pd);
    	if(philosophesStates[pg] == EtatPhilosophe.Demande && philosophesStates[pd] == EtatPhilosophe.Demande) {
    	    if(tempsPhilosophes[pg] < tempsPhilosophes[pd]) {
    	        philosophes[pd].release();
    	        philosophes[pg].release();
    	    }
    	    else {
    	        philosophes[pg].release();
    	        philosophes[pd].release();
    	    }
    	}
    	else if(philosophesStates[pg] == EtatPhilosophe.Demande) {
    	    philosophes[pg].release();
    	}
    	else if(philosophesStates[pd] == EtatPhilosophe.Demande) {
    	    philosophes[pd].release();
    	}
    	mutex.release();
    }

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom() {
        return "Implantation Sémaphores, stratégie des voisins qui mangent ou pas avec temps d'attente.";
    }

}

