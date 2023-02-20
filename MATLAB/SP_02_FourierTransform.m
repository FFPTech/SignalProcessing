% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc; % clear screen
close all; % close all windows

% Activate symbolic mathematics with t as independent variable
syms w;

% Define frequency-domain signal
W = pi;
F = rectangularPulse(-W, W, w);
figure();
fplot(F, 'LineWidth', 2);
title('Fourier transform F[x(t)]');
xlabel('w');
ylabel('F(jw)');
grid on;

% Compute inverse Fourier transform
f = ifourier(F); % ifourer = inverse Fourier
figure();
fplot(f, 'LineWidth', 2);
title('Inverse Fourier Transform x(t) = F^{-1}[F(jw)]');
xlabel('t');
ylabel('f(t)');
grid on;

