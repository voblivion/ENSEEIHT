/** Une CommandeMenu est une commande qui travaille sur un menu de l'éditeur orienté lignes.
 * @author	Victor Drouin
 * @version	1.0
 */
public class CommandeMenu
    implements Commande
{
    /** Le menu manipulée par la commande. */
    protected Menu menu;
    protected boolean usageUnique;
    protected Ligne ligne;

    /** Initialiser le menu sur lequel travaille
     * cette commande.
     * @param m le menu
     * @param u si le menu est à usage unique
     */
    //@ requires m != null;	// le menu doit être défini
    public CommandeMenu(Menu m, Ligne l, boolean u) {
	menu = m;
	ligne = l;
	usageUnique = u;
    }
    
    public void executer() {
    	if(usageUnique) {
    		    // Afficher le menu
		    menu.afficher();

		    // Sélectionner une entrée dans le menu
		    menu.selectionner();

		    // Valider l'entrée sélectionnée
		    menu.valider();
    	}
    	else {
		do {
		    // Afficher la ligne
		    System.out.println();
		    ligne.afficher();
		    System.out.println();
		    
		    // Afficher le menu
		    menu.afficher();

		    // Sélectionner une entrée dans le menu
		    menu.selectionner();

		    // Valider l'entrée sélectionnée
		    menu.valider();

		} while (! menu.estQuitte());
	}
    }

    public boolean estExecutable() {
	return true;
    }

}
