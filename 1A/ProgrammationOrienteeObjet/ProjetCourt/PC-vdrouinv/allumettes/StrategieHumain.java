/* 
 *	Stratégie Humain : demande au joueur humain le nombre d'allumettes à prendre.
 */
package allumettes; 

import java.util.*;

class StrategieHumain implements Strategie {
	
	/**
	 *	Constructeur de la stratégie.
	 *
	 */
	public StrategieHumain(){
	
	}

	/**
	 *	Retourne le nom de la stratégie.
	 *
	 */
	public String getName() {
		return "Humain";
	}


	/*
	 *	Retourne le nombre d'allumettes à prendre sur le plateau en accord avec la stratégie employée.
	 *
	 *	@param jeu Le jeu sur lequel appliquer la stratégie.
	 */
	public int getPrises(Jeu jeu) {
		
		Scanner scanner = new Scanner(System.in);
		String input;
		int nombre = 0;
		
		System.out.print("Combien prenez-vous d'allumettes ? ");
		if(scanner.hasNextInt()) {
			nombre = scanner.nextInt();
		}
		else {
			System.out.println("Vous devez prendre un entier compris entre 1 et 3.");
			
			nombre = this.getPrises(jeu);
		}
		
		return nombre;
	}
}