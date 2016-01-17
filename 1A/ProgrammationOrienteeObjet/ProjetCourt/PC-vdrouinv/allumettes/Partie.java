/**
 *	Lance une partie de 13 allumettes selon les paramètres fournis en ligne de commande.
 *
 *	@author :	Victor Drouin Viallard
 *	@version :	0.1
 */
package allumettes; 

import java.util.*;
import java.lang.reflect.*;


class Partie {



	/**
	 *	Procédure principale executant le jeu selon les paramètres fournis.
	 *
	 *	@args : Arguments passé en ligne de commande. Doit contenir les noms des joueurs et leur stratégie.	
	 */

	public static void main(String[] args) {
		
		// Création de la liste des stratégies disponibles
		Hashtable<String, Class<?extends Strategie>> strategies = new Hashtable<String, Class<?extends Strategie>>();
		strategies.put("expert", StrategieExpert.class);
		strategies.put("humain", StrategieHumain.class);
		strategies.put("naif", StrategieNaif.class);
		strategies.put("rapide", StrategieRapide.class);
		strategies.put("tricheur", StrategieTricheur.class);
		
		try {
			String[] joueur1parts;
			String[] joueur2parts;
			boolean confiant;
			
			// Traitement des arguments
			
			// S'arrêter si le nombre d'arguments est incorrect.
			if(args.length == 2) {
				joueur1parts = args[0].split("@");
				joueur2parts = args[1].split("@");
				confiant = false;
			}
			else if(args.length == 3) {
				joueur1parts = args[1].split("@");
				joueur2parts = args[2].split("@");
				confiant = true;
				
				if(!args[0].equals("-confiant")) {
					throw new ConfigurationException("Argument optionnel fourni incorrect.");
				}
			}
			else {
				throw new ConfigurationException("Nombre invalide d'arguments reçu : " + args.length + " au lieu de 2 ou 3.");
			}
			
			
			// S'arrêter si la forme des arguments est incorrecte.
			if(joueur1parts.length != 2 || joueur2parts.length != 2) {
				throw new ConfigurationException("Les arguments à fournir doivent être de la forme 'nom@Strategie'.");
			}
			
			// Création de la stratégie des joueurs
			Strategie strategie1 = new StrategieExpert();
			Strategie strategie2 = new StrategieExpert();
			
			try {
				strategie1 = strategies.get(joueur1parts[1]).getConstructor().newInstance();
				strategie2 = strategies.get(joueur2parts[1]).getConstructor().newInstance();
			}
			catch (InstantiationException e) {}
			catch (IllegalAccessException e) {}
			catch (InvocationTargetException e) {}
			catch (NoSuchMethodException e) {
				throw new ConfigurationException("L'une des stratégies choisies n'est pas disponibles");
			}
			
			// Création des joueurs
			Joueur joueur1 = new Joueur(joueur1parts[0], strategie1);
			Joueur joueur2 = new Joueur(joueur2parts[0], strategie2);
			
			// Création du jeu
			Jeu jeu = new JeuReel(13);
			
			// Création de l'arbitre
			Arbitre arbitre = new Arbitre(joueur1, joueur2, confiant);
			
			// Démarrer l'arbitre
			arbitre.arbitrer(jeu);
		}
		catch (ConfigurationException e) {
			
			System.out.println();
			System.out.println("Erreur : " + e.getMessage());
			System.out.println();
			Partie.afficherUsage();
			System.out.println();
			System.exit(1);
		}
	}


	/*
	 *	Affiche la manière d'utiliser le programme.
	 *
	 */

	public static void afficherUsage() {

	}


}
