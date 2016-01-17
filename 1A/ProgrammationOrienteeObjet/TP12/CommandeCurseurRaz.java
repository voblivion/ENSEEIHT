/** Repositionner le curseur au début de la ligne.
 * @author	Victor Drouin
 * @version	1.0
 */
public class CommandeCurseurRaz
    extends CommandeLigne
{

    /** Initialiser la ligne sur laquelle travaille
     * cette commande.
     * @param l la ligne
     */
    //@ requires l != null;	// la ligne doit être définie
    public CommandeCurseurRaz(Ligne l) {
	super(l);
    }

    public void executer() {
	ligne.raz();
    }

    public boolean estExecutable() {
	return true;
    }

}
