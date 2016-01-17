import java.util.HashMap;

/** 
  *
  * @author	
  * @version	$Revision$
  */
public class EvaluateurExpression implements VisiteurExpression<Integer> {
	
	protected HashMap<String, Integer> environnement;
	protected Integer gauche, droite;
		
	public EvaluateurExpression(HashMap<String, Integer> environnement) {
		this.environnement = environnement;
	}
	
	public Integer visiterAccesVariable(AccesVariable v) {
		return this.environnement.get(v.getNom());
	}

	public Integer visiterConstante(Constante c) {
		return c.getValeur();
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		Integer tmp = e.getOperandeGauche().accepter(this);
		droite = e.getOperandeDroite().accepter(this);
		gauche = tmp;
		return e.getOperateur().accepter(this);
	}

	public Integer visiterAddition(Addition a) {
		return gauche + droite;
	}

	public Integer visiterSoustraction(Soustraction a) {
		return gauche - droite;
	}

	public Integer visiterMultiplication(Multiplication m) {
		return gauche * droite;
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		gauche = e.getOperande().accepter(this);
		return e.getOperateur().accepter(this);
	}

	public Integer visiterNegation(Negation n) {
		return - gauche;
	}
	
	public Integer visiterLetIn(LetIn e) {
		String ident = new String(e.getIdent());
		this.environnement.add(ident, e.getEEval().accepter(this));
		int tmp = e.getEFinal().accepter
	}

}
