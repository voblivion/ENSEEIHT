clear all
[x, minF, err] = minSansContrainte('cauchy', @f2, @g2, @h2, [-1.2; 1], 10^-10)
