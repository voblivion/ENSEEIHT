import java.lang.String;
import java.awt.Color;
import afficheur.*;

/** Exercice 3
  * @author Victor Drouin Viallard
  */
public class Exercice3 {

	/** Exercice 3
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
		
		Ecran e = new Ecran(u, 600, 400, 20);
		
		p.dessiner(e);
		s.dessiner(e);
		e.dessinerCercle(c.getX(), c.getY(), r, Color.yellow);
		e.dessinerTexte(q.getX(), q.getY(), t, Color.blue);
		
		p.translater(4,-3);
		s.translater(4,-3);
		c.translater(4,-3);
		q.translater(4,-3);
		
		e.effacer();
		
		p.dessiner(e);
		s.dessiner(e);
		e.dessinerCercle(c.getX(), c.getY(), r, Color.yellow);
		e.dessinerTexte(q.getX(), q.getY(), t, Color.blue);
	}

}
