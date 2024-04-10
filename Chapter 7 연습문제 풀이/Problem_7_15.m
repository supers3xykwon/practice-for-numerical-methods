clc ; clear ; close all
format long
%{
    Problem 7.15
%}
h = 0.5 ; w = 0.42 ; F = 10000 ;
E = 2e11 ; A = 1e-4 ; l = sqrt(h^2 + (w/2)^2) ;
k = E * A / l ;

PE = @(x, theta) 0.5*k*((sqrt((h+x(2))^2+(w/2 +x(1))^2)-l)^2 ...
                    + (sqrt((h+x(2))^2+(w/2 -x(1))^2)-l)^2) ...
                    - F*cos(theta)*x(1) - F*sin(theta)*x(2);
    
% (a) Contour 그리기
x = linspace(0.0, 0.5, 100) ; y = linspace(0.0, 0.5, 100) ; 
[X, Y] = meshgrid(x, y) ; phi = pi/3 ;
PEsur = 0.5*k*((sqrt((h+Y).^2+(w/2 +X).^2)-l).^2 ...
                    + (sqrt((h+Y).^2+(w/2 -X).^2)-l).^2) ...
                    - F*cos(phi)*X - F*sin(phi)*Y; 
figure('Position', [100, 100, 500, 400])
ce = contour(X, Y, PEsur); clabel(ce) ;
xlabel('x'), ylabel('y'), zlabel('PE')

% (b) Surface 그리기
figure('Position', [600, 100, 500, 400])
cs = surfc(X, Y, PEsur);
xlabel('x'), ylabel('y'), zlabel('PE')

% (c) theta에 따른 변위 플롯하기 1
theta = linspace(0, pi/2, 500) ;
x_f_mat = ones(3, length(theta)) ;
j = 1 ;
for i = theta
    [x, f] = fminsearch(@(x) PE(x, i), [-10.0, 10.0]) ;
    x_f_mat(1, j) = x(1) ; x_f_mat(2, j) = x(2) ;
    x_f_mat(3, j) = f ;
    j = j+1 ;
end
figure('Position', [100, 500, 500, 400])
scatter(x_f_mat(1,:), x_f_mat(2,:)), grid
xlabel('dis_x'), ylabel('dis_y')

% (d) theta에 따른 변위 플롯하기 2
dis = sqrt(x_f_mat(1, :).^2 + x_f_mat(2, :).^2) ;
figure('Position', [600, 500, 500, 400])
scatter(theta, dis), grid
xlabel('theta'), ylabel('dis')

% (e) theta에 따른 변위 플롯하기 3
figure('Position', [1100, 500, 500, 400])
polarplot(theta, dis)


%{
    등가 용수철 상수 k가 커질수록, 같은 힘이 가해졌을 때 displacement는 작아짐.
                                
                                   F = kx

    이 문제에서, k가 과하게 커질수록 displacement의 오차가 증가함이 관찰됨.
    k가 과하게 큰 경우 어느 위치에서나 변위가 0에 수렴함이 보임. 
    k값을 증가시킬수록 각 변위들 사이 차이가 없어지며 부드럽지 않은 그래프를 보이다가
    결국 모든 점이 0인 상수함수를 그리게 됨.
    신기하노... ㅋㅋㅋㅋ :) ('24.03.31)
%}