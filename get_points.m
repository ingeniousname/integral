function [x, y, coeff] = get_points(n)

x = zeros(1, (n^2 - n) / 2);
y = zeros(1, (n^2 - n) / 2);
coeff = 6 * ones(1, (n^2 - n) / 2);
k = 1;
for i=1:n-1
    y(k:(k+n-i-1)) = i/n;
    x(k:(k+n-i-1)) = 1/n:1/n:(n-i)/n;
    k = k + n - i;
end
coeff((x+y) == 1) = 3;


end

