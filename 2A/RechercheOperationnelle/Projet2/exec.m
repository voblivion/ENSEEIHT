disp('Duopole de Cournot');
disp('Stratégies possibles : cooperatif/noncooperatif/stackelberg');
NBJ=input('Nombre de parties: ');
nomx=input('Stratégie du 1er joueur: ','s');
nomy=input('Stratégie du second joueur: ','s');
fprintf('\n');
[tx, ty, gx, gy] = jeu(NBJ,nomx,nomy);
fig = afficher(tx,ty,gx,gy,nomx,nomy);
fprintf('%s: %.2f; %s: %.2f\n', nomx, round(sum(gx), 2), nomy, round(sum(gy), 2));
