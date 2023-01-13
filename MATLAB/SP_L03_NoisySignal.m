% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023
clc;
close all;

% Load audio signal
audio = load('handel'); % load audio signal
signal = audio.y; % retrieve signal
frequency = audio.Fs; % retrieve frequency
figure();
plot(signal);
title('Audio Signal x(t)');
xlabel('t');
ylabel('x(t)');
grid on;

% Add white noise
sigma = 0.25; %noise parameter
noise = sigma*randn(size(signal)); % white noise
figure();
plot(noise);
title('Noise v(t)');
xlabel('t');
ylabel('v(t)');
grid on;

noisy_signal = signal + noise; % noisy signal
figure();
plot(noisy_signal);
title('Noisy Audio Signal x(t) + v(t)');
xlabel('t');
ylabel('x(t) + v(t)');
grid on;

% Play resulting sound
player = audioplayer(noisy_signal, frequency);
play(player); % play sound

