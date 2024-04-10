function [x2, fx, ea, iter] = Secent(func, x0, x1, es, maxit, varargin)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end
    
    iter = 0 ;
    while (1)
        x2 = x1 - func(x1)*(x0-x1)/(func(x0) - func(x1)) ;
        if x2 ~= 0, ea = abs((x2-x1)/x2)*100 ; end
        if ea <= es || iter >= maxit, break, end
        iter = iter + 1 ; x0 = x1 ; x1 = x2  ;
    end
    fx = func(x2) ;
end