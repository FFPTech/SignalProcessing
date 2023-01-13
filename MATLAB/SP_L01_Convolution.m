% Prof. Dr. ir. Meshia Cédric OVENEKE
% cedric.oveneke@fitforpurpose.tech
% 2023

clc;
close all;

alpha = 0.1831;
x(1:110) = 3;
h = zeros([1 80]);
for n = 1:80
    h(n) = exp(alpha*(n-20)*0.1); 
end
y = conv(x, h);

figure();
plot(y, 'LineWidth', 2);
title('Example 1.13: Response Signal');
ylabel('y(t)');
xlabel('t');
grid on;

figure();
plot(x, 'LineWidth', 2);
title('Example 1.13: Excitation Signal');
ylabel('x(t)');
xlabel('t');
grid on;

figure();
plot(h, 'LineWidth', 2);
title('Example 1.13: Linear Time-Invariant (LTI) System');
ylabel('h(t)');
xlabel('t');
grid on;