import java.awt.Color;
import java.lang.String;
import afficheur.*;


public class AfficheurTexte implements Afficheur {
	
	public void dessinerCercle(double x, double y, double rayon, Color c) {
		System.out.println("Cercle {");
		System.out.print("    centre_x = ");System.out.println(x);
		System.out.print("    centre_y = ");System.out.println(y);
		System.out.print("    rayon = ");System.out.println(rayon);
		System.out.print("    couleur = ");System.out.println(c);
		System.out.println("}");
	}
	
	public void dessinerLigne(double x1, double y1, double x2, double y2, Color c) {
		System.out.println("Ligne {");
		System.out.print("    x1 = ");System.out.println(x1);
		System.out.print("    y1 = ");System.out.println(y1);
		System.out.print("    x1 = ");System.out.println(x2);
		System.out.print("    y1 = ");System.out.println(y2);
		System.out.print("    couleur = ");System.out.println(c);
		System.out.println("}");
	}
	
	public void dessinerPoint(double x, double y, Color c) {
		System.out.println("Point {");
		System.out.print("    x = ");System.out.println(x);
		System.out.print("    y = ");System.out.println(y);
		System.out.print("    couleur = ");System.out.println(c);
		System.out.println("}");
	}
	
	public void dessinerTexte(double x, double y, String t, Color c) {
		System.out.println("Point {");
		System.out.print("    x = ");System.out.println(x);
		System.out.print("    y = ");System.out.println(y);
		System.out.print("    valeur = \"");System.out.print(t);System.out.println("\"");
		System.out.print("    couleur = ");System.out.println(c);
		System.out.println("}");
	}
}

