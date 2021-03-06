import java.lang.String;
import java.awt.Color;
import afficheur.*;

/** Exercice 4
  * @author Victor Drouin Viallard
  */
public class Exercice4 {

	/** Exercice 4
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
		
		AfficheurSVG e = new AfficheurSVG(u, "", 600, 400);
		
		e.dessinerPoint(p.getX(), p.getY(), p.getCouleur());
		e.dessinerLigne(6, 2, 11, 19, s.getCouleur());
		e.dessinerCercle(c.getX(), c.getY(), r, Color.yellow);
		e.dessinerTexte(q.getX(), q.getY(), t, Color.blue);
		
		e.terminer();
	}

}
