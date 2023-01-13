% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2022

clc;
close all;

% Activate symbolic mathematics with t as independent variable
syms t;

% Define time-domain functions
f1 = sin(t); figure(); fplot(f1, 'LineWidth', 2); grid on;
f2 = cos(t); figure(); fplot(f2, 'LineWidth', 2); grid on;
f3 = exp(t); figure(); fplot(f3, 'LineWidth', 2); grid on;

% Compute Laplace transforms
F1 = laplace(f1); figure(); fplot(F1, 'LineWidth', 2); grid on;
F2 = laplace(f2); figure(); fplot(F2, 'LineWidth', 2); grid on;
F3 = laplace(f3); figure(); fplot(F3, 'LineWidth', 2); grid on;

% Verify convolution theorem 
f = sin(t-2);
figure();
fplot(f, 'LineWidth', 2); 
grid on;
