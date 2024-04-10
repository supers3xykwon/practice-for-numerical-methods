function [x, D] = GaussPivot(A, b)
    
    [m, n] = size(A) ;
    if m~=n , error('Matrix A must be square.') ; end
    
    Aug = [A b] ; % Augmented Matrix of the linear systme A
    n_Aug = n + 1;
    
    % forward elimination
    for k = 1 : n-1         % select the pivot row

        % partial pivoting
        [big, i] = max(abs(Aug(k:n, k))) ;
        ipr = i + (k-1) ; % index calibration
        cnt = 1 ;
        if ipr ~= k, Aug([k, ipr], :) = Aug([ipr, k], :) ; cnt = cnt+1; end

        for i = k+1 : n     % elimination
            factor = Aug(i, k) / Aug(k, k) ;
            Aug(i, k:n_Aug) = Aug(i, k:n_Aug) - factor*Aug(k, k:n_Aug) ;
        end
    end
    
    % determinate 
    D = 1 ; for i = 1:n, D = D*Aug(i, i) ; end
    D = D*(-1)^cnt ;

    % back substitution
    x = zeros(n, 1) ;
    x(n) = Aug(n, n_Aug) / Aug(n, n) ;
    
    for i = n-1 : -1 : 1
        x(i) = ( Aug(i, n_Aug) - Aug(i, i+1:n)*x(i+1:n) ) / Aug(i, i) ;
    end
end