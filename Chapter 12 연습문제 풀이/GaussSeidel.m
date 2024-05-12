function x = GaussSeidel(A, b, es, maxit)

% GaussSeidel : calculate the solution vector by Gauss Seidel Method
%   x = GaussSeidel(A, b, es, maxit)
% 
% Input:
%   A = coefficient matrix (square matrix)
%   b = Forcing vector (column vector)
%   es = Stop critertion (default = 0.00001 %)
%   maxit = max iteration (default = 50)
%
% Output: 
%   x = solution vector (column vector)
% 
% made by Cho HyeongKwon in JBNU at '24.04.17

if nargin < 2, error('at least 2 input arguments required'); end
if nargin < 3 || isempty(es), es = 0.00001, end
if nargin < 4 || isempty(maxit), maxit = 50, end
[m, n] = size(A) ;
if m~=n, error('A must be a square matrix'); end

C = A ; 
for i = 1:n, C(i, i) = 0 ; x(i) = 0 ; end % 초기값 모두 0으로 가정.
%{
    git test
%}
end