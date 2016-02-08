clear all
[x, minF] = minAvecContraintes('more', @f2, @g2, @h2, @c2, @gc2, @mhc2, [1; 0], 0)
