function [x, y, coeff] = get_edges(n)
% Projekt 1, zadanie 51
% Miłosz Woźny, 320751
%
% Funkcja znajduje punkty, w których obliczane są wartości funkcji przy
% podziale obszaru |x| + |y| <= 1 na 4n^2 przystających trójkątów
% i zastosowanie na każdym z nich kwadratury 3 rzędu, konkretnie:
% S(f) = 1/3 * (f(p01) + f(p02) + f(p12)) (1)
% Dodatkowo dla każdego punktu funkcja znajduje odpowiednie współczynniki, 
% przez które muszą zostać przemnożone obliczone wartości tak, aby
% uwzględnić fakt, że wartości w pewnych punktach są sumowane
% wielokrotnie
% Wejście:
%       n - liczba naturalna, parametr podziału obszaru, n >= 1
% Wyjście:
%       x - wektor współrzędnych 'x' punktów
%       x - wektor współrzędnych 'y' punktów
%       x - wektor współczynników

% Kilka słów wyjaśnienia:
% Jeżeli podzielimy obszar |x| + |y| <= 1 na cztery trójkąty prostokątne,
% mające wspólny punkt w początku układu współrzędnych, możemy rozważyć
% jedynie ten trójkąt, dla którego x >= 0, y >= 0 i jego podział na n^2
% trójkątów przystających, taki, że wszystkie boki trójkątów są równoległe
% albo do jednej z osi układu współrzędnych, albo do prostej y = x. 
% Pozostałe trzy trójkąty są symetryczne względem rozważanego. Funkcja
% get_edges znajduje wszystkie punkty na środkach boków trójkątów, z
% wyjątkiem tych, które leżą na osiach współrzędnych, punktów tych jest
% dokładnie (3*n^2 - n) / 2, z czego każdy z nich:
% 1. leży na krawędzi ukośnej (równoległej do y = x)
% 2. leży na krawędzi poziomej
% 3. leży na krawędzi pionowej
% Te punkty są generowane w kolejnych segmentach kodu, i-ty punkt ma
% współrzędne (x(i), y(i)). Zauważmy, że punkty nie mają ustalonej
% kolejności, nie jest to konieczne, gdyż chcemy znać jedynie sumę wartości
% funkcji w tych punktach.

% Inicjuję wektory tak, aby miały odpowiednią długość
x = zeros(1,(3*n^2 - n)/2);
y = zeros(1,(3*n^2 - n)/2);
coeff = 2 * ones(1, (3*n^2 - n) / 2);

% Indeks, który pozwoli nam na dodawanie kolejno współrzędnych do wektora
k = 1;

% Dodaję do wektorów współrzędne punktów na krawędziach skośnych
for i=1:n
    y(k:(k+n-i)) = 1/(2*n)+(i-1)*1/n;
    x(k:(k+n-i)) = 1/(2*n):1/n:(1/(2*n)+(n-i)/n);
    k = k+n-i+1;
end

% Indeks wskazujący na pierwszy punkt poziomy, będzie potem przydatny
p = k;

% Dodaję do wektorów współrzędne punktów na krawędziach poziomych 
for i=1:(n-1)
    y(k:(k+n-i-1)) = i/n;
    x(k:(k+n-i-1)) = 1/(2*n):1/n:(1/(2*n)+(n-i-1)/n);
    k = k+n-i;
end

% Dodaję do wektorów współrzędne punktów na krawędziach pionowych,
% odbijając punkty na krawędziach poziomych względem prostej x=y, 
% korzystając z symetrii
x(k:length(x)) = y(p:(k-1));
y(k:length(y)) = x(p:(k-1));

% Szukam punktów leżących na prostej x=y i ustawiam dla nich współczynnik 
% równy 1, ponieważ leżą tylko na jednym trójkącie, więc ich wartość w
% sumie zostanie wykorzystana tylko raz, a dla pozostałych punktów,
% leżących na bokach dwóch trójkątów - dwa razy 
coeff(abs(x+y-1)<1e-12) = 1;

end % function

