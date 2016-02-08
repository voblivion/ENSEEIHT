clear all
[x, minF, err] = minSansContrainte('newton', @f1, @g1, @h1, [10; 3; -2.2], 10^-10)
