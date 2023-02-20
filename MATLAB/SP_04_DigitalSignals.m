% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc; % clear screen
close all; % close all windows

f = 100;
fs = 10;

t = 1:0.1:f;
ts = 1:fs:f*fs;

figure();
x = sin(2*3.14*f*t);
subplot(2, 1, 1);
plot(t, x);
xlabel('t')
ylabel('x(t)')
title('Continuous Singal')

x = sin(2*3.14*f*ts);
subplot(2, 1, 2);
stem(ts, x);
xlabel('n')
ylabel('x[n]')
title('Digital Singal');

