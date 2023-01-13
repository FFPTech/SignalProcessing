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
xlabel('t [s]');
ylabel('x(t)');
grid on;

% Compute and plot fourier transform X(f) of audio signal x(t)
X = fft(x);
X = fftshift(X);
n = length(x);
f = (-n/2:n/2-1)*(fs/n);
figure(1);
subplot(2, 1, 2);
plot(f, abs(X), 'LineWidth', 2);
xlim([0, 1000]);
title('Clean Audio Signal X(f)');
xlabel('f [Hz]');
ylabel('X(f)');
grid on;

player = audioplayer(x, fs);
playblocking(player); % play sound

%===================================================
% Exercise 1: 
% -----------
% 
% Play with the cut-off frequency fc of the Butterworth filter and try to
% remove high-frequency components related to certain instruments.

% Create low-pass filter (Butterworth approximation)
fc = 600; %cut-off frequency (play with this parameter)
n = 6; % filter order
[b, a] = butter(n, fc/(fs/2));

% Recover audio signal using low-pass filter
xf = filter(b, a, x); % filtered audio signal
figure(2);
subplot(2, 1, 1);
plot(xf);
title('Recovered Audio Signal xr(t)');
xlabel('t [s]');
ylabel('xr(t)');
grid on;

% Compute and plot fourier transform Xf(f) of filtered audio signal xf(t)
Xf = fft(xf);
Xf = fftshift(Xf);
n = length(xf);
f = (-n/2:n/2-1)*(fs/n);
figure(2);
subplot(2, 1, 2);
plot(f, abs(Xf), 'LineWidth', 2);
xlim([0, 1000]);
title('Filtered Audio Signal Xf(f)');
xlabel('f [Hz]');
ylabel('Xf(f)');
grid on;

player = audioplayer(xf, fs);
playblocking(player); % play sound

%===================================================
% Exercise 2: 
% -----------
% 
% Create and ideal band-pass filter using the instruction 'rectangularPulse'
% See script SP_L02_FourierTransform.m for inspiration
% Exploit the convolution property of the Fourier transform:
% conv(x,h) = fft(x)*fft(h)

% Add code here


%===================================================
% Exercise 3: 
% -----------
% 
% Observe the fourier transform of the noisy signal and try
% remove the noisy part of the signal and only retan the clean part of the
% signal. Hint: the noisy part of the signal covers the entire frequency
% range

% Add white noise to the clean signal
sigma = 0.25; % play with this noise parameter
v = sigma*randn(size(x)); % white noise
xv = x + v; % noisy signal
figure(3);
subplot(2, 1, 1);
plot(xv);
title('Noisy Audio Signal xv(t)');
xlabel('t [s]');
ylabel('xv(t)');
grid on;

% Compute and plot fourier transform Xv(f) of noisy audio signal xv(t)
Xv = fft(xv);
Xv = fftshift(Xv);
n = length(xv);
f = (-n/2:n/2-1)*(fs/n);
figure(3);
subplot(2, 1, 2);
plot(f, abs(Xv), 'LineWidth', 2);
xlim([0, 1000]);
title('Noisy Audio Signal Xv(f)');
xlabel('f [Hz]');
ylabel('Xv(f)');
grid on;

player = audioplayer(xv, fs);
playblocking(player); % play sound
%===================================================


