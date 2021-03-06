import java.lang.String;
import java.awt.Color;
import afficheur.*;

/** Exercice 1
  * @author Victor Drouin Viallard
  */
public class Exercice1 {

	/** Exercice 1
	  */
	public static void main(String[] args)
	{
		Point p = new Point(1,2);
		Segment s = new Segment(new Point(6,2), new Point(11,9));
		Point c = new Point(4,4);
		double r = 2.5;
		String t = new String("Premier dessin");
		Point q = new Point(1,-2);
		String u = new String("TestAfficheur");
		
		Ecran e = new Ecran(u, 400, 250, 15);
		e.dessinerPoint(p.getX(), p.getY(), p.getCouleur());
		e.dessinerLigne(6, 2, 11, 19, s.getCouleur());
		e.dessinerCercle(4, 4, 2.5, Color.yellow);
		e.dessinerTexte(1, -2, t, Color.blue);
	}

}
