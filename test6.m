function test6
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751

fprintf("Test estymuje parametr p na podstawie równania\n" + ...
    "|S(f) - I(f)| = O(n^-p) dla dwóch funkcji oraz \n" + ...
    "dla n będących kolejnymi potęgami 2. Wyprowadzony wzór ma postać:\n" + ...
    "p = -log2(e_2k/e_k)\n" + ...
    "gdzie e_k - bezwzględny błąd przybliżenia dla n = k.\n" + ...
    "Parametr powinien wynieść 4.\n\n")

result_exact1 = 4 - 4*cos(1);
g1 = @(x,y) cos(x) - sin(x);
result_exact2 = exp(1) - 1/exp(1);
g2 = @(x,y) exp(x + y);

n = pow2(0:11);
k = 1; 
res = zeros(1, length(n));
for i=n
    res(k) = abs(P1Z51_MWO_double_integral(g1, i) - result_exact1);
    k = k + 1;
end
fprintf("f(x,y) = cos(x) - sin(x)\n")
fprintf("|   k   | przybliżenie p |\n")
pause;
for i = 2:12
    fprintf("| %5d | %14f |\n", n(i-1), -log2(res(i)/res(i-1)));
    pause(0.2);
end

k = 1; 
res = zeros(1, length(n));
for i=n
    res(k) = abs(P1Z51_MWO_double_integral(g2, i) - result_exact2);
    k = k + 1;
end
fprintf("\nf(x,y) = exp(x + y)\n")
fprintf("|   k   | przybliżenie p |\n")
pause;
for i = 2:12
    fprintf("| %5d | %14f |\n", n(i-1), -log2(res(i)/res(i-1)));
    pause(0.2);
end


