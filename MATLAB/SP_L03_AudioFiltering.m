% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Load and plot audio signal x(t)
[x, fs] = audioread('guitartune.wav'); %x = signal, f = sample frequency
figure(1);
subplot(2, 1, 1);
plot(x);
title('Clean Audio Signal x(t)');
xlabel('t');
ylabel('x(t)');
grid on;

% Compute and plot fourier transform X(f) of audio signal x(t)
X = fft(x);
X = fftshift(X);
n = length(x);
f = (-n/2:n/2-1)*(fs/n);
figure(1);
subplot(2, 1, 2);
plot(w, abs(X), 'LineWidth', 2);
xlim([0, 1000]);
grid on;

% Add white noise
sigma = 0.1; %noise parameter
noise = sigma*randn(size(signal)); % white noise
noisy_signal = signal + noise; % noisy signal
figure();
plot(noisy_signal);
title('Noisy Audio Signal x(t) + v(t)');
xlabel('t');
ylabel('x(t) + v(t)');
grid on;

% Create low-pass filter
fc = 400; %cut-off frequency
n = 6; % filter order
[b, a] = butter(n, fc/(f/2));

% Filter audio signal
filtered_signal = filter(b, a, signal);
figure();
plot(filtered_signal);
title('Filtered signal y(t)');
xlabel('t');
ylabel('y(t)');
grid on;

x = filtered_signal;
X = fft(x);
X = fftshift(X);
n = length(x);
w = (-n/2:n/2-1)*(f/n);
figure();
plot(w, abs(X), 'LineWidth', 2);
xlim([0, 1000]);
grid on;


% Play resulting sound
player = audioplayer(filtered_signal, f);
%play(player); % play sound

%player = audioplayer(filtered_signal, frequency);
%play(player); % play sound


