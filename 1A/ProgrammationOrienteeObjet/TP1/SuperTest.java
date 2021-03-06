/** Tester les classes créées
 * @author  Victor Drouin
 * @version 1.4
 */
public class SuperTest {

	public static void main(String[] args) {
	
		System.out.print("Test des classes : ");
		System.out.println();
		
		Segment s1 = new Segment(new Point(3,2), new Point(11,4));
		Segment s2 = new Segment(new Point(11,4), new Point(6,9));
		Segment s3 = new Segment(new Point(6,9), new Point(3,2));
		
		double x = (3+11+6)/3;
		double y = (2+4+9)/3;
		
		System.out.print("s1 = ");
		s1.afficher();
		System.out.println();
		System.out.print("s2 = ");
		s2.afficher();
		System.out.println();
		System.out.print("s3 = ");
		s3.afficher();
		System.out.println();
		System.out.print("x = "+x);
		System.out.println();
		System.out.print("y = "+y);
		System.out.println();
	}
}

