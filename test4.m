function test4
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751

fprintf("Test sprawdza, jak zmienia się czas obliczeń wraz ze\n" + ...
    "wzrostem parametru podziału dla funkcji testowej\nf(x, y) = exp(x - y)." + ...
    "\nObliczenia trwają...\n");

g = @(x,y) exp(x - y);

n=1:5:1000;
k = 1;

res = zeros(1, length(n));
for i=n
    
    tic;
    P1Z51_MWO_double_integral(g, i);
    t = toc;
    res(k) = t;
    k = k + 1;
end

fprintf("Obliczenia zakończone, naciśnij przycisk, aby wyświetlić wykres\n");
pause;
hold on
plot(n, res);
xlabel('n');
ylabel('t, s');
title('Czas działania funkcji w zależności od parametru podziału')

end

