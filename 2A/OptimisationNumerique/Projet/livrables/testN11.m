clear all
[x, minF, err] = minSansContrainte('newton', @f1, @g1, @h1, [1; 0; 0], 10^-10)