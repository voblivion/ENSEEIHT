import java.awt.Color;

abstract class ObjetGeometrique {
		
	protected Color couleur;
	
	protected ObjetGeometrique(Color couleur){
		this.couleur = couleur;
	}
	
	public void setCouleur(Color couleur){
		this.couleur = couleur;
	}
	
	public Color getCouleur(){
		return this.couleur;
	}
	
	abstract public void afficher();
	abstract public void dessiner(afficheur.Afficheur afficheur);
	abstract public void translater(double x, double y);
}
