/** Tester le ramasse-miettes de Java.
 * @author  Xavier Crégut
 * @version 1.4
 */
public class TestDestructeur {

	public static void main(String[] args) {
	
		System.out.print("System.out fonctionne.");
		System.out.println();
		
		for (int i = 1; i < 1000000; i++) {
			Point p = new Point(i, i);
		}
		System.out.println("Fini !");
	}
}

