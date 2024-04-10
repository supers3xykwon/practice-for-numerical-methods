clc ; clear ; close all

func = @(x) x^3 - 6*x^2 + 11*x - 6.1 ; dfunc = @(x) 3*x^2 - 12*x + 11 ;
gfunc = @(x) x^3 - 6*x^2 + 12*x - 6.1 ;

% (a) Graph
x_vec = 0.5:0.001:3.5 ; f_vec = ones(1, length(x_vec)) ; j = 1 ;
for i = x_vec, f_vec(j) = func(i); j = j+1 ; end
figure
plot(x_vec, f_vec, 'LineWidth', 3, 'DisplayName', 'Curve'), grid on
title('Curve: f(x) = x^3 - 6x^2 + 11x - 6.1'), xlabel('x'), ylabel('f(x)')

format short
% (b) Newton-Rapshon Method
[root_NR, fx_NR, ea_NR, iter_NR] = newtraph(func, dfunc, 3.5, 0.001, 3) ;
disp('     root     f(root)     ε_a   iteration (Newton Raphson Method)')
disp([root_NR, fx_NR, ea_NR, iter_NR])

% (c) Secent Method
[root_Se, fx_Se, ea_Se, iter_Se] = Secent(func, 2.5, 3.5, 0.001, 3) ;
disp('     root     f(root)     ε_a   iteration (Secent Method)')
disp([root_Se, fx_Se, ea_Se, iter_Se])

% (d) Modified Secent Method
[x2_MS, fx_MS, ea_MS, iter_MS] = ModifiedSecent(func, 3.5, 0.01, 0.001, 3) ;
disp('     root     f(root)     ε_a   iteration (Modified Secent Method)')
disp([x2_MS, fx_MS, ea_MS, iter_MS])

% (번외) Wegstein Method
[x2_we, fx_we, ea_we, iter_we] = wegstein(gfunc, 2.5, 3.5, 0.001, 3) ;
disp('     root     f(root)     ε_a   iteration (Wegstein Method)')
disp([x2_we, fx_we, ea_we, iter_we])

% roots function
C = [1 -6 11 -6.1] ;  % Coefficients vector 
r = roots(C) ;
disp('     all the roots of this curve : ') ; disp (r')

% Comparing the results
figure
plot(x_vec, f_vec, 'LineWidth', 3, 'DisplayName', 'Curve'), grid on, hold on
scatter(root_NR, fx_NR,'LineWidth', 5, 'DisplayName', 'Newton Raphson', ...
          'MarkerFaceAlpha',.01', 'Marker','*') ;
scatter(root_Se, fx_Se,'LineWidth', 5, 'DisplayName', 'Secent', ...
          'MarkerFaceAlpha',.01, 'Marker','*') ;
scatter(x2_MS, fx_MS,'LineWidth', 5, 'DisplayName', 'Modified Secent', ...
          'MarkerFaceAlpha',.01, 'Marker','*') ;
scatter(x2_we, fx_we,'LineWidth', 5, 'DisplayName', 'Wegstein', ...
          'MarkerFaceAlpha',.01, 'Marker','*') ;
alpha(.5)
xlim([3.05-0.05, 3.05+0.05]), xlabel('x'), ylabel('f(x)')
title('Curve: f(x) = x^3 - 6x^2 + 11x - 6.1 (Enlarged)')
legend('boxoff'), legend('Location', 'northwest')
hold off