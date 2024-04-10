function [x, fx, ea, iter] = parainterpol(f, x1 ,x2, x3, es, maxit, varargin)
    
    if nargin < 4, error('at least 3 input arguments required'), end
    if nargin < 5 || isempty(es), es = 0.0001 ; end
    if nargin < 6 || isempty(maxit), maxit = 50 ; end

    f1 = f(x1, varargin{:}) ; f2 = f(x2, varargin{:}) ; 
    f3 = f(x3, varargin{:}) ; 

    iter = 1 ;
    while (1)    
        num = (f2-f3)*(x2-x1)^2 - (f2-f1)*(x2-x3)^2   ; 
        den = (f2-f3)*(x2-x1) - (f2-f1)*(x2-x3) ;
        x4 = x2 - 0.5*num/den ; f4 = f(x4, varargin{:}) ;
        
        if iter ~= 1, xopt_old = xopt ; end

        % Algorithm of the Parabolic interpolation
        if f4 < f2, xopt = x4 ; 
            if x4 < x2
                x3 = x2 ; x2 = x4 ; f3 = f2 ; f2 = f4 ;
            else
                x1 = x2 ; x2 = x4 ; f1 = f2 ; f2 = f4 ;
            end

        else, xopt = x2 ;
            if x4 < x2, x1 = x4 ; f1 = f4 ;
            else, x3 = x4 ; f3 = f4 ;end

        end
        
        % Calculate the Error and Break condition 
        if iter == 1, ea = 100 ;
        else
            if xopt ~= xopt_old, ea = abs((xopt-xopt_old)/xopt) * 100 ; end
        end
        if ea <= es || iter >= maxit, break
        else, iter = iter + 1 ; end
    end
    x = xopt; fx = f(xopt, varargin{:}) ;
end