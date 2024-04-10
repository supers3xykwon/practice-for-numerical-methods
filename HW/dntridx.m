function d = dntridx(func, x, n) ;
    %
    % d = dntridx(func, x, n)
    %   fine the n-th derivative of trigonometric function (only sin, or cos)
    %
    % Input:
    %   func = select sin or cos
    %   x = a value of domain
    %   n = n-th derivative. (default = 1)
    %
    % Output:
    %   d = the value of n-th order derivative function at x
    %
    % made by Cho hyeong kwon at '24.03.20

    if nargin < 2, error('at least 2 input arguments required'), end
    if nargin < 3, n = 1; end

    an = @(n) (i^(n)) * (1+(-1)^(n+2))/2 ; 
    bn = @(n) (i^(n+3)) * (1+(-1)^(n+1))/2 ; 
    cn = @(n) (i^n) * (1+(-1)^(n+2))/2 ; 
    dn = @(n) (i^(n+1)) * (1+(-1)^(n+1))/2 ;

    if func == 'sin', d = an(n)*sin(x) + bn(n)*cos(x) ;
    elseif func == 'cos', d = cn(n)*cos(x) + dn(n)*sin(x) ;
    else, error('We are preparing for another trigonometric function.')
    end
end
