function test1
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751

fprintf("Test sprawdza dokładność obliczonych rozwiązań dla pewnych, " + ...
    "wybranych \nfunkcji dobrze określonych w danym obszarze, przy " + ...
    "wykorzystaniu \nwzględnie dużego parametru podziału (n = 2500)\n\n")

n = 2500;

f1 = @(x, y) cos(x).*cos(y);
f2 = @(x, y) y ./ (1 + x .* x);
f3 = @(x, y) x.*x + y.*y;
f4 = @(x, y) cos(x) - sin(x);
f5 = @(x, y) x .^ 16 .* y .^ 2;
f6 = @(x, y) exp(x) + exp(-y);

f1_exact = 2*sin(1);
f2_exact = 0;
f3_exact = 2/3;
f4_exact = 4 - 4*cos(1);
f5_exact = 1/14535;
f6_exact = -8 + 4/exp(1) + 4*exp(1);

fprintf("|          funkcja          |   S(f)   |    I(f)   | |S(f) - I(f)| |\n");
v = P1Z51_MWO_double_integral(f1, n);

fprintf("| f(x,y) = cos(x)*cos(y)    | %-7f | %-9f | %-13e |\n", f1_exact, v, abs(f1_exact - v));
v = P1Z51_MWO_double_integral(f2, n);
pause;
fprintf("| f(x,y) = y / (1 + x * x)  | %-7f | %-9f | %-13e |\n", f2_exact, v, abs(f2_exact - v));
v = P1Z51_MWO_double_integral(f3, n);
pause;
fprintf("| f(x,y) = x * x + y * y    | %-7f | %-9f | %-13e |\n", f3_exact, v, abs(f3_exact - v));
v = P1Z51_MWO_double_integral(f4, n);
pause;
fprintf("| f(x,y) = cos(x) - sin(x)  | %-7f | %-9f | %-13e |\n", f4_exact, v, abs(f4_exact - v));
v = P1Z51_MWO_double_integral(f5, n);
pause;
fprintf("| f(x,y) = x^16 * y^2       | %-7f | %-9f | %-13e |\n", f5_exact, v, abs(f5_exact - v));
v = P1Z51_MWO_double_integral(f6, n);
pause; 
fprintf("| f(x,y) = exp(x) + exp(-y) | %-7f | %-9f | %-13e |\n", f6_exact, v, abs(f6_exact - v));


end

