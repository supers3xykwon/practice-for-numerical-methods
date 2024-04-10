function [root, fx, ea, iter] = bisect(func, xl, xu, es, maxit, varargin)

    % error control
    if nargin < 3, error('at least 3 input arguments required.'), end
    test = func(xl, varargin{:})*func(xu, varargin{:}) ;
    if test > 0, error('no sign change.')
    elseif test == 0, error('you already know the answer.'), end

    % arguments control
    if nargin < 4 || isempty(es), es = 0.00001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end

    iter = 0 ; xr = xl ; ea = 100 ; % 두 초기값을 가정함으로써 얻어지는 초기 근사값
    while (1)
        xrold = xr ; xr = (xl + xu)/2 ; % xr_old, xr renewal
        iter = iter + 1 ; % iteration renewal
        if xr ~= 0, ea = abs((xr-xrold)/xr) * 100 ; end
        test = func(xl, varargin{:})*func(xr, varargin{:}) ;
        if test < 0, xu = xr ;
        elseif test > 0, xl = xr ;
        else, ea = 0 ; 

        end
        if ea <= es || iter >= maxit, break, end 
    end
   
    root = xr ; fx = func(xr, varargin{:}) ;
end

    