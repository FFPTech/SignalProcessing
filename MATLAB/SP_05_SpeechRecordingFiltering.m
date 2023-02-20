% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

Fsampling = 16000; % Define sampling frequency
bitlength = 16;
channels = 1;
aro = audiorecorder(Fsampling, bitlength, channels);
disp('Start recording ...');
record(aro); % start recording
pause(10); % waits 10 seconds before next command
stop(aro); % stop recording
disp('Stop recording ...');
x = getaudiodata(aro, 'double'); % extract speech
audiowrite('myspeech.wav', x, Fsampling); % save audio
[x, Fsampling] = audioread('myspeech.wav');

% Display time-domain speech signal
figure(1);
subplot(2, 1, 1);
plot(x);
ylim([-max(abs(x)) max(abs(x))]);
title('Time-Domain Speech Signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

% Compute and display Fourier spectrum of speech signal
X = fft(x); % Calculate fourier transform
X = fftshift(X); % shift Fourier spectrum towards 0 Hz
n = length(x);
f = (-n/2:n/2-1)*(Fsampling/n); % define frequency range
figure(1);
subplot(2, 1, 2);
plot(f, abs(X), 'LineWidth', 2);
xlim([0, 2000]);
title('Frequency-Domain Speech Signal X(f)');
xlabel('f [Hz]');
ylabel('|X(f)|');
grid on;

Fp = 250;
Fs = 350;
filtertype = 'lowpass';
y = speechfiltering(x, Fsampling, filtertype, Fp, Fs); 

% Display time-domain speech signal
figure(2);
subplot(2, 1, 1);
plot(y);
ylim([-max(x) max(x)]);
title('Time-Domain Speech Signal y[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Compute and display Fourier spectrum of speech signal
Y = fft(y); % Calculate fourier transform
Y = fftshift(Y); % shift Fourier spectrum towards 0 Hz
n = length(y);
f = (-n/2:n/2-1)*(Fsampling/n); % define frequency range
figure(2);
subplot(2, 1, 2);
plot(f, abs(Y), 'LineWidth', 2);
xlim([0, 2000]);
ylim([0, max(abs(X))]);
title('Frequency-Domain Speech Signal Y(f)');
xlabel('f [Hz]');
ylabel('|Y(f)|');
grid on;

% Play filtered sound
disp('Play original speech signal x[n]');
player = audioplayer(x, Fsampling); 
playblocking(player); 

% Play filtered sound
disp('Play filtered speech signal y[n]');
player = audioplayer(y, Fsampling); 
playblocking(player); 

function y = speechfiltering(x, Fsampling, filtertype, Fp, Fs)
    % Design filter
    disp('Design filter ...');
    Ap = 1; % (dB)
    As = 60; %(dB)
    h = designfilt( ...
        [filtertype, 'fir'], ...
        'PassbandFrequency', Fp/(Fsampling/2), ...
        'StopbandFrequency', Fs/(Fsampling/2), ...
        'PassbandRipple', Ap, ...
        'StopbandAttenuation', As);
    figure();
    fvtool(h);
    
    % Apply filter
    disp('Apply filter ...');
    y = filter(h, x);
end