function [root, fxr, Ea, ea, iter] = bisect_2(func, xl, xu, Ead, varargin)

    % error control
    if nargin < 4, error('at least 4 input arguments required.'), end
    test = func(xl, varargin{:})*func(xu, varargin{:}) ;
    if test > 0, error('no sign change.')
    elseif test == 0, error('you already know the answer.'), end

    n = ceil(log2((xu-xl)/Ead)) ; % Maximum iterations

    iter = 0 ; 
    while (1)
        % iteration renewal
        iter = iter + 1;
        
        % xr, xr_old, and ea renewal
        if iter == 1, xr = (xl + xu)/2 ; 
        else
            xr_old = xr ; xr = (xl + xu)/2 ;
            Ea = abs(xr-xr_old) ;
            ea = (Ea/xr) * 100 ;
        end
        
        % Determining termination
        if iter >= n , break, end
        
        % xl, xu renewal renewal
        test = func(xu, varargin{:})*func(xr, varargin{:}) ;
            if test < 0, xl = xr ;
            elseif test > 0, xu = xr ;
            end
    end

    root = xr ; fxr = func(xr, varargin{:}) ;
end
