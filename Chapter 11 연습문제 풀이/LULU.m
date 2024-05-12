function [L, U, P] = LULU(A)

% LU decomposition function
%   [L, U] = LULU(A)  
%           or
%   [L, U, P] = LULU(A) 
%
% Input:
%   A = It can be any matrix
% 
% Output:
%   L = Lower triangular matrix
%   U = Upper triangular matrix
%   P = Permutation matrix
% 
% made by Cho HyeongKwon in JBNU at '24.04.15

    [m, n] = size(A) ;
    L = ones(m, n) ; L = tril(L) ; P = eye(m, n) ;

    for k = 1 : n-1         % select the pivot row
        % partial pivoting
        [~, i] = max(abs(A(k:m, k))) ;
        ipr = i + (k-1) ; % index calibration
        if ipr ~= k 
            A([k, ipr], :) = A([ipr, k], :) ; 
            P([k, ipr], :) = P([ipr, k], :) ;
            L([k, ipr], 1:k-1) = L([ipr, k], 1:k-1) ;
        end

        for i = k+1 : n     % elimination 
            factor = A(i, k)/A(k, k) ;
            A(i, k:n) = A(i, k:n) - factor * A(k, k:n) ;    
            L(i, k) = factor ; U = A ;
        end
    end

end