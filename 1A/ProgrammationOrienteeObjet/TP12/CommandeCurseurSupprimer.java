/** Supprimer le caractère sous le curseur.
 * @author	Victor Drouin
 * @version	1.0
 */
public class CommandeCurseurSupprimer
    extends CommandeLigne
{

    /** Initialiser la ligne sur laquelle travaille
     * cette commande.
     * @param l la ligne
     */
    //@ requires l != null;	// la ligne doit être définie
    public CommandeCurseurSupprimer(Ligne l) {
	super(l);
    }

    public void executer() {
	ligne.supprimer();
    }

    public boolean estExecutable() {
	return ligne.getLongueur() > 0;
    }

}
