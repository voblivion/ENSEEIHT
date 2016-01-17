import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

/** TestAvecIntrospection décrit un test élémentaire caractérisé par une classe
 * de test et la méthode de cette classe qui correspond au test.
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.3 $
 */
public class TestAvecIntrospection extends TestElementaire {

	// déclarer ici les attributs nécessaires
	Object objet;
	Method methode;

	public TestAvecIntrospection(Object objet, Method methode) {
		super(methode.getName());
		assert methode != null;
		assert objet != null;
        this.objet = objet;
        this.methode = methode;
	}

	protected void preparer() throws Throwable {
	    Method methodePreparer = this.objet.getClass().getMethod("preparer");
	    methodePreparer.invoke(this.objet, (Object[]) null);
	}
	

	protected void tester() throws Throwable {
	    try {
	        this.methode.invoke(this.objet, (Object[]) null);
	    }
	    catch(InvocationTargetException err) {
	        throw err.getCause();
	    }
	}

	protected void nettoyer() throws Throwable {
	    try {
	        Method methodeNettoyer = this.objet.getClass().getMethod("nettoyer");
	        methodeNettoyer.invoke(this.objet, (Object[]) null);
	    }
	    catch(NoSuchMethodException err) {}
	}

}
