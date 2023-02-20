% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Activate symbolic mathematics with t as independent variable
syms t;

% Define time-domain functions
x1 = sin(t); figure(); fplot(x1, 'LineWidth', 2); grid on;
title('Time-Domain Signal x_1(t)'); xlabel('t'); ylabel('sin(t)');
x2 = cos(t); figure(); fplot(x2, 'LineWidth', 2); grid on;
title('Time-Domain Signal x_2(t)'); xlabel('t'); ylabel('cos(t)');
x3 = exp(t); figure(); fplot(x3, 'LineWidth', 2); grid on;
title('Time-Domain Signal x_3(t)'); xlabel('t'); ylabel('exp(t)');

% Compute Laplace transforms
X1 = laplace(x1); figure(); fplot(X1, 'LineWidth', 2); grid on;
title('Laplace-Domain Signal X_1(t)'); xlabel('s'); ylabel('L[sin(t)]');
X2 = laplace(x2); figure(); fplot(X2, 'LineWidth', 2); grid on;
title('Laplace-Domain Signal X_2(t)'); xlabel('s'); ylabel('L[cos(t)]');
X3 = laplace(x3); figure(); fplot(X3, 'LineWidth', 2); grid on;
title('Laplace-Domain Signal X_3(t)'); xlabel('s'); ylabel('L[exp(t)]');

