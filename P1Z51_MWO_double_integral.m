function I = P1Z51_MWO_double_integral(f, n)
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751
%
% Obliczanie całki podwójnej funkcji dwóch zmiennych f na obszarze 
% ograniczonym przez nierówność |x| + |y| <= 1, który zostanie podzielony
% na 4n^2 przystających trójkątów, a następnie na każdym z nich zostanie 
% zastosowana kwadratura 3 rzędu
% Wejście:
%       f - uchwyt do funkcji dwóch zmiennych, której całka ma zostać 
%       obliczona (zakładamy, że całka istnieje dla danej funkcji i ma 
%       skończoną wartość)
%       n - liczba naturalna, parametr podziału obszaru (obszar zostanie 
%       podzielony na 4n^2 przystających trójkątów), n >= 1
% Wyjście:
%       I - liczba rzeczywista, wartość liczbowa obliczonej całki

% początkowo inicjalizuję I na 0
I = 0;

% znajduję punkty, w których chcemy obliczyć wartości funkcji
[x,y,coeff] = get_edges(n);

% obliczam wartości funkcji w znalezionych punktach, przy czym korzystamy
% z symetrii położenia tych punktów względem osi współrzędnych i środka
% układu współrzędnych, następnie otrzymane wartości, przemnożone przez 
% współczynnik - ile razy dana wartość występuje w rozwiązaniu, sumuję
I = I + sum(f(x,y).*coeff);
I = I + sum(f(-x,y).*coeff);
I = I + sum(f(x,-y).*coeff);
I = I + sum(f(-x,-y).*coeff);

% obliczam i sumuję wartości funkcji w punktach na osiach układu
% współrzędnych, ponieważ funkcja get_edges dla uproszczenia je pomija 
I = I+2*sum(ones(1,2*n).*(f(0,(-1+1/(2*n)):1/n:(1-1/(2*n))) ...
    +f((-1+1/(2*n)):1/n:(1-1/(2*n)),0)));

% otrzymaną sumę dzielę przez stałą 3 (stała 
% w definicji metody) oraz przez pole jednego trójkąta (które wynosi 
% P = 1/(2*n^2))
I = I/(6*n*n);

end % function

