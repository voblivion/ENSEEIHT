open Menu_dico;;
open Manip_chaine;;
open Trie;;

let affiche_mot mot =
	print_string mot;
	print_newline ();;

gere_dico (decompose_chaine) (recompose_chaine) (read_line) (affiche_mot) (nouveau) (appartient) (ajout) (retrait) (affiche);;