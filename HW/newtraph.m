function [root, fx, ea, iter] = newtraph(func, dfunc, xr, es, maxit, varargin)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end
    
    iter = 0 ;
    while (1)
        xrold = xr ;
        xr = xr - func(xr)/dfunc(xr) ;
        if xr ~= 0, ea = abs((xr-xrold)/xr)*100 ; end
        if ea <= es || iter >= maxit, break, end
        iter = iter + 1 ;
    end
    root = xr ; fx = func(root) ;
end