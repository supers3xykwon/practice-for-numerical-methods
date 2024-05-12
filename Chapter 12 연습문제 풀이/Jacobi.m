function [x, ea_end, iter_end, A_dig] = Jacobi(A, b, x, es, maxit)

% Jacobi : calculate the solution vector by Jacobi Method
%       [x, ea_end, iter_end, A_dig] = Jacobi(A, b, x, es, maxit)
% 
% Input:
%   A = coefficient matrix (square matrix)
%   b = Forcing vector (column vector)
%   x = Initial assumption solution vector (default = zero vector)
%   es = Stop critertion (default = 0.00001 %)
%   maxit = max iteration (default = 50)
%
% Output: 
%   x = solution vector (column vector)
%   ea_end = relative error in the final iteration
%   iter_end = end iteration
%   A = diagonally dominant matrix
% 
% made by Cho HyeongKwon in JBNU at '24.04.17

    %% Error control
    [m, n] = size(A) ; 
    if nargin < 2, error('at least 2 input arguments required'); end
    if nargin < 3 || isempty(x), x = zeros(m, 1) ; end
    if nargin < 4 || isempty(es), es = 0.00001 ; end
    if nargin < 5 || isempty(maxit), maxit = 50 ; end
    if m~=n, error('A must be a square matrix'); end
    [o, p] = size(b) ;
    if p~=1
        disp('X must be a single column vector'); b = b' ; [o, ~] = size(b) ; 
    end
    [q, r] = size(x) ;
    if r~=1
        disp('X must be a column vector'); x = x' ; [q, ~] = size(x) ; 
    end
    if m~=o, error('b vector and A matrix are not the same size'); end
    if m~=q, error('X vector and A matrix are not the same size'); end
    
    %% Pivoting for diagonally dominant
    for i = 1:m % Row indexing
        [big, j] = max(abs(A(i,:))) ;   
        if j~=i 
            if abs(big) > sum(abs(A(i,:))) - abs(big) 
                dump_A = A(j, :) ; 
                A(j, :) = A(i, :) ; 
                A(i, :) = dump_A ; 

                dump_b = b(j) ; b(j) = b(i) ; b(i) = dump_b ;
            end 
        end
    end

    %% Gauss seidel
    C = A ; 
    for i = 1:n, C(i, i) = 0; end
    
    d = zeros(m, 1) ;
    for i = 1:n
        C(i, :) = C(i, :)/A(i, i) ; 
        d(i) = b(i)/A(i, i) ;
    end

    iter = 0 ;
    ea = 100*ones(m, 1) ;
    xnew = zeros(m, 1) ;
    while (1)
        for i = 1:n 
            xnew(i) = d(i) - C(i,:)*x ; 
            if xnew(i)~=0
                ea(i) = abs( (xnew(i) - x(i)) / xnew(i) ) * 100 ;
            end
        end
        iter = iter + 1;
        x = xnew ;
        if max(ea) < es || iter >= maxit, break, end
    end
    ea_end = ea ; iter_end = iter ; A_dig = A ;
end