import afficheur.Ecran;
import java.util.ArrayList;

/** Construire le schéma proposé dans le sujet de TP avec des points,
  * des points nommés
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
  
public class ExempleSchemaTab {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * Ensuite, il est translaté et affiché de nouveau.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
		ArrayList<ObjetGeometrique> elts = new ArrayList<ObjetGeometrique>();
		
		// Créer les trois segments
		Point p1 = new PointNomme(3, 2, "A");
		Point p2 = new PointNomme(6, 9, "S");
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		elts.add(s12);
		Segment s23 = new Segment(p2, p3);
		elts.add(s23);
		Segment s31 = new Segment(p3, p1);
		elts.add(s31);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new PointNomme(sx / 3, sy / 3, "C");
		elts.add(barycentre);

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		for(int k = 0; k < elts.size(); k++) {
			elts.get(k).afficher();
		}
		
		// Créer l'écran d'affichage
		Ecran ecran = new Ecran("ExempleSchemaTab", 600, 400, 20);
		ecran.dessinerAxes();

		// Dessiner le schéma sur l'écran graphique
		for(int k = 0; k < elts.size(); k++) {
			elts.get(k).dessiner(ecran);
		}

		// Translater le schéma
		System.out.println("Translater le schéma de (4, -3) : ");
		for(int k = 0; k < elts.size(); k++) {
			elts.get(k).translater(4, -3);
		}

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		for(int k = 0; k < elts.size(); k++) {
			elts.get(k).afficher();
		}

		// Dessiner le schéma sur l'écran graphique
		for(int k = 0; k < elts.size(); k++) {
			elts.get(k).dessiner(ecran);
		}

		// Forcer l'affichage du schéma (au cas où...)
		ecran.rafraichir();
	}

}
