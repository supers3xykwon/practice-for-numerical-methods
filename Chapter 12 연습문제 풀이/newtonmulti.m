function [x, func, ea, iter] = newtonmulti(f, J, x0, es, maxit, varargin)

% newtonmulti : Find the roots of nonlinear Algebraic equations by
%               Newton-Raphson methode
%   [x, func, ea, iter] = newtonmulti(f, J, x0, es, maxit, varargin)
% 
% Input:
%   f = function vector
%   J = Jacobian matrix
%   x0 = Initial assumption. 
%   es = Stop critertion (default = 0.000001 %)
%   maxit = max iteration (default = 50)
% 
% Output:
%   x = root vector
%   func = function value vector at Estimated roots
%   ea = approximate percent error vector
%   iter = a number of iteration
% 
% made by Cho HyeongKwon in JBNU at '24.04.22 

if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es = 0.000001 ; end
if nargin < 5 || isempty(maxit), maxit = 50 ; end

iter = 0 ; x = x0 ;
while (1)
    func = f(x, varargin{:}); Jmat = J(x, varargin{:}) ;
    dx = Jmat\func ;
    x = x - dx ;
    iter = iter + 1;
    ea = abs(dx./x) * 100 ;
    if iter >= maxit || max(ea) <= es, break, end
end
func = f(x, varargin{:}) ;
end