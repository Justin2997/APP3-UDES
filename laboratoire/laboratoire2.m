% Generation
N= 95;
x1 = randn(1, N) + 3; x2 = randn(1, N) -1;

% Affichage
figure;
plot (x1, x2, "+");
title (sprintf("Serie de %d points generes", N));