function ordonnees_notes = frequences_ordonnees(frequences_notes)

decalage_positif = [0.5 0.5 1 1 1.5 2 2 2.5 2.5 3 3 3.5];
decalage_negatif = [0 0.5 0.5 1 1 1.5 2 2 2.5 2.5 3 3.5];
ordonnees_notes = [];
for i = 1:length(frequences_notes)
	note = round(12*log(frequences_notes(i)/440)/log(2))+49;
	if note>=51
		% Si note est plus aigue que le si du milieu de la portee :
		ecart_note = note-51;
		ecart_note_divise_par_12 = floor(ecart_note/12);
		ecart_note_modulo_12 = mod(ecart_note,12);
		if ecart_note_modulo_12>0
			ordonnee_note = 4+3.5*ecart_note_divise_par_12+decalage_positif(ecart_note_modulo_12);
		else
			ordonnee_note = 4+3.5*ecart_note_divise_par_12;
		end
	else
		ecart_note = 51-note;
		ecart_note_divise_par_12 = floor(ecart_note/12);
		ecart_note_modulo_12 = mod(ecart_note,12);
		if ecart_note_modulo_12>0
			ordonnee_note = 4-3.5*ecart_note_divise_par_12-decalage_negatif(ecart_note_modulo_12);
		else
			ordonnee_note = 4-3.5*ecart_note_divise_par_12;
		end
	end
	ordonnees_notes = [ordonnees_notes ordonnee_note];
end

