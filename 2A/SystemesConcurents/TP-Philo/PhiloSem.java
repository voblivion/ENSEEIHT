// Time-stamp: <08 déc 2009 08:30 queinnec@enseeiht.fr>

import java.util.concurrent.Semaphore;

public class PhiloSem implements StrategiePhilo {

    /****************************************************************/
    Semaphore[] fourchettes;

    public PhiloSem (int nbPhilosophes) {
    	fourchettes = new Semaphore[nbPhilosophes];
    	for(int k = 0; k < nbPhilosophes; k++) {
    		fourchettes[k] = new Semaphore(1, true);
    	}
    }

    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException
    {
    	int fd = Main.FourchetteDroite(no);
    	int fg = Main.FourchetteGauche(no);
    	fourchettes[fd].acquire();
    	IHMPhilo.poser(fd, EtatFourchette.AssietteGauche);
    	Thread.sleep(3000);
    	fourchettes[fg].acquire();
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
    	fourchettes[fd].release();
    	IHMPhilo.poser(fg, EtatFourchette.Table);
    	fourchettes[fg].release();
    }

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom() {
        return "Implantation Sémaphores, stratégie bête.";
    }

}

