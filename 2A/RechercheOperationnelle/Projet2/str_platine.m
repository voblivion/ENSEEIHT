                                             
            
function x = strategiePlatine(numpart,tx,ty,gx,gy)             
            
%% Usage             
            
%    x = strategie(nx,ny,ng,tx,ty,gx,gy)             
            
%             
            
%% Description             
            
% Stratégie du groupe 'platine' (Sophia, Emerick, Thomas, Philippe, Joseph,             
            
% Nathan).             
            
% Elle repose sur la prédiction du coup adverse et la comparaison de la             
            
% stratégie de l'adversaire avec des stratégies typiques.             
            
%% Inputs             
            
% tx     tableau des strategies jouees par le joueur x             
            
% ty     tableau des strategies jouees par le joueur y (l'adversaire)             
            
% gx     tableau des gains du joueur x             
            
% gy     tableau des gains du joueur y (l'adversaire)             
            
%             
            
%% Outputs             
            
% x      strategie elaboree par le joueur x             
            

            
%% Point d'entrée de la stratégie :             
            
% si c'est le premier tour, on joue un coup empiriquement intéressant             
            
% sinon on lance la stratégie à proprement parler             

if numpart == 1             
            
    x = 0.75;             
            
else             
            
    x = strategie(numpart, tx, ty, gx, gy);             
            
end             
            
end             
            

            
%% LA STRATEGIE PLATINE             
            
function x = strategie(numpart, tx, ty, gx, gy)             
            

            
%% 1. Enumérer les stratégies à comparer             
            
% l'ensemble des stratégies             
            
strategies = {'cooperatif',...             
            
              'noncooperatif',...             
            
              'stackelberg'};             
            
% certaine stratégie peuvent être paramétré. Il faudrait dans ce cas             
            
% essayer d'estimer ces paramètres par regression linéaire etc.. Nous             
            
% n'avons cependant pas fait de comparaison avec des stratégies paramétrés             
            
% finalement.             
            
param = {[],...             
            
         [],...             
            
         []};             
            

            
% nombre de stratégie             
            
num_strategies = size(strategies,2);             
            

            
%% 2. Simuler des parties             
            
% On simule nos coups contre les différentes stratégies énumérés et on             
            
% stocke les ty qui en résulte dans all_ty_simulated             
            
all_ty_simulated = zeros(num_strategies, numpart-1);             
            

            
tx_simulated=zeros(1,numpart-1);             
            
ty_simulated=zeros(1,numpart-1);             
            
gx_simulated=zeros(1,numpart-1);             
            
gy_simulated=zeros(1,numpart-1);             
            
for i =1:num_strategies             
            
    tx_simulated(1) = tx(1);             
            
    ty_simulated(1) = feval(strategies{i},1,param{i}, ty_simulated,tx_simulated,gy_simulated,gx_simulated);             
            
    [gx_simulated(1),gy_simulated(1)] = gain(tx_simulated(1),ty_simulated(1));             
            

            
    for j = 2:numpart-1             
            
        tx_simulated(j) = tx(j);             
            
        ty_simulated(j) = feval(strategies{i},j,param{i},ty_simulated,tx_simulated,gy_simulated,gx_simulated) ;             
            
        [gx_simulated(j),gy_simulated(j)] = gain(tx_simulated(j),ty_simulated(j));             
            
    end             
            

            
    all_ty_simulated(i,:) = ty_simulated;             
            
end             
            

            
%% 3. Chercher la stratégie la plus probable             
            
% On cherche la stratégie qui a une 'distance' minimale à celle de             
            
% l'adversaire             
            
min_diff = 60000;             
            
best_strategie_id = 1;             
            
for i = 1:num_strategies             
            
   dist = norm(all_ty_simulated(i,:)-ty(1:numpart-1));             
            
   if dist < min_diff             
            
       min_diff = dist;             
            
       best_strategie_id = i;             
            
   end             
            
end             
            
best_strategie = strategies{best_strategie_id};             
            
best_param = param{best_strategie_id};             
            

            
%% 4. Interpréter             
            
% on joue en conséquence de la stratégie la plus proche             
            
switch best_strategie             
            
    case 'cooperatif' % on joue du cooperatif             
            
        x = 0.75;             
            
    case 'noncooperatif' % on joue du stackelberg             
            
        x = 2 - feval(best_strategie, numpart, best_param, tx, ty, gx, gy)*2/3;             
            
    case 'stackelberg' % on joue du contre-stackelberg             
            
        x = 9/4 - feval(best_strategie, numpart, best_param, tx, ty, gx, gy)*3/4;             
            
    otherwise % on joue du stackelberg             
            
        x = 2 - feval(best_strategie, numpart, best_param, tx, ty, gx, gy)*2/3;             
            
end             
            
end             
            

            
%% STRATEGIE EXPLOITE             
            
% Ces stratégies sont comparés à celle du joueur adverse             
            
% Elles sont supposés suffisamment commune pour qu'il soit             
            
% logique de penser que l'adversaire joue une stratégie proche.             
            
function x = cooperatif(numpart, param, tx, ty, gx, gy)             
            
x = 0.75;             
            
end             
            

            
function x = noncooperatif(numpart, param, tx, ty, gx, gy)             
            
if (numpart == 1)             
            
x = 0.75;             
            
else             
            
x = (3-ty(numpart-1))/2;             
            
end             
            
end             
            

            
function x = stackelberg(numpart, param, tx, ty, gx, gy)             
            
if (numpart == 1)             
            
x = 0.75;             
            
else             
            
x = 2*(3-ty(numpart-1))/3;             
            
end             
            
end             
        