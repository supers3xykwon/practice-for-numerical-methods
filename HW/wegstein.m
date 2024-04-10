function [x2, fx, ea, iter] = wegstein(gfunc, x0, x1, es, maxit, varargin)
    if nargin < 3, error('at least 4 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end
    
    iter = 0 ;
    while (1)
        x2 = (x1*gfunc(x0) - x0*gfunc(x1))/(x1 - x0 - gfunc(x1) + gfunc(x0)) ;
        if x2 ~= 0, ea = abs((x2-x1)/x2)*100 ; end
        if ea <= es || iter >= maxit, break, end
        iter = iter + 1 ; x0 = x1 ; x1 = x2  ;
    end
    fx = gfunc(x2) - x2 ;
end