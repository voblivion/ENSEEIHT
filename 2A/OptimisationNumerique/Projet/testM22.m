clear all
[x, minF, err] = minSansContrainte('more', @f2, @g2, @h2, [10; 0], 10^-10)
