function x = Tridiag(e, f, g, r)
    n = length(f) ; % 대각행렬의 길이
    
    % forward elimiantion
    for k = 2:n
        factor = e(k)/f(k-1) ;
        f(k) = f(k) - factor*g(k-1) ;
        r(k) = r(k) - factor*r(k-1) ;
    end

    % back substitution
    x(n) = r(n)/f(k-1) ;
    for k = n-1 : -1 : 1, x(k) = ( ( r(k)-g(k)*x(k+1) ) ) / f(k) ; end
end