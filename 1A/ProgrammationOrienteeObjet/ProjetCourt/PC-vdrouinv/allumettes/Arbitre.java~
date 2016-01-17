/**	=OK=
 *	Fais jouer deux joueurs selon les rêgles autour d'un jeu.
 *
 *	@author :	Victor Drouin Viallard
 *	@version :	0.1
 */
package allumettes; 


public class Arbitre {


	/** Premier joueur de la partie. */
	private Joueur premierJoueur;

	/** Second joueur de la partie. */
	private Joueur secondJoueur;
	
	/** Etat de confiance de l'arbitre */
	private boolean confiant;


	/**
	 *	Initialise l'arbitre en précisant les joueurs qu'il devra arbitrer.
	 *
	 *	@param premierJoueur Le premier joueur qui jouera au jeu.
	 *	@param secondJoueur Le second joueur qui jouera au jeu.
	 */
	public Arbitre(Joueur premierJoueur, Joueur secondJoueur, boolean confiant) {
		
		if(premierJoueur == null) {
			throw new IllegalArgumentException("Le premier joueur est null.");
		}
		else if(secondJoueur == null) {
			throw new IllegalArgumentException("Le second joueur est null.");
		}
		
		this.premierJoueur = premierJoueur;
		this.secondJoueur = secondJoueur;
		this.confiant = confiant;
	}


	/*
	 *	Fais jouer les joueurs en alternance sur le jeu donné.
	 *
	 *	@param jeu Le jeu sur lequel doivent jouer les deux joueurs.
	 */
	public void arbitrer(Jeu jeu) {
		
		if(jeu == null) {
			throw new IllegalArgumentException("Le jeu sur lequel jouer est null.");
		}
		
		JeuProcuration jeuProcuration = new JeuProcuration(jeu);
		Joueur joueur = this.premierJoueur;
		
		while(jeu.getNombreAllumettes() > 0) {
		
			// Faire jouer le joueur courant
			this.arbitrerTour(jeu, jeuProcuration, joueur);
			
			// Changer le joueur courant
			if(joueur == this.premierJoueur) {
				joueur = this.secondJoueur;
			} else {
				joueur = this.premierJoueur;
			}
		}
		// Le joueur dont c'est le tour a gagné.
		
		if(joueur == this.premierJoueur) {
			System.out.println(this.secondJoueur.getNom() + " a perdu !");
		} else {
			System.out.println(this.premierJoueur.getNom() + " a perdu !");
		}
		System.out.print(joueur.getNom() + " a gagné !");
	}
	
	/*
	 *	Fais jouer le joueur un tour sur la procuration de jeu.
	 *	
	 *	@param jeu Le jeu sur lequel doit jouer le joueur.
	 *	@param jeuProcuration La procuration sur laquelle doit jouer le joueur.
	 *	@param joueur Le joueur dont c'est le tour.
	 */
	private void arbitrerTour(Jeu jeu, JeuProcuration jeuProcuration, Joueur joueur) {
		
		int nombrePrises = 0;
		
		try {
			System.out.println();
			System.out.println("Nombre d'allumettes restantes : " + jeu.getNombreAllumettes());
			System.out.println("Au tour de " + joueur.getNom() + ".");
			if(this.confiant) {
				nombrePrises = joueur.getPrises(jeu);
			}
			else {
				nombrePrises = joueur.getPrises(jeuProcuration);
			}
			if(nombrePrises > 1) {
				System.out.println(joueur.getNom() + " prend " + nombrePrises + " allumettes.");
			}
			else {
				System.out.println(joueur.getNom() + " prend " + nombrePrises + " allumette.");
			}
			jeu.retirer(nombrePrises);
		}
		catch (RetraitDirectException e) {
			System.out.print("Partie abandonnée car " + joueur.getNom() + " a triché !");
			System.exit(1);
		}
		catch (CoupInvalideException e) {
			System.out.println("Erreur ! Prise invalide : " + nombrePrises);
			System.out.println("Recommencez !");
			
			this.arbitrerTour(jeu, jeuProcuration, joueur);
		}
	}
}







