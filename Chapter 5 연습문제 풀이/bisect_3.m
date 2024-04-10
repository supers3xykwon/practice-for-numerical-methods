function [xr, fxr, Ea, ea, iter] = bisect_3(func, xl, xu, Ead, varargin)

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
        if iter == 1, xr(iter) = (xl + xu)/2 ; 
        else
            xr(iter) = (xl + xu)/2 ;
            Ea = abs(xr(iter)-xr(iter-1)) ;
            ea = (Ea/xr(iter)) * 100 ;
        end
        
        % Determining termination
        if iter >= n , break, end
        
        % xl, xu renewal renewal
        test = func(xl, varargin{:}) * func(xr(iter), varargin{:}) ;
            if test < 0, xu = xr(iter) ;
            elseif test > 0, xl = xr(iter) ;
            end
    end

    fxr = func(xr(iter), varargin{:}) ;
end
