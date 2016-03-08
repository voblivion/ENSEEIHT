1. Compiler et utiliser le programme de test

	Utiliser la commande 'gnatmake test_huffman.adb' pour compiler le programme de test.
	Ensuite executer le fichier executable nouvellement créé en tapant './test_huffman'.
	Suivez alors les instructions à l'écran pour utiliser le programme de test.

2. Utiliser le package d'encodage de Huffman 'p_encodage_huffman'

	Le package d'encodage de Huffman 'p_encodage_huffman' peut être utilisé par n'importe
	quel autre programme mais étant générique il faut penser à en créer une instance
	en informant toutes les informations génériques requises.
	Plus particulièrement :
		- T_Binaire doit être un type binaire de préférence
		- T_Mot_Binaire doit être une structure de stockage (Tableau, Liste) d'éléments
		de type T_Binaire.

3. Complexité de la structure de stockage 'p_super_liste'

	Le package 'p_super_liste' - fourni en tant que structure de stockage - est 
	particulièrement adapté au codage de Huffman puisque les primitives de ce premier que
	'p_encodage_huffman' utilise sont toutes en temps constant. Pour plus d'informations
	concernant la compléxité de ces primitives, lire le fichier 'p_super_liste.readme'.