function test2
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751


fprintf(['Test sprawdza dokładność rozwiązywania całki dla wielomianów ' ...
    '\nz bazy wielomianów rzędu <= 2, z parametrem n = 1, n = 4.\nCałka powinna być obliczona ' ...
    'dokładnie, \ngdyż do jej obliczenia stosujemy metodę trzeciego rzędu.\n' ...
    'Natomiast wynik całki z f(x,y) = |x^3| powinien być obarczony błędem.\n\n']);
f1 = @(x, y) 1;
f2 = @(x, y) x;
f3 = @(x, y) y;
f4 = @(x, y) x.*x;
f5 = @(x, y) y.*y;
f6 = @(x, y) x.*y;
f7 = @(x, y) abs(x.*x.*x);

f1_exact = 2;
f2_exact = 0;
f3_exact = 0;
f4_exact = 1/3;
f5_exact = 1/3;
f6_exact = 0;
f7_exact = 0.2;

for n=[1 4]
    fprintf("Dla n = %d:\n", n)

    fprintf("|    funkcja     |   S(f)   |    I(f)   | |S(f) - I(f)| |\n");
    v = P1Z51_MWO_double_integral(f1, n);

    fprintf("| f(x,y) = 1     | %-7f | %-9f | %-13e |\n", f1_exact, v, abs(f1_exact - v));
    pause;
    v = P1Z51_MWO_double_integral(f2, n);
    fprintf("| f(x,y) = x     | %-7f | %-9f | %-13e |\n", f2_exact, v, abs(f2_exact - v));
    v = P1Z51_MWO_double_integral(f3, n);
    pause;
    fprintf("| f(x,y) = y     | %-7f | %-9f | %-13e |\n", f3_exact, v, abs(f3_exact - v));
    v = P1Z51_MWO_double_integral(f4, n);
    pause;
    fprintf("| f(x,y) = x^2   | %-7f | %-9f | %-13e |\n", f4_exact, v, abs(f4_exact - v));
    v = P1Z51_MWO_double_integral(f5, n);
    pause;
    fprintf("| f(x,y) = y^2   | %-7f | %-9f | %-13e |\n", f5_exact, v, abs(f5_exact - v));
    v = P1Z51_MWO_double_integral(f6, n);
    pause;
    fprintf("| f(x,y) = xy    | %-7f | %-9f | %-13e |\n", f6_exact, v, abs(f6_exact - v));
    v = P1Z51_MWO_double_integral(f7, n);
    pause; 
    fprintf("| f(x,y) = |x^3| | %-7f | %-9f | %-13e |\n\n", f7_exact, v, abs(f7_exact - v));
end

end

