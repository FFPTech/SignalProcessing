% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Parameters
N = 100; % samples

% Create signal
T = pi; % period
n = 5.*linspace(0, T, N);
x = sin(n); % x[n]

% Create noise
sigma = 0.25; % noise magnitude
v = sigma.*rand(1, N);

% Compose noisy signal
s = x + v;

% Plot original signal
figure(1);
plot(s, 'LineWidth', 2);
xlabel('n');
ylabel('s[n]');
title('Original Signal');
grid on;

% Wavelet decomposition
[cA, cD] = dwt(s, 'haar');
figure(2);
subplot(2, 1, 1);
plot(cA, 'LineWidth', 2);
xlabel('n');
ylabel('cA[n]');
title('Approximation');
grid on;
subplot(2, 1, 2);
plot(cD, 'LineWidth', 2);
xlabel('n');
ylabel('cD[n]');
title('Details');
grid on;

% Plot superposition of signal and approximation
figure();
plot(n, s, 'LineWidth', 2);
hold on;
plot(n(1:2:end), cA, 'LineWidth', 2);
xlabel('n'),
legend('Signal s[n]', 'Approximation cA[n]');
title('Signal + Approximation');
grid on;