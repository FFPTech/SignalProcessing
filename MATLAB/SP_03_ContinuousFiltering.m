% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Load audio signal x(t)
[x, fs] = audioread('guitartune.wav'); %x = signal, fs = sample frequency
figure(1);
subplot(2, 1, 1);
plot(x);
title('Time-Domain Audio Signal x(t)');
xlabel('t [s]');
ylabel('x(t)');
grid on;

% Compute and display Fourier spectrum of audio signal
X = fft(x); % Calculate fourier transform
X = fftshift(X); % shift Fourier spectrum towards 0 Hz
n = length(x);
f = (-n/2:n/2-1)*(fs/n); % define frequency range
figure(1);
subplot(2, 1, 2);
plot(f, abs(X), 'LineWidth', 2);
xlim([0, 1000]);
title('Frequency-Domain Audio Signal X(f)');
xlabel('f [Hz]');
ylabel('|X(f)|');
grid on;

% Play audio signal
player = audioplayer(x, fs); % prepare sound generation
playblocking(player); % play generated sound using available speaker

% -------------------------------------------------

% Design and apply low-pass Butterworth filter
n = 6; % filter order
fc = 300; %cut-off frequency in Hz
wc = fc/(fs/2); % cut-off frequency in percentage (between 0 and 1)
[b, a] = butter(n, wc, 'low'); %low-pass filter coefficients
y = filter(b, a, x); % apply filter to signal x(t)
figure(2);
subplot(2, 1, 1);
plot(y);
title('Time-Domain Filtered Audio Signal y(t)');
xlabel('t [s]');
ylabel('y(t)');
grid on;

% Compute and display Fourier spectrum of audio signal
Y = fft(y); % Calculate fourier transform
Y = fftshift(Y); % shift Fourier spectrum towards 0 Hz
n = length(x);
f = (-n/2:n/2-1)*(fs/n); % define frequency range
figure(2);
subplot(2, 1, 2);
plot(f, abs(Y), 'LineWidth', 2);
xlim([0, 1000]);
title('Frequency-Domain Filtered Audio Signal Y(f)');
xlabel('f [Hz]');
ylabel('|Y(f)|');
grid on;

% Play filtered sound
player = audioplayer(y, fs); % prepare sound generation
playblocking(player); % play generated sound using available speaker

