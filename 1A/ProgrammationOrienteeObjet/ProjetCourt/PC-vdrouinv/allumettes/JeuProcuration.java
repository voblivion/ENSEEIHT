/**	=OK= =COMPILE=
 *	Jeu proxy qu'on peut donner au joueur sereinement.
 *
 *	@author Victor Drouin Viallard
 *	@version 0.1
 */
package allumettes; 


public class JeuProcuration implements Jeu {
	
	/** Le jeu sur lequel est attaché la procuration. */
	private Jeu jeu;


	/**
	 *	Initialise le proxy à partir du jeu réel fourni.
	 *
	 *	@param jeuReel Le jeu sur lequel est attaché la procuration.
	 */

	public JeuProcuration(Jeu jeu) {
		// Initialisation du jeu réel auquel est attaché la procuration
		this.jeu = jeu;
	}
	
	/**
	 *	Retourne le nombre d'allumettes encore dans le jeu réel.
	 *
	 *	@return Le nombre d'allumettes présentes dans le jeu réel.
	 */
	public int getNombreAllumettes() {
		return this.jeu.getNombreAllumettes();
	}
	
	/**
	 *	Lève l'exception RetraitDirectException car la procuration ne permet pas l'utilisation de cette méthode.
	 *
	 *	@throws CoupInvalideException Tentative de prendre un nombre d'allumettes invalide.
	 */
	 public void retirer(int nombrePrises) throws CoupInvalideException {
	 	throw new RetraitDirectException();
	 }

}
