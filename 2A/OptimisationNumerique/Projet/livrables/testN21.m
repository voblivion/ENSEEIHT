clear all
[x, minF, err] = minSansContrainte('newton', @f2, @g2, @h2, [-1.2; 1], 10^-10)
