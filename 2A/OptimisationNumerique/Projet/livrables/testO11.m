clear all
[x, minF] = minAvecContraintes('more', @f1, @g1, @h1, @c1, @gc1, @mhc1, [0; 1; 1], 0)
