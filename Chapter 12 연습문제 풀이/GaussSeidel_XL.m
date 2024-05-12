function [x, ea_end, iter_end, A_dia] = GaussSeidel_XL(A_dia, b, x, L, es, maxit)

% GaussSeidel_X : calculate the solution vector by Gauss Seidel Method
%       [x, ea_end, iter_end] = GaussSeidel_XL(A, b, x, es, maxit)
% 
% Input:
%   A = coefficient matrix (square matrix)
%   b = Forcing vector (column vector)
%   x = Initial assumption solution vector (default = zero vector)
%   L = Lambda for relaxation. (0 < L <= 2, default = 1)
%   es = Stop critertion (default = 0.00001 %)
%   maxit = max iteration (default = 50)
%
% Output: 
%   x = solution vector (column vector)
%   ea_end = relative error in the final iteration
%   iter_end = end iteration
%   A_dia = diagonally dominant matrix
% 
% made by Cho HyeongKwon in JBNU at '24.04.17

    %% Error control
    [m, n] = size(A_dia) ; 
    if nargin < 2, error('at least 2 input arguments required'); end
    if nargin < 3 || isempty(x), x = zeros(m, 1) ; end
    if nargin < 4 || isempty(L), L = 1; end
    if nargin < 5 || isempty(es), es = 0.00001 ; end
    if nargin < 6 || isempty(maxit), maxit = 50 ;  end
    
    if m~=n, error('A must be a square matrix'); end
    
    [o, p] = size(b) ;
    if p~=1
        disp('X must be a single column vector'); 
        b = b' ; [o, ~] = size(b) ; 
    end
    
    [q, r] = size(x) ;
    if r~=1
        disp('X must be a column vector'); 
        x = x' ; [q, ~] = size(x) ; 
    end
    
    if m~=o, error('b vector and A matrix are not the same size'); end
    if m~=q, error('X vector and A matrix are not the same size'); end
    
    %% Pivoting for diagonally dominant
    for i = 1:m % Row indexing
        [big, j] = max(abs(A_dia(i,:))) ;   
        if j~=i 
            if abs(big) > sum(abs(A_dia(i,:))) - abs(big) 
                dump_A = A_dia(j, :) ; 
                A_dia(j, :) = A_dia(i, :) ; 
                A_dia(i, :) = dump_A ; 

                dump_b = b(j) ; b(j) = b(i) ; b(i) = dump_b ;
            end 
        end
    end

    %% Gauss seidel
    C = A_dia ; d = zeros(m, 1) ;
    for i = 1:n
        C(i, i) = 0 ;
        C(i, :) = C(i, :)/A_dia(i, i) ;
        d(i) = b(i)/A_dia(i, i) ;
    end

    iter = 0 ;
    ea = 100*ones(m, 1) ;
    while (1)
        xold = x ;
        
        for i = 1:n 
            y = d(i) - C(i,:)*x ; 
            x(i) = L*y + (1-L)*xold(i) ;
            
            if x(i)~=0
                ea(i) = abs( (x(i) - xold(i)) / x(i) ) * 100 ;
            end
        end

        iter = iter + 1;
        if max(ea) <= es || iter >= maxit, break, end
    end
    ea_end = ea ; iter_end = iter ;
end