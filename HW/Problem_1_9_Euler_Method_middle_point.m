
%{
    Problem 1.9 : Euler Method Practice

    Euler method: f(t+dt) = f(t) + f'(t)*dt
    Modified Euler Method: f(t+dt) = f(t) + f'(t+dt/2)*dt
    
    differential equation
            dy/dt = Q/A*(3*sin^2(t)-1)
    -> y(t+dt) = y(t) + Q/A*(3*sin^2(t+dt/2)-1)*dt ; Modified Euler Method
                                                   
    analytical solution: y = Q/A * (t/2 - 3/4 * sin(2*t))
%}

clc ; clear ; close all

%% Euler method Process

% define parameters
Q = 450  ; % m^3/d
A = 1250 ; % m^2

% define time and time step
t_i = 0.0; t_f = 10.0 ;
NTS = 21 ;                   % the number of timestep
t = linspace(t_i, t_f, NTS) ;
dt = (t_f - t_i) / (NTS - 1) ;
y = zeros(1, NTS) ; 

% Euler method by MATLAB
idx = 1 ;
for i = t
    if  i == t_i
        y(idx) = 0;
    end
    ROC(idx) = Q/A * (3*sin(i+0.25)^2 - 1) ; 
    y(idx + 1) = y(idx) +ROC(idx) * dt ;
    idx = idx + 1 ;
end

%% Analytical solution
Ana_sol = Q/A * (t./2 - 3/4 * sin(2.*t)) ;

%% Postprocessing
monitoring_matrix = [t ; ROC ; y(1:NTS) ; Ana_sol]  ;

Error_matrix = zeros(2, NTS) ;
Error_matrix(1, :) = abs((y(1:NTS) - Ana_sol)./Ana_sol * 100) ;
Error_matrix(:, 1) = 0 ;
%% Plotting

% Level
figure
hold on
plot(t, y(1:NTS), 'd-', 'DisplayName', 'Euler Method (Matlab)', ...
    'LineWidth', 1.5)

plot(t,  Q/A * (t./2 - 3/4 * sin(2.*t)), 's-', ...
    'DisplayName', 'Analytical solution', 'LineWidth', 1.5)
hold off

legend('FontSize', 12, 'Location', 'northwest')
xlabel('time [d]', 'Fontsize', 15)
ylabel('level [m]', 'Fontsize', 15)

% Percent Error
figure

plot(t, Error_matrix(1, :), 'd-', 'DisplayName', 'Euler Method (Matlab)', ...
    'LineWidth', 1.5)

legend('FontSize', 12, 'Location', 'northeast')
xlabel('time [d]', 'Fontsize', 15)
ylabel('Percent error [%]', 'Fontsize', 15)

% Superposition
figure
yyaxis left % Level
hold on
plot(t, y(1:NTS), 'd-', 'DisplayName', 'Euler Method (Matlab)', ...
    'LineWidth', 1.5)

plot(t,  Q/A * (t./2 - 3/4 * sin(2.*t)), 's-', ...
    'DisplayName', 'Analytical solution', 'LineWidth', 1.5)
hold off

ylabel('level [m]', 'Fontsize', 15)

yyaxis right % Percent Error

plot(t, Error_matrix(1, :), 'd-', 'DisplayName', 'Euler Method (Matlab)', ...
    'LineWidth', 1.5)

xlabel('time [d]', 'Fontsize', 15)
ylabel('Percent error [%]', 'Fontsize', 15)

legend('FontSize', 10, 'Location', 'best')
