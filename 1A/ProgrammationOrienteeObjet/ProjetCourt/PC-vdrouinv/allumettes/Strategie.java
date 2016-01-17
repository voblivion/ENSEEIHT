/**	=OK= =COMPILE=
 *	Stratégie employée par un joueur.
 *
 *	@author Victor Drouin Viallard
 *	@version 0.1
 */
package allumettes; 


public interface Strategie {

    /**
     *	Retourne le nom de la stratégie.
     *
     */
    public String getName();


    /*
     *	Retourne le nombre d'allumettes à prendre sur le plateau en accord avec la stratégie employée.
     *
     *	@param jeu Le jeu sur lequel appliquer la stratégie.
     */
    public int getPrises(Jeu jeu);
    
    
}
