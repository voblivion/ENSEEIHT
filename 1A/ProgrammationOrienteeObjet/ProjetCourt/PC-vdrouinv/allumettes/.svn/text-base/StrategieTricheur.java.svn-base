/**	=OK= =COMPILE=
 *	Stratégie tricheur : essaye de tricher selon la méthode du sujet.
 *
 *	@author :	Victor Drouin Viallard
 *	@version :	0.1
 */
package allumettes; 

import java.util.*;

class StrategieTricheur implements Strategie {
	
	/**
	 *	Constructeur de la stratégie.
	 *
	 */
	public StrategieTricheur(){
	
	}

	/**
	 *	Retourne le nom de la stratégie.
	 *
	 */
	public String getName() {
		return "Tricheur";
	}


	/*
	 *	Retourne le nombre d'allumettes à prendre sur le plateau en accord avec la stratégie employée.
	 *
	 *	@param jeu Le jeu sur lequel appliquer la stratégie.
	 */
	public int getPrises(Jeu jeu) {
		
		try {
			while(jeu.getNombreAllumettes() > 2) {
				jeu.retirer(1);
			}
		} catch (CoupInvalideException e) {}
		
		return 1;
	}


}
