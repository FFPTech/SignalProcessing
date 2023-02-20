% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

% Create signal
% Load audio signal x(t)
[x, Fsample] = audioread('guitartune.wav'); %x = signal, fs = sample frequency
figure(1);
subplot(2, 1, 1);
plot(x);
title('Time-Domain Audio Signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

% Compute and display Fourier spectrum of audio signal
X = fft(x); % Calculate fourier transform
X = fftshift(X); % shift Fourier spectrum towards 0 Hz
n = length(x);
f = (-n/2:n/2-1)*(Fsample/n); % define frequency range
figure(1);
subplot(2, 1, 2);
plot(f, abs(X), 'LineWidth', 2);
xlim([0, 1000]);
title('Frequency-Domain Audio Signal X(f)');
xlabel('f [Hz]');
ylabel('|X(f)|');
grid on;

% Play filtered sound
player = audioplayer(x, Fsample); 
playblocking(player); 

% Design filter
Fp = 250/(Fsample/2); 
Fs = 350/(Fsample/2);
Ap = 1; % (dB)
As = 60; %(dB)
h = designfilt( ...
    'lowpassfir', ...
    'PassbandFrequency', Fp, ...
    'StopbandFrequency', Fs, ...
    'PassbandRipple', Ap, ...
    'StopbandAttenuation', As);
fvtool(h);
info(h)

% Filter signal
y = filter(h, x);
figure(3);
subplot(2, 1, 1);
plot(y);
title('Time-Domain Filtered Audio Signal y[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Compute and display Fourier spectrum of filtered signal
Y = fft(y); % Calculate fourier transform
Y = fftshift(Y); % shift Fourier spectrum towards 0 Hz
n = length(y);
f = (-n/2:n/2-1)*(Fsample/n); % define frequency range
figure(3);
subplot(2, 1, 2);
plot(f, abs(Y), 'LineWidth', 2);
xlim([0, 1000]);
title('Frequency-Domain Filtered Audio Signal Y(f)');
xlabel('f [Hz]');
ylabel('|Y(f)|');
grid on;

% Play filtered sound
player = audioplayer(y, Fsample); 
playblocking(player); 