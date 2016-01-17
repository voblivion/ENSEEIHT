
[tx, ty, gx, gy] = jeu(NBJ,strax,stray);
fig = afficher(tx,ty,gx,gy,strax,stray);
fprintf('%s - %s\n', strax, stray);
fprintf('%f - %f\n', sum(gx), sum(gy));