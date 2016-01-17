/* 	=OK= =COMPILE=
 *	Stratégie rapide : le plus d'allumette légalement possible.
 */
package allumettes; 

import java.util.*;

class StrategieRapide implements Strategie {
	
	/**
	 *	Constructeur de la stratégie.
	 *
	 */
	public StrategieRapide(){
	
	}

	/**
	 *	Retourne le nom de la stratégie.
	 *
	 */
	public String getName() {
		return "Rapide";
	}


	/*
	 *	Retourne le nombre d'allumettes à prendre sur le plateau en accord avec la stratégie employée.
	 *
	 *	@param jeu Le jeu sur lequel appliquer la stratégie.
	 */
	public int getPrises(Jeu jeu) {
		return Math.min(3, jeu.getNombreAllumettes());
	}


}
