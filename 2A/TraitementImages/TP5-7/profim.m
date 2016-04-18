%Trace le profil horizontal de la ligne de l'image designee par le curseur.
%On efface toute trace de marque anterieure.
clear;
lecshowtrimago;

disp('Designer une ligne dont on veut le prol avec le curseur') ;
[y, x] = ginput(1);
tempy = x*ones(ncol,1)';
tempv = 1:ncol;

%On efface toute trace de marque anterieure.
eval('delete(hl)', '');
if all(typeimage == 'IMON')
    hl = line(tempv,tempy, 'Color', 'g');
    %On efface toute trace de marque anterieure.
    eval('delete(hp)', '');
    hp = line(tempv, nlig*(1 - image(round(x), :)/256), 'Color', 'r');
else
    if all(typeimage == 'ITRI')
        hl = line(tempv, tempy, 'Color', 'w');
        %On efface toute trace de marque anterieure.
        eval('delete(hpr)', '');
        eval('delete(hpg)', '');
        eval('delete(hpb)', '');
        hpr = line(tempv, nlig*(1 - image(round(x), :,1)/256), 'Color', 'r');
        hpg = line(tempv, nlig*(1 - image(round(x), :,2)/256), 'Color', 'g');
        hpb = line(tempv, nlig*(1 - image(round(x), :,3)/256), 'Color', 'b');
    else
        disp('ERREUR') ;
    end
end