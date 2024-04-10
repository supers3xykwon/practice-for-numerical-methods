function [root, fx, ea, iter] = falposition(func, xl, xu, es, maxit, varargin)

    % error control
    if nargin < 3, error('at least 3 input arguments required.'), end
    test = func(xl, varargin{:})*func(xu, varargin{:}) ;
    if test > 0, error('no sign change.')
    elseif test == 0, error('you already know the answer.'), end

    % arguments control
    if nargin < 4 || isempty(es), es = 0.00001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end

    % False position algorithm
    iter = 0 ; xr = xl ; ea = 100 ; 
    while (1)
        iter = iter + 1; % iteration renewal
        % xr, xr_old, and ea renewal
        fl = func(xl, varargin{:}) ; fu = func(xu, varargin{:}) ; 
        xr_old = xr ; xr = xu - fu*(xl-xu)/(fl - fu);
        if xr ~= 0, ea = abs((xr-xr_old)/xr) * 100 ; end

        % Determining termination
        if ea <= es || iter >= maxit, break, end
        
        % xl, xu renewal renewal
        test = func(xl, varargin{:})*func(xr, varargin{:}) ;
        if test < 0, xu = xr ;
        elseif test > 0, xl = xr ;
        else, ea = 0 ;
        end
    end
    root = xr ; fx = func(xr, varargin{:}) ;
end

    