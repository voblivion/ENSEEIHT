%test
m = 2;

L = ['LL1'; 'LL2'; 'LR1'; 'LR2']
R = ['RL1'; 'RL2'; 'RR1'; 'RR2']
i = 2;
Points = [];
for k = 1:i
    t = 1+(k-1)*m:k*m
    l = L(t,:)
    r = R(t,:)
    Points = [Points; l; r];
end

L = [repmat(['L'], 8, 1) Points]
R = [repmat(['R'], 8, 1) Points]
i = 3;
Points = [];
for k = 1:i
    t = 1+(k-1)*m:k*m
    l = L(t,:)
    r = R(t,:)
    Points = [Points; l; r];
end


Points