clear all
[x, minF, err] = minSansContrainte('more', @f2, @g2, @h2, [0; 1/200 + 10^-12], 10^-10)
