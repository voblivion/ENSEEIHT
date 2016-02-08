clear all
[x, minF] = minAvecContraintes('more', @f2, @g2, @h2, @c2, @gc2, @mhc2, [sqrt(3)/2; sqrt(3)/2], 0)
