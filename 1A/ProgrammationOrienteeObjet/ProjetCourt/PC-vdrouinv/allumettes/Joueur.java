/**	=OK= =COMPILE=
 *	Participant de la partie.
 *
 *	@author :	Victor Drouin Viallard
 *	@version :	0.1
 */
package allumettes; 


public class Joueur {


	/** Nom du joueur. */
	private String nom;

	/** Stratégie employée par le joueur. */
	private Strategie strategie;


	/*
	*	Initialise le joueur avec son nom et sa stratégie.
	*
	*	@param nom Le nom du joueur.
	*	@param strategie La stratégie adoptée par le joueur.
	*/
	public Joueur(String nom, Strategie strategie) {
		
		if(nom == null) {
			throw new IllegalArgumentException("Le nom du joueur est null.");
		} else if(strategie == null) {
			throw new IllegalArgumentException("La stratégie du joueur est null.");
		}
		
		this.nom = nom;
		this.strategie = strategie;
	}


	/**
	 *	Retourne le nom du joueur.
	 *	
	 *	@return Le nom du joueur.
	 */
	public String getNom() {
		
		return this.nom;
	}


	/**
	 *	Fais jouer la stratégie du joueur qui retourne le nombre d'allumettes qu'il souhaite prendre.
	 *
	 *	@param jeu Le jeu sur lequel doit jouer le joueur.
	 *	@return Le nombre d'allumettes que décide de prendre le joueur.
	 */

	public int getPrises(Jeu jeu) {
		
		return this.strategie.getPrises(jeu);
	}


}
