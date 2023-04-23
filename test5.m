function test5
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751

fprintf("Test sprawdza zachowanie funkcji, gdy całka z podanej do niej " + ...
    "funkcji\njest rozbieżna. Badać będziemy na przykładzie dwóch funkcji:" + ...
    "\nf(x,y) = 1 / (x^2 + y^2), D = R^2 \\ {(0,0)},\n" + ...
    "g(x,y) = exp(1 / (x^2 + y^2)), D = R^2 \\ {(0,0)},\n" + ...
    "dla n będącymi kolejnymi potęgami dwójki.\nZauważmy, że przy wybranej " + ...
    "metodzie nie obliczamy wartości\nfunkcji w punkcie (0,0).\n\n")

g1 = @(x,y) 1 ./ (x .* x + y .* y);
g2 = @(x, y) exp(1 ./ (x .* x + y .* y));
n = pow2(0:12);
pause;
fprintf("f(x, y) = 1 / (x^2 + y^2)\n");
for i=n
    v = P1Z51_MWO_double_integral(g1, i);
    fprintf("| n = %4d | S(f) = %10f |\n", i, v);
    pause(0.3);

end
pause;
fprintf("\ng(x, y) = exp(1 / (x^2 + y^2))\n");
for i=n
    v = P1Z51_MWO_double_integral(g2, i);
    fprintf("| n = %4d | S(f) = %13e |\n", i, v);
    pause(0.3);

end


end
