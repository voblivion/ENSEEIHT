

ma = 0;

for VAP_pensees = 0:0.05:1
    for VAP_oeillets = 0:0.05:(1-VAP_pensees)
        exercice_4;
        if cpt_images_correctement_classees > ma
            mp = VAP_pensees;
            mo = VAP_oeillets;
            ma = cpt_images_correctement_classees;
        end
    end
end