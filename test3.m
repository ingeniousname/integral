function test3
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751

fprintf("Test sprawdza, jak zmienia się dokładność obliczeń wraz ze " + ...
 "wzrostem\nparametru podziału dla funkcji testowych\n" + ...
 "f(x,y) = cos(x) - sin(x)\nf(x,y) = exp(x + y).\nTest rysuje wyniki" + ...
 " na wykresie oraz dla porównania rysuje wykres" + ...
 "\nteoretycznej zależności 1/n^4.\n");

result_exact1 = 4 - 4*cos(1);
g1 = @(x,y) cos(x) - sin(x);
result_exact2 = exp(1) - 1/exp(1);
g2 = @(x,y) exp(x + y);
n = 1:4:500;
k = 1; 
resg1 = zeros(1, length(n));
resg2 = zeros(1, length(n));
for i=n
    resg1(k) = abs(P1Z51_MWO_double_integral(g1, i) - result_exact1);
    resg2(k) = abs(P1Z51_MWO_double_integral(g2, i) - result_exact2);
    k = k + 1;
end

semilogy(n, resg1);
hold on;
semilogy(n, resg2);
semilogy(n, n .^ -4);
xlabel('n');
ylabel('|S(f) - I(f)|')
title('Wykres błędu całki w zależności od parametru podziału')
legend("f(x,y) = cos(x) - sin(x)", "f(x,y) = exp(x + y)", ...
    "funkcja f(n) = 1 / n^4");


end

