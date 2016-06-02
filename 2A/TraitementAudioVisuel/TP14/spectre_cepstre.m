function [coefficients_spectre,coefficients_cepstre] = spectre_cepstre(signal,nb_coefficients)
% Cette fonction calcule nb_coefficients coefficients spectraux et autant de coefficients cepstraux
% /mnt/n7fs/ens/tp_queau/Apprentissage
% Fenetre de Hamming :
taille_fenetre = 20*10^(-3)*44100;	% Nombre d'echantillons en 20 millisecondes
fenetre_Hamming = hamming(taille_fenetre);

% Decalage entre fenetres successives (egal a une demi-fenetre) :
decalage = floor(taille_fenetre/2);

% Calcul des coefficients (spectraux et cepstraux) :
longueur_signal = length(signal);
coefficients_spectre = [];
coefficients_cepstre = [];
for x = 1:decalage:longueur_signal-taille_fenetre+1
	signal_fenetre = transpose(signal(x:x+taille_fenetre-1).*fenetre_Hamming);
	spectre_fenetre = abs(fft(signal_fenetre, nb_coefficients));

	% Analyse spectrale :
	coefficients_spectre = [coefficients_spectre ; spectre_fenetre];

	% Analyse cepstrale :
	cepstre_fenetre = ifft(log(abs(fft(signal_fenetre, nb_coefficients))));
	coefficients_cepstre = [coefficients_cepstre ; cepstre_fenetre];
end
