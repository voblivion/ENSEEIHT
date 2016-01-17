/* 
 *	Stratégie expert : gagne si théoriquement possible.
 */
package allumettes; 

import java.util.*;

class StrategieExpert implements Strategie {
	
	/**
	 *	Constructeur de la stratégie.
	 *
	 */
	public StrategieExpert(){
	
	}

	/**
	 *	Retourne le nom de la stratégie.
	 *
	 */
	public String getName() {
		return "Expert";
	}


	/*
	 *	Retourne le nombre d'allumettes à prendre sur le plateau en accord avec la stratégie employée.
	 *
	 *	@param jeu Le jeu sur lequel appliquer la stratégie.
	 */
	public int getPrises(Jeu jeu) {
		return Math.max(1, (jeu.getNombreAllumettes() - 1) % 4);
	}


}
