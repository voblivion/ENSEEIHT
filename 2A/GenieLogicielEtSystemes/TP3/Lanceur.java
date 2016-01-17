import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.lang.reflect.*;

/**
 * Lanceur lance automatiquement toutes les méthodes de test contenues dans les
 * classes dont les noms sont donnés en argument de main.
 * Lanceur utilise l'introspection pour chercher les méthodes qui commencent
 * par « test » et qui correspondent alors à un programme de test.  Aucune
 * vérification n'est faite concernant les droits d'accès, l'absence de
 * paramètre, etc.  Les méthodes de test des classes parentes ne sont pas
 * considérées.
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.5 $
 */
public class Lanceur {

	/** Construire la suite des tests décrits dans la classe nommé
	 * nomClasseDeTest.
	 * @param nomClasseDeTest nom de la classe de test
	 */
	public static SuiteTest getSuiteTest(String nomClasseDeTest)
		throws ClassNotFoundException
	{
		SuiteTest st = new SuiteTest();
		Class<?> classeDeTest = Class.forName(nomClasseDeTest);
		Method[] methods = classeDeTest.getMethods();
		for(int k = 0; k < methods.length; k++) {
		    Class<?>[] parametersTypes = methods[k].getParameterTypes();
		    Class<?> returnType = methods[k].getReturnType();
		    int modifiers = methods[k].getModifiers();
		    String name = methods[k].getName();
		    if(parametersTypes.length == 0 && returnType == Void.TYPE && Modifier.isPublic(modifiers) && !Modifier.isStatic(modifiers) && name.indexOf("test") == 0) {
		    	try {
		            st.ajouter(new TestAvecIntrospection(classeDeTest.getConstructor().newInstance(), methods[k]));
		        }
		        catch(InstantiationException err) {}
		        catch(IllegalAccessException err) {}
		        catch(InvocationTargetException err) {}
		        catch(NoSuchMethodException err) {}
		    }
		}
		return st;
	}

	/** Charger des classes de test.
	 * @param nomClasses nom des classes de test
	 */
	public static void lancer(String[] nomClasses, ResultatTest resultats)
			throws ClassNotFoundException
	{
		assert nomClasses != null;
		assert resultats != null;
		
		// Construire la suite des suites des tests
		SuiteTest suite = new SuiteTest();
		for (String nom : nomClasses) {
			suite.ajouter(getSuiteTest(nom));
		}

		// Lancer les tests
		suite.lancer(resultats);
	}


	/** Lancer tous les tests des classes dont les noms sont donnés en argument.
	 * @param args noms des classes de test
	 */
	public static void main(String[] args) throws ClassNotFoundException {
		assert args != null;
		assert args.length >= 0;

		ResultatTest resultats = new ResultatTest();
		lancer(args, resultats);
		System.out.println(resultats);
	}

}
