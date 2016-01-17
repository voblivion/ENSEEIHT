/**
  * Exemples d'affichage d'expressions arithmétiques
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class ExemplesAffichage {

	static final private OperateurBinaire plus = new Addition();
	static final private OperateurBinaire fois = new Multiplication();
	static final private OperateurUnaire negation = new Negation();

	static public Expression expression1() {
		return new ExpressionUnaire(negation,
					new ExpressionBinaire(fois,
						new Constante(2),
						new ExpressionBinaire(plus,
							new Constante(1),
							new AccesVariable("x"))));
	}

	static public Expression expression2() {
		return new ExpressionBinaire(plus,
					new Constante(5),
					new ExpressionBinaire(fois,
							new AccesVariable("x"),
							new Constante(4)));
	}


	public static void main(String[] args) {
		// Afficher expression 1
		AfficheurInfixe infixe = new AfficheurInfixe();
		AfficheurPostfixe postfixe = new AfficheurPostfixe();
		CalculHauteur calculerHauteur = new CalculHauteur();
		int e1infixe = expression1().accepter(calculerHauteur);
		System.out.println("h(e1) = " + String.valueOf(e1infixe));

		// Afficher expression2
		int e2infixe = expression2().accepter(calculerHauteur);
		System.out.println("h(e2) = " + String.valueOf(e2infixe));
	}
}

