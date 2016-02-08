clear all
[x, minF, err] = minSansContrainte('cauchy', @f2, @g2, @h2, [10; 0], 10^-10)
