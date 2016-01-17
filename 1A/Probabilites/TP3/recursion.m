% Fonction recursive permettant de construire un ensemble connexe de pixels similaires au pixel (i,j) :

function [E,card_E,contour_restant] = recursion(E,card_E,contour_restant,i,j,Gx,Gy,G_norme,card_E_max,cos_alpha)

	nb_lignes = size(G_norme,1);
	nb_colonnes = size(G_norme,2);
	liste_decalages = [-1 -1 ; -1 0 ; -1 1 ; 0 -1 ; 0 1 ; 1 -1 ; 1 0 ; 1 1];
	liste_voisins = [];
	for k = 1:8
		i_voisin = i+liste_decalages(k,1);
		j_voisin = j+liste_decalages(k,2);
		if i_voisin>=1 & i_voisin<=nb_lignes & j_voisin>=1 & j_voisin<=nb_colonnes
			if contour_restant(i_voisin,j_voisin)
				liste_voisins = [liste_voisins ; i_voisin j_voisin];
			end
		end
	end

	k = 1;
	while k<=size(liste_voisins,1) & card_E<card_E_max
		i_voisin = liste_voisins(k,1);
		j_voisin = liste_voisins(k,2);
		if contour_restant(i_voisin,j_voisin)
			contour_restant(i_voisin,j_voisin) = 0;
			produit_scalaire = Gx(i,j)*Gx(i_voisin,j_voisin)+Gy(i,j)*Gy(i_voisin,j_voisin);
			if abs(produit_scalaire)> G_norme(i,j)*G_norme(i_voisin,j_voisin)* cos_alpha
				card_E = card_E+1;
				E(card_E,:) = [i_voisin j_voisin];
				[E,card_E,contour_restant] = recursion(E,card_E,contour_restant,i_voisin,j_voisin,Gx,Gy,G_norme,card_E_max,cos_alpha);
			end
		end
		k = k+1;
	end
end
